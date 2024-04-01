#!/bin/bash

echo "Note This Script is in testing"
echo "Start The Script"

# Install Curl
sudo apt update
sudo apt install -y curl
# Update the system
sudo apt update
sudo apt upgrade -y

# Enable SSH root access
sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# Install Java (required for Minecraft Server)
sudo apt install -y default-jre

# Create a directory for Minecraft Server and navigate into it
mkdir MinecraftServerScript
cd MinecraftServerScript

# Download Minecraft Server Edition
curl -o minecraft_server.jar https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar

# Agree to the Minecraft EULA (This is required to run the server)
echo "eula=true" > eula.txt

# Start the Minecraft server with specified RAM allocation
java -Xms1G -Xmx6G -jar minecraft_server.jar nogui

# Create a systemd service file
cat << EOF | sudo tee /etc/systemd/system/minecraftserver.service
[Unit]
Description=Minecraft Server
After=network.target

[Service]
User=root
Nice=1
KillMode=none
SuccessExitStatus=0 1
ProtectHome=true
ProtectSystem=full
PrivateDevices=true
NoNewPrivileges=true
WorkingDirectory=/root/MinecraftServerScript
ExecStart=/usr/bin/java -Xms1G -Xmx6G -jar minecraft_server.jar nogui
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Enable and start the Minecraft server service
sudo systemctl enable minecraftserver.service
sudo systemctl start minecraftserver.service

echo "Curl is installed, system is updated, SSH root access is enabled, Java is installed, Minecraft Server Edition is downloaded, directory 'MinecraftServerScript' is created, and Minecraft server is started with 1GB minimum and 6GB maximum RAM allocation. Additionally, a systemd service named 'minecraftserver.service' is created and enabled."
