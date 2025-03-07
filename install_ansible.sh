#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Update system packages
echo "Updating system packages..."
sudo apt update
sudo apt upgrade -y

# Install software-properties-common
echo "Installing software-properties-common..."
sudo apt install software-properties-common -y

# Add Ansible PPA
echo "Adding Ansible PPA..."
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
echo "Installing Ansible..."
sudo apt install ansible -y

# Verify installation
echo "Verifying Ansible installation..."
ansible --version

echo "Ansible installation completed successfully."

