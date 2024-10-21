#!/bin/bash

# List of services to run the test script in
services=("lind_lamp_plaintext" "lind_lamp_queries" "lind_lamp_mixed" )

# Loop through each service and run the test_connectivity.sh script inside the container
for service in "${services[@]}"; do
    echo "Running test_connectivity.sh in $service..."
    
    # Execute the script inside the container using docker-compose exec
    docker-compose exec "$service" /usr/local/bin/test_connectivity.sh

    echo "--------------------------"
done
