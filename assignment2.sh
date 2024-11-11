#!/bin/bash

echo "Starting configuration script..."

# Update the package list
echo "Updating package list..."
apt update

# Install Apache and Squid
echo "Installing Apache and Squid..."
apt install -y apache2 squid

# Configure /etc/hosts
echo "Configuring /etc/hosts..."
if ! grep -q "192.168.16.21" /etc/hosts; then
    echo "192.168.16.21 server1" >> /etc/hosts
fi

# Ensure users exist and have the correct settings
users=("dennis" "aubrey" "captain" "snibbles" "brownie" "scooter" "sandy" "perrier" "cindy" "tiger" "yoda")

for user in "${users[@]}"; do
    if ! id "$user" &>/dev/null; then
        echo "Creating user $user..."
        useradd -m -s /bin/bash "$user"
    fi
done

# Set up SSH keys for dennis
echo "Setting up SSH keys for dennis..."
mkdir -p /home/dennis/.ssh
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG4rT3vTt99Ox5kndS4HmgTrKBT8SKzhK4rhGkEVGlCI student@generic-vm" > /home/dennis/.ssh/authorized_keys
chown -R dennis:dennis /home/dennis/.ssh
chmod 700 /home/dennis/.ssh
chmod 600 /home/dennis/.ssh/authorized_keys

echo "Configuration complete."
