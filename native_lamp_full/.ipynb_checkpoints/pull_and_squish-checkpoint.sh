#!/bin/bash

# Image name
IMAGE_NAME="securesystemslab/lind_ubuntu:nat_lamp_gcc4"
OUTPUT_FILE="lind_ubuntu_nat_lamp_gcc4.tar"

# Step 1: Pull the image
echo "Pulling Docker image: $IMAGE_NAME"
docker pull $IMAGE_NAME

# Step 2: Save the image to a tar file
echo "Saving the image as $OUTPUT_FILE"
docker save -o $OUTPUT_FILE $IMAGE_NAME

# Check if the save was successful
if [ $? -eq 0 ]; then
    echo "Image saved successfully as $OUTPUT_FILE"
else
    echo "Failed to save the image" >&2
    exit 1
fi

# Step 3: Delete the pulled image to save space
echo "Deleting the pulled image: $IMAGE_NAME"
docker system prune -f

echo "Script completed. Image saved to $OUTPUT_FILE and deleted from Docker."
