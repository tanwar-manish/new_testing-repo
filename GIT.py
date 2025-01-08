import os
import subprocess
import pandas as pd
import re

# Function to execute shell commands and get output
def run_command(command):
    try:
        # Run the command without shell=True to avoid issues with command execution
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

# Step 7: Set remote origin (if not already set)
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

# Step 10: Stage modified files (add all files)
print("Staging modified files...")
run_command(["git", "add", "."])

# Step 11: Commit the changes with the commit message from Excel
commit_output = run_command(["git", "commit", "-m", commit_message])
if commit_output:
    print(commit_output)

# Step 12: Pull the latest changes from the remote feature branch
print("Pulling latest changes from remote...")
pull_output = run_command(["git", "pull", "origin", feature_branch, "--allow-unrelated-histories"])
if pull_output:
    print(pull_output)

# Step 13: Push the changes to the remote repository
print(f"Pushing changes to the {feature_branch} branch...")
push_output = run_command(["git", "push", "origin", feature_branch])
if push_output:
    print(push_output)

print("Git operations completed successfully!")
