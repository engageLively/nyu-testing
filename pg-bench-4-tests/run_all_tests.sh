#!/bin/bash

# Get the root directory where the script is located
ROOT_DIR=$(pwd)

# Generate a timestamped log file
timestamp=$(date +"%Y%m%d_%H%M%S")
log_file="$ROOT_DIR/test_run_$timestamp.log"

# List of subdirectories with their corresponding playbooks
declare -A playbooks=(
    ["lind"]="ansible-lind.yaml"
    ["native"]="ansible-native.yaml"
    ["python-lind"]="ansible-python-lind.yaml"
    ["python-native"]="ansible-python-native.yaml"
    ["raw-posix"]="ansible-raw-posix.yaml"
)

# Track failures
failures=()

# Start logging with tee to capture output to both screen and log file
{
    echo "Starting test run at $(date)"
    
    # Loop through each directory and run the playbook
    for dir in "${!playbooks[@]}"; do
        playbook="${playbooks[$dir]}"
        
        # Change to the directory
        cd "$ROOT_DIR/$dir" || { 
            echo "Failed to enter directory $ROOT_DIR/$dir" 
            failures+=("$dir")
            continue 
        }
        
        # Run the Ansible playbook
        echo "Running playbook $playbook in $dir"
        ansible-playbook "$playbook"
        
        # Check if the playbook ran successfully
        if [[ $? -ne 0 ]]; then
            echo "Playbook $playbook in $dir failed"
            failures+=("$dir")
        fi
        
        # Return to the root directory
        cd "$ROOT_DIR" || exit 1
    done

    # Display results
    echo "All playbooks completed."
    if [ ${#failures[@]} -ne 0 ]; then
        echo "The following playbooks failed:"
        for failed_dir in "${failures[@]}"; do
            echo "- $failed_dir"
        done
    else
        echo "All playbooks ran successfully."
    fi

    echo "Test run completed at $(date)"

} | tee "$log_file"  # Use tee to output to both console and log file
