#!/bin/bash
# Update and install Docker + Docker Compose
apt-get update -y
apt-get upgrade -y
apt-get install -y docker.io docker-compose git

# Enable Docker on boot
systemctl enable docker
systemctl start docker

# Clone repo if it doesn't exist
cd /opt
if [ ! -d "selfhost" ]; then
  git clone https://github.com/yourusername/yourrepo.git selfhost
fi

cd selfhost/docker

# Load .env variables
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Start Docker Compose
docker-compose up -d
