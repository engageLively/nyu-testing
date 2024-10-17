#!/bin/bash

# Function to download a Google Drive file by bypassing the virus scan
download_file() {
    file_id=$1
    file_name=$2

    # Get the initial page to grab the confirmation token and cookie
    curl -sc /tmp/gcookie "https://drive.google.com/uc?export=download&id=${file_id}" > /tmp/gpage.html

    # Extract the confirmation token from the HTML page
    confirm=$(grep -oP 'confirm=\K[^&]+' /tmp/gpage.html)

    # Use the token and cookie to download the actual file
    curl -Lb /tmp/gcookie "https://drive.google.com/uc?export=download&confirm=${confirm}&id=${file_id}" -o ${file_name}
}

# Download lind_micro.tar.gz
download_file "14X3iLKllFkMVnrPnWMEyW-8UC9XCQzg0" "lind_micro.tar.gz"

# Download lind_write.tar.gz
download_file "1vNo5RKnB5cuovper4Ut-Xuz62MI5I6Hl" "lind_write.tar.gz"
