import os
import subprocess
import git
import pandas as pd

def check_untracked_files(repo_dir):
    """Check for untracked files in the repository."""
    repo = git.Repo(repo_dir)
    untracked_files = repo.git.status('--porcelain').split('\n')
    untracked_files = [file[3:].strip() for file in untracked_files if file.startswith('??')]
    return untracked_files

def handle_untracked_files(repo_dir, untracked_files):
    """Handle untracked files: stash them or ask to remove."""
    if untracked_files:
        print("Untracked files found in the repository:")
        for file in untracked_files:
            print(f"- {file}")
        
        user_choice = input("Do you want to stash or remove these files? (stash/remove): ").strip().lower()
        
        if user_choice == "stash":
            print("Stashing untracked files...")
            subprocess.run(['git', 'stash', 'push', '-u'], cwd=repo_dir)  # -u stashes untracked files
            print("Untracked files have been stashed.")
        elif user_choice == "remove":
            print("Removing untracked files...")
            for file in untracked_files:
                file_path = os.path.join(repo_dir, file)
                if os.path.exists(file_path):
                    os.remove(file_path)
            print("Untracked files have been removed.")
        else:
            print("Invalid choice. Aborting operation.")
            return False
    return True

def initialize_git_repo(base_directory, repo_url):
    """Initialize Git repository if it doesn't exist."""
    repo_dir = os.path.join(base_directory)
    
    if not os.path.isdir(os.path.join(repo_dir, '.git')):
        print("Initializing Git repository...")
        subprocess.run(['git', 'init'], cwd=repo_dir)
        subprocess.run(['git', 'remote', 'add', 'origin', repo_url], cwd=repo_dir)
        subprocess.run(['git', 'fetch', 'origin'], cwd=repo_dir)
        print("Git repository initialized.")
    else:
        print("Git repository already initialized.")
    return repo_dir

def create_feature_branch(repo_dir, release_branch, feature_branch):
    """Create and checkout the feature branch based on the release branch."""
    repo = git.Repo(repo_dir)

    # Check if there are untracked files and handle them
    untracked_files = check_untracked_files(repo_dir)
    if not handle_untracked_files(repo_dir, untracked_files):
        return

    print(f"Creating and checking out feature branch '{feature_branch}'...")
    try:
        repo.git.checkout(release_branch)  # Checkout release branch
        repo.git.checkout('-b', feature_branch)  # Create and checkout feature branch
        print(f"Feature branch '{feature_branch}' created and checked out.")
    except git.exc.GitCommandError as e:
        print(f"Error creating or checking out feature branch: {e}")

def commit_and_push_changes(repo_dir, commit_msg):
    """Commit the changes and push to remote repository."""
    repo = git.Repo(repo_dir)
    
    try:
        print(f"Committing changes with message: {commit_msg}")
        repo.git.add('--all')  # Add all changes
        repo.index.commit(commit_msg)  # Commit changes
        print(f"Changes committed: {commit_msg}")
        
        print("Pushing changes to remote...")
        repo.git.push('origin', repo.active_branch.name)  # Push to the current branch
        print("Changes pushed to remote repository.")
    except git.exc.GitCommandError as e:
        print(f"Error committing or pushing changes: {e}")

def create_pull_request(repo_dir, release_branch, feature_branch):
    """Create a pull request using GitHub CLI."""
    gh_command = "gh"
    
    print(f"Creating pull request from {feature_branch} to {release_branch}...")
    command = [
        gh_command, "pr", "create", 
        "--base", release_branch, 
        "--head", feature_branch, 
        "--title", f"Merge {feature_branch} into {release_branch}",
        "--body", f"Automated PR to merge feature branch {feature_branch} into release branch {release_branch}."
    ]
    
    try:
        subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        print(f"Pull request created successfully from {feature_branch} to {release_branch}.")
    except subprocess.CalledProcessError as e:
        print(f"Error creating pull request: {e}")
        print(f"Standard Output: {e.stdout}")
        print(f"Standard Error: {e.stderr}")

def perform_git_operations(base_directory, excel_file):
    """Perform all Git operations including branch creation, commit, push, and PR creation."""
    # Read the parameter file (excel file) to extract repo URL, release branch, and commit message
    df = pd.read_excel(excel_file)
    
    repo_url = df['repo_url'].iloc[0]
    release_branch = df['release_branch'].iloc[0]
    commit_msg = df['Commit_Message'].iloc[0]
    
    print(f"Using repo_url: {repo_url}")
    print(f"Using release_branch: {release_branch}")
    print(f"Commit message: {commit_msg}")
    
    repo_dir = initialize_git_repo(base_directory, repo_url)

    feature_branch = f"Feature_Datahub_{release_branch[-5:]}"
    create_feature_branch(repo_dir, release_branch, feature_branch)
    commit_and_push_changes(repo_dir, commit_msg)
    create_pull_request(repo_dir, release_branch, feature_branch)

