#!/bin/bash

apt-get update -y
apt-get upgrade -y
echo "Updated"
apt install sudo
echo "Sudo is installed"
# Ask the user to make a username and password 


read -p "Enter username: " username

read -s -p "Enter password: " password
echo

sudo useradd -m "$username"

echo "$username:$password" | sudo chpasswd

echo "User $username has been created."
