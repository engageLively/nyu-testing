# wrk Dockerfile
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    unzip # Add unzip

# Clone and build wrk
RUN git clone https://github.com/wg/wrk.git /usr/local/src/wrk && \
    cd /usr/local/src/wrk && \
    make

# Add wrk to the PATH
RUN ln -s /usr/local/src/wrk/wrk /usr/local/bin/wrk

# Default command (you can override it in the docker-compose.yml)
CMD ["tail", "-f", "/dev/null"]
