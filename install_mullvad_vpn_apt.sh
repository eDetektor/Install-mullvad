#!/bin/bash

# abort on error
set -e

sudo apt install -y curl

# Download the Mullvad signing key
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc

# Add the Mullvad repository
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$(dpkg --print-architecture)] https://repository.mullvad.net/deb/stable stable main" > /etc/apt/sources.list.d/mullvad.list

# Update and install
apt update
apt install -y mullvad-vpn
