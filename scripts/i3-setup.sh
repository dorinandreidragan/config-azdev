#!/bin/bash

# Update package list
echo 'Updating package list...'
sudo apt update

# Install i3 window manager
echo 'Installing i3 window manager...'
sudo apt install -y i3

# Configure i3 window manager
echo 'Configuring i3 window manager...'
mkdir -p ~/.config/i3
cp /etc/i3/config ~/.config/i3/config

# Set the mod key to the Alt key
echo 'Setting the mod key to the Alt key...'
sed -i 's/Mod4/Mod1/g' ~/.config/i3/config

# Install gnome-terminal
echo 'Installing gnome-terminal...'
sudo apt install -y gnome-terminal

# Set the default terminal to gnome-terminal
echo 'Setting the default terminal to gnome-terminal...'
sed -i 's/exec i3-sensible-terminal/exec gnome-terminal/g' ~/.config/i3/config

echo 'i3 window manager installation and configuration complete!'
