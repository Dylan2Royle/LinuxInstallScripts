#!/bin/bash

# Update and upgrade system
apt-get update -y
apt-get upgrade -y
echo "System updated"

# Install sudo with automatic confirmation
apt install sudo -y
echo "Sudo is installed"
