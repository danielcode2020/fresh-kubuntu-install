#!/usr/bin/env bash
set -euo pipefail

echo "Updating system..."
sudo apt update
sudo apt upgrade -y

echo "Installing APT packages..."
sudo apt install -y \
  curl \
  git \
  openssh-client \
  maven \
  mpv \
  unzip \
  lsb-release \
  ca-certificates

echo "Installing Snap packages..."
sudo snap install intellij-idea --classic
sudo snap install teams-for-linux
sudo snap install slack --classic
sudo snap install obsidian --classic
sudo snap install telegram-desktop
sudo snap install pinta

echo "Installing Brave Browser..."
curl -fsS https://dl.brave.com/install.sh | sh

echo "Installing AWS CLI..."
curl -fsS https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
unzip -o awscliv2.zip
sudo ./aws/install --update
rm -rf awscliv2.zip aws/

echo "Installing SDKMAN..."
curl -s https://get.sdkman.io | bash

# Load SDKMAN if running interactively
if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

echo "Installing OpenVPN 3..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://packages.openvpn.net/packages-repo.gpg | \
  sudo tee /etc/apt/keyrings/openvpn.asc > /dev/null

DISTRO=$(lsb_release -c -s)

echo "deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian $DISTRO main" | \
  sudo tee /etc/apt/sources.list.d/openvpn-packages.list > /dev/null

sudo apt update
sudo apt install -y openvpn3

echo "Setup complete ✅"

### Config and run openvpn3
# openvpn3 config-import --config /file/to/profile.ovpn --name CloudConnexa --persistent
# openvpn3 config-acl --show --lock-down true --grant root --config CloudConnexa

### Useful alias for vpn start and check status
# alias vpnstatus='sudo systemctl status openvpn3-session@CloudConnexa.service'
# alias vpnup='sudo systemctl enable --now openvpn3-session@CloudConnexa.service'

