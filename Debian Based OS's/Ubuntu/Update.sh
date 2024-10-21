#!/bin/bash

# Update and upgrade system
apt-get update -y
apt-get upgrade -y
echo "System updated"

# Install sudo with automatic confirmation
apt install sudo -y
echo "Sudo is installed"

# Ask the user to make a username and password
read -p "Enter username: " username

# Prompt for password with hidden input
read -s -p "Enter password: " password
echo
read -s -p "Confirm password: " password_confirm
echo

# Check if password and confirmation match
if [ "$password" != "$password_confirm" ]; then
  echo "Passwords do not match."
  exit 1
fi

# Create user and set password
sudo useradd -m "$username"
echo "$username:$password" | sudo chpasswd

# Add the new user to the sudo group
sudo usermod -aG sudo "$username"

echo "User $username has been created and added to sudo group."
