#!/bin/bash

# Get the root directory where the script is located
ROOT_DIR=$(pwd)

# Generate a timestamped log file
timestamp=$(date +"%Y%m%d_%H%M%S")
log_file="$ROOT_DIR/test_run_$timestamp.log"

# List of subdirectories with their corresponding playbooks
declare -A playbooks=(
    ["lind"]="ansible-lind.yaml"
    #["native"]="ansible-native.yaml"
    #["python-lind"]="ansible-python-lind.yaml"
    #["python-native"]="ansible-python-native.yaml"
    #["raw-posix"]="ansible-raw-posix.yaml"
)

failures=()

{
    echo "Starting test run at $(date)"
    
    # Run docker-cleanup.yaml playbook before any other tests
    echo "Running docker cleanup playbook (initial)"
    docker_cleanup_output=$(ansible-playbook "$ROOT_DIR/docker-cleanup.yaml" 2>&1)
    echo "$docker_cleanup_output"
    if [[ $? -ne 0 ]]; then
        echo "Docker cleanup failed at the start"
        failures+=("docker-cleanup (initial)")
    fi
    
    for dir in "${!playbooks[@]}"; do
        playbook="${playbooks[$dir]}"
        
        # Run docker-cleanup.yaml before each individual playbook
        echo "Running docker cleanup playbook before $playbook"
        docker_cleanup_output=$(ansible-playbook "$ROOT_DIR/docker-cleanup.yaml" 2>&1)
        echo "$docker_cleanup_output"
        if [[ $? -ne 0 ]]; then
            echo "Docker cleanup failed before $playbook"
            failures+=("$playbook (docker cleanup)")
        fi
        
        # Change to the directory
        cd "$ROOT_DIR/$dir" || { 
            echo "Failed to enter directory $ROOT_DIR/$dir" 
            failures+=("$dir")
            continue 
        }
        
        # Run the main Ansible playbook and capture output
        echo "Running playbook $playbook in $dir"
        playbook_output=$(ansible-playbook "$playbook" 2>&1)
        echo "$playbook_output"
        
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
