#!/bin/bash

# Run the following command to unistall all conflicting packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install prerequisites for Docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

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
sudo apt install -y ansible

# Verify Ansible installation
ansible --version

