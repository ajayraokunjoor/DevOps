#!/bin/bash

# Install Docker on Kali Linux (Debian-based)
set -e  # Exit on error

echo "[+] Installing Docker on Kali Linux..."

# Remove old versions
sudo apt remove -y docker.io docker-engine containerd runc || true

# Install dependencies
sudo apt update
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common

# Add Docker's GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker's stable repo (Kali uses Debian repos)
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Start and enable Docker
sudo systemctl enable --now docker

# Test Docker
sudo docker run hello-world

# Add current user to Docker group (optional)
if ! groups $USER | grep -q docker; then
    sudo usermod -aG docker $USER
    echo "[!] User $USER added to 'docker' group. Log out and back in to apply changes."
fi

echo "[+] Docker installed successfully! Run 'docker --version' to verify."
