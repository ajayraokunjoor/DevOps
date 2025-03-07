#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root"
  exit 1
fi

# Prompt for username and password
read -p "Enter username: " USERNAME
read -s -p "Enter password: " PASSWORD
echo

# Create the user with a home directory and set the default shell to /bin/bash
useradd -m -s /bin/bash "$USERNAME"

# Check if the user was created successfully
if [ $? -ne 0 ]; then
  echo "Failed to create user $USERNAME"
  exit 1
fi

# Set the password for the user
echo "$USERNAME:$PASSWORD" | chpasswd

# Check if the password was set successfully
if [ $? -ne 0 ]; then
  echo "Failed to set password for $USERNAME"
  exit 1
fi

# Copy default files to the user's home directory
cp -r /etc/skel/* /home/"$USERNAME"

# Set ownership of the home directory
chown -R "$USERNAME":"$USERNAME" /home/"$USERNAME"

echo "User $USERNAME has been created successfully."

# Verify the user's details
id "$USERNAME"

