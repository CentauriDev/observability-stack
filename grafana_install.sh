#!/bin/bash

# Update package lists
sudo apt update -y

# Install required packages
sudo apt install -y apt-transport-https software-properties-common wget

# Create directory for GPG key (if it doesn't exist)
sudo mkdir -p /etc/apt/keyrings/

# Download and import Grafana GPG key
wget -qO - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

# Add Grafana repository
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# Update package lists again
sudo apt update -y

# Install Grafana
sudo apt install -y grafana

echo "Grafana installation complete!"

# Start servers
sudo systemctl start grafana-server
sudos ystemctl enable grafana-server

