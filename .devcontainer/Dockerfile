FROM mcr.microsoft.com/devcontainers/flutter:1-ubuntu-22.04

# Install additional tools
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    unzip \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Verify Flutter installation
RUN flutter doctor -v || true

# Set up work directory
WORKDIR /workspace

# Copy startup script
COPY .devcontainer/post-create.sh /usr/local/bin/post-create.sh
RUN chmod +x /usr/local/bin/post-create.sh

# Run setup on container start
RUN /usr/local/bin/post-create.sh
