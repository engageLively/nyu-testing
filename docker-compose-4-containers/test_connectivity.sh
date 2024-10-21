#!/bin/bash

# Get the hostname of the current container
current_container=$(hostname)

# List of all containers to ping
containers=("lind_lamp_plaintext" "lind_lamp_queries" "lind_lamp_mixed" "lind_nginx_static")

# Loop through each container and ping it, excluding the current one
for container in "${containers[@]}"; do
    if [[ "$container" != "$current_container" ]]; then
        echo "Pinging $container from $current_container..."

        # Try to ping the container
        if ping -c 1 "$container" &> /dev/null; then
            echo "$container is reachable."
        else
            echo "$container is NOT reachable."
        fi

        echo "--------------------------"
    else
        echo "Skipping ping to self ($current_container)."
        echo "--------------------------"
    fi
done
