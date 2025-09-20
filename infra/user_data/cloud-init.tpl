#!/bin/bash

set -e  # exit immediately if a command fails

apt-get update -y
apt-get upgrade -y

apt-get install -y docker.io docker-compose git
systemctl enable docker
systemctl start docker

# Create target directory
TARGET_DIR="/opt/kuma-and-vaultwarden"
mkdir -p $TARGET_DIR

#Clone Git repo
if [ ! -d "$TARGET_DIR/.git" ]; then
    git clone https://github.com/ahmad-44/uptimeKuma-vaultWarden_deploy_aws.git $TARGET_DIR
else
    cd $TARGET_DIR
    git pull
fi

# Create .env securely
cat <<EOF > $TARGET_DIR/docker/.env
ADMIN_TOKEN=${ADMIN_TOKEN}
EOF


cd $TARGET_DIR/docker
docker-compose up -d
