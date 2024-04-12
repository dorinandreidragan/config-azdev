#!/bin/bash

# TODO: you should replace the version with the one you downloaded
PULSE_VERSION="22.6r1.0-b26825"
PULSE_FILENAME="ps-pulse-linux-$PULSE_VERSION-64bit-installer.deb"

# Update package list
echo 'Updating package list...'
sudo apt update

# Install dependencies for Pulse Secure
echo 'Installing dependencies...'
sudo apt install -y \
  acl \
  bzip2 \
  libnss3-tools \
  libwebkit2gtk-4.0-37 \
  libgtkmm-3.0-1v5

# Install the *.deb package and choose yes to keep the old configuration
echo 'Installing Pulse Secure...'
Y | sudo dpkg -i $PULSE_FILENAME

# Install the Chrome Embedded Framework
echo 'Installing Chrome Embedded Framework...'
sudo /opt/pulsesecure/bin/setup_cef.sh install

# Add pulsesecure to user profile PATH
echo 'Adding Pulse Secure to PATH...'
echo 'export PATH=$PATH:/opt/pulsesecure/bin' >> ~/.profile

echo 'Pulse Secure installation complete!'
