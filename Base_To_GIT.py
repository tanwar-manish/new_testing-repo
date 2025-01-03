import os
import shutil
import logging

# Function to copy .sql files from base directory to Git_Operation folder
def Base_to_Git():
    # Get the current working directory (base directory)
    base_dir = os.getcwd()
    
    # Path to the Git_Operation folder
    git_operation_dir = os.path.join(base_dir, 'Git_Operation')
    
    # Check if Git_Operation folder exists
    if not os.path.exists(git_operation_dir):
        logging.error("Git_Operation folder does not exist in the current directory.")
        return
    
    # Feature branch name (replace this with the actual feature branch name, e.g. 'Feature_Datahub_FY25Q1')
    feature_branch_name = 'Feature_Datahub_FY25Q1'
    
    # Path to the feature branch folder inside Git_Operation
    feature_branch_dir = os.path.join(git_operation_dir, feature_branch_name)
    
    # Check if the feature branch directory exists
    if not os.path.exists(feature_branch_dir):
        logging.error(f"Feature branch folder '{feature_branch_name}' does not exist in Git_Operation.")
        return
    
    # Iterate through all folders in the base directory (excluding 'Git_Operation' and 'log' folders)
    for folder in os.listdir(base_dir):
        folder_path = os.path.join(base_dir, folder)
        
        if os.path.isdir(folder_path) and folder not in ['Git_Operation', 'log' , 'Processed_Files_GIT']:
            logging.info(f"Processing folder: {folder}")
            
            # Check if the corresponding folder exists in the feature branch directory
            target_folder = os.path.join(feature_branch_dir, folder)
            
            # Create the folder in the feature branch if it doesn't exist
            if not os.path.exists(target_folder):
                os.makedirs(target_folder)
                logging.info(f"Created folder: {target_folder}")
            
            # Iterate over all files inside the folder (only .sql files)
            for filename in os.listdir(folder_path):
                source_file = os.path.join(folder_path, filename)
                
                # Check if it's a file and has a .sql extension
                if os.path.isfile(source_file) and filename.endswith('.sql'):
                    target_file = os.path.join(target_folder, filename)

                    # If the file exists in the target folder, replace it
                    if os.path.exists(target_file):
                        logging.info(f"Replacing existing file: {filename}")
                        os.remove(target_file)

                    # Copy the file to the target folder
                    shutil.copy2(source_file, target_file)
                    logging.info(f"Copied file: {filename} to {target_folder}")

# # Call the function to test
# Base_to_Git()
