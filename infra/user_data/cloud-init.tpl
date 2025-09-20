#!/bin/bash
# ======================================================
# Cloud-init script to set up Docker, Docker Compose,
# Vaultwarden, and Uptime Kuma on Ubuntu EC2
# ======================================================

set -e  # exit immediately if a command fails

# --------------------------
# 1️⃣ Update system packages
# --------------------------
apt-get update -y
apt-get upgrade -y

# --------------------------
# 2️⃣ Install Docker, Docker Compose, Git
# --------------------------
apt-get install -y docker.io docker-compose git
systemctl enable docker
systemctl start docker

# --------------------------
# 3️⃣ Create target directory
# --------------------------
TARGET_DIR="/opt/kuma-and-vaultwarden"
mkdir -p $TARGET_DIR

# --------------------------
# 4️⃣ Clone Git repo
# --------------------------
if [ ! -d "$TARGET_DIR/.git" ]; then
    git clone https://github.com/ahmad-44/uptimeKuma-vaultWarden_deploy_aws.git $TARGET_DIR
else
    cd $TARGET_DIR
    git pull
fi

# --------------------------
# 5️⃣ Create .env securely
# --------------------------
# Terraform will replace ${ADMIN_TOKEN} with the sensitive value at runtime
cat <<EOF > $TARGET_DIR/docker/.env
ADMIN_TOKEN=${ADMIN_TOKEN}
EOF

# --------------------------
# 6️⃣ Start Docker Compose
# --------------------------
cd $TARGET_DIR/docker
docker-compose up -d

# --------------------------
# 7️⃣ Show running containers
# --------------------------
docker ps
echo "Vaultwarden and Uptime Kuma should now be running on ports 8080 and 3001."
