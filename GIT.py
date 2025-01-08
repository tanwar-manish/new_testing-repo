import os
import subprocess
import pandas as pd
import re

# Function to execute shell commands and get output
def run_command(command):
    try:
        result = subprocess.run(command, text=True, check=True, capture_output=True)
        return result.stdout
    except subprocess.CalledProcessError as e:
        print(f"Error executing command: {e}")
        print(f"Error output: {e.stderr}")
        return None

# Function to check if Git is installed
def check_git_installed():
    try:
        result = subprocess.run(['git', '--version'], capture_output=True, text=True, check=True)
        print(f"Git version: {result.stdout}")
    except subprocess.CalledProcessError:
        print("Git is not installed or not in the PATH!")
        exit()

# Function to get files to stage (modified or untracked files)
def get_files_to_add():
    # Run 'git status' to get the list of modified and untracked files
    status_output = run_command(["git", "status", "--porcelain"])

    if not status_output:
        return []

    # List of files to add (modified or untracked files)
    files_to_add = []

    for line in status_output.splitlines():
        status, file = line.split(maxsplit=1)
        if status in ["M", "A"]:  # 'M' for modified, 'A' for added
            files_to_add.append(file)

    return files_to_add

# Step 1: Set the project directory to the path where the script is located
project_directory = os.path.dirname(os.path.realpath(__file__))
excel_file = os.path.join(project_directory, 'Parameter.xlsx')

# Check if git is installed
check_git_installed()

# Step 2: Read the Parameter.xlsx file to get the repo_url, release_branch, Commit_Message
try:
    df = pd.read_excel(excel_file)
except Exception as e:
    print(f"Error reading the Excel file: {e}")
    exit()

# Extract the repo_url, release_branch, and Commit_Message from the first row
repo_url = df['repo_url'].iloc[0] if pd.notna(df['repo_url'].iloc[0]) else None
release_branch = df['release_branch'].iloc[0] if pd.notna(df['release_branch'].iloc[0]) else None
commit_message = df['Commit_Message'].iloc[0] if pd.notna(df['Commit_Message'].iloc[0]) else "Default commit message"

if not repo_url or not release_branch:
    print("Error: repo_url or release_branch are missing in the first row!")
    exit()

# Step 3: Extract fiscal year and quarter from the release branch
release_branch_pattern = r"LMS-rel(FY\d{2}Q\d)"  # Regex pattern to capture 'FYxxQx'
match = re.search(release_branch_pattern, release_branch)

if not match:
    print(f"Error: Release branch '{release_branch}' does not match the expected pattern.")
    exit()

fiscal_year_quarter = match.group(1)

# Step 4: Create the feature branch name based on the release branch
feature_branch = f"Feature_Datahub_{fiscal_year_quarter}{'-OC' if 'OC' in release_branch else '-ER' if 'ER' in release_branch else ''}"
print(f"Feature branch name: {feature_branch}")

# Step 5: Navigate to project directory
os.chdir(project_directory)

# Step 6: Initialize git repository if not already initialized
if not os.path.isdir(os.path.join(project_directory, ".git")):
    print("Initializing git repository...")
    run_command(["git", "init"])

# Step 7: Check if remote origin exists and add if it doesn't
remotes = run_command(["git", "remote", "get-url", "origin"])
if remotes is None:
    print("Setting up remote repository...")
    run_command(["git", "remote", "add", "origin", repo_url])

# Step 8: Check current status and confirm we're on the correct branch
status = run_command(["git", "status"])
if status:
    print(status)

# Step 9: Check if the feature branch exists locally, if not, create it
branch_check = run_command(["git", "branch", "--list", feature_branch])
if feature_branch not in branch_check:
    print(f"Feature branch {feature_branch} does not exist locally. Creating it...")
    run_command(["git", "checkout", "-b", feature_branch])

# Ensure that the release branch exists locally (fetch if necessary)
print(f"Ensuring release branch '{release_branch}' exists locally...")
run_command(["git", "fetch", "origin", release_branch])

# Step 10: Check if there are merge conflicts and resolve them
merge_status = run_command(["git", "status"])
if "unmerged paths" in merge_status:
    print("There are merge conflicts. Please resolve them manually before proceeding.")
    print("To abort the merge, use: git merge --abort")
    print("Once conflicts are resolved, use: git add <file> to stage and then 'git commit' to finish.")
    exit()

# Step 11: Stage modified files, excluding ignored ones
files_to_add = get_files_to_add()
if files_to_add:
    print("Staging modified files...")
    for file in files_to_add:
        run_command(["git", "add", file])
else:
    print("No files to stage.")

# Step 12: Commit the changes with the commit message from Excel
commit_output = run_command(["git", "commit", "-m", commit_message])
if commit_output:
    print(commit_output)

# Step 13: Pull the latest changes from the remote feature branch
print("Pulling latest changes from remote...")
pull_output = run_command(["git", "pull", "origin", feature_branch, "--allow-unrelated-histories"])
if pull_output:
    print(pull_output)

# Step 14: Push the changes to the remote repository
print(f"Pushing changes to the {feature_branch} branch...")
push_output = run_command(["git", "push", "origin", feature_branch])
if push_output:
    print(push_output)

# Function to create a pull request
def create_pull_request(repo_dir, release_branch, feature_branch):
    gh_command = "gh"
    
    # Check if the provided directory is a Git repository
    if not os.path.isdir(os.path.join(repo_dir, ".git")):
        print(f"Error: The directory {repo_dir} is not a Git repository. Please make sure it's initialized.")
        return

    # Change the working directory to the Git repository
    os.chdir(repo_dir)
    
    # Ensure that the feature branch exists locally
    feature_branch_check = subprocess.run(
        ['git', 'branch', '--list', feature_branch], 
        stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
    )
    if feature_branch_check.stdout.strip() == '':
        print(f"Error: The feature branch '{feature_branch}' does not exist in the repository.")
        return

    # Command to create the pull request
    command = [
        gh_command, "pr", "create", 
        "--base", release_branch, 
        "--head", feature_branch, 
        "--title", f"Merge {feature_branch} into {release_branch}",
        "--body", f"Automated PR to merge feature branch {feature_branch} into release branch {release_branch}."
    ]

    try:
        # Run the command to create the pull request
        result = subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        print(f"Pull request created successfully from {feature_branch} to {release_branch}.")
    except subprocess.CalledProcessError as e:
        # If an error occurs, print details for debugging
        print(f"Error occurred while creating the pull request: {e}")
        print(f"Standard Output: {e.stdout}")
        print(f"Standard Error: {e.stderr}")

# Step 15: Call the create_pull_request function
create_pull_request(project_directory, release_branch, feature_branch)

# Step 16: Ask the developer if they want to merge the feature branch into the release branch
merge_response = input(f"Do you want to merge the feature branch '{feature_branch}' into the release branch '{release_branch}'? (Y/N): ").strip().lower()

# Step 17: Handle merge action based on user input
if merge_response == 'y':
    print(f"Merging feature branch {feature_branch} into {release_branch}...")
    
    # Checkout the release branch
    run_command(["git", "checkout", release_branch])
    
    # Merge the feature branch into the release branch
    run_command(["git", "merge", feature_branch])
    print(f"Feature branch {feature_branch} merged into {release_branch} successfully.")

    # Push the merged changes to the remote
    print(f"Pushing the merged changes to the remote repository...")
    run_command(["git", "push", "origin", release_branch])
    print("Merged changes pushed to the remote repository.")

elif merge_response == 'n':
    print(f"Merge action aborted. Feature branch '{feature_branch}' was not merged into release branch '{release_branch}'.")
else:
    print("Invalid input. Merge action skipped.")
