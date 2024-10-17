# Flask Dockerfile
FROM ubuntu:22.04

# Install Python and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# Install Flask
RUN pip3 install Flask

# Copy application files
COPY ./app /app

# Set working directory
WORKDIR /app

# Expose port 5000 for Flask
EXPOSE 5000

# Command to run Flask server
CMD ["python3", "app.py"]
