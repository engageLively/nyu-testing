#!/bin/bash

# Get the root directory where the script is located
ROOT_DIR=$(pwd)

# Generate a timestamped folder for logs
timestamp=$(date +"%Y%m%d_%H%M%S")
log_folder="$ROOT_DIR/logs/$timestamp"
mkdir -p "$log_folder"  # Create the logs folder if it doesn't exist

# List of subdirectories with their corresponding playbooks
declare -A playbooks=(
    ["lind"]="ansible-lind.yaml"
    ["native"]="ansible-native.yaml"
    ["python-lind"]="ansible-python-lind.yaml"
    ["python-native"]="ansible-python-native.yaml"
    ["raw-posix"]="ansible-raw-posix.yaml"
)

failures=()
iterations=1  # Default number of iterations

# Check if the optional argument for loop count is provided
if [[ ! -z "$1" ]]; then
    iterations=$1
fi

echo "Starting test run at $(date)"
echo "Logs will be stored in $log_folder"

# Loop n times (or once by default)
for i in $(seq 1 "$iterations"); do
    echo "Iteration $i of $iterations"
    
    for dir in "${!playbooks[@]}"; do
        playbook="${playbooks[$dir]}"
        
        # Define log files for each playbook
        cleanup_log="$log_folder/${dir}_docker_cleanup_$timestamp.log"
        playbook_log="$log_folder/${dir}_playbook_run_$timestamp.log"

        # Run docker-cleanup.yaml before each individual playbook
        #echo "Running docker cleanup playbook before $playbook (logs in $cleanup_log)"
        #( 
        #    ansible-playbook "$ROOT_DIR/docker-cleanup.yaml" > "$cleanup_log" 2>&1
        #    if [[ $? -ne 0 ]]; then
        #        echo "Docker cleanup failed for $playbook, check $cleanup_log"
        #        failures+=("$playbook (docker cleanup)")
        #    fi
        #) &

        # Run each playbook in the background and log output to its own file
        echo "Running playbook $playbook in $dir (logs in $playbook_log)"
        (
            cd "$ROOT_DIR/$dir" || { 
                echo "Failed to enter directory $ROOT_DIR/$dir" 
                failures+=("$dir")
                exit 1
            }
            
            ansible-playbook "$playbook" > "$playbook_log" 2>&1
            if [[ $? -ne 0 ]]; then
                echo "Playbook $playbook in $dir failed, check $playbook_log"
                failures+=("$dir")
            fi
        ) &
    done

    # Wait for all background jobs to finish before moving to the next iteration
    wait
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
