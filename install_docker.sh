#!/bin/bash

# Run the following command to unistall all conflicting packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Update and upgrade the system
sudo apt-get update 

# Install prerequisites for Docker
# sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
sudo apt-get install ca-certificate curl
sudo install -m 0755 -d /etc/apt/keyrings

# Add Docker's official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc 
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index again
sudo apt update

# Install Docker CE
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start Docker service
# sudo systemctl start docker

# Enable Docker to start on boot
# sudo systemctl enable docker

# Verify that the installation is successful by running below image. 
sudo docker run hello-world

# Verify Docker installation
docker --version

# Install Ansible
#sudo apt install -y ansible

# Verify Ansible installation
#ansible --version

