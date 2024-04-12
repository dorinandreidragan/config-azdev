#!/bin/bash

# VNC password retrieved from environment variable (replace with your actual variable name)
VNC_PASSWORD=${VNC_PASSWORD}

# Check if VNC password is set in environment variable
if [[ -z "$VNC_PASSWORD" ]]; then
  echo "Error: VNC password not set in environment variable. Exiting..."
  exit 1
fi

# Update package list
echo "Updating package list..."
sudo apt update

# Install tigervnc package
echo "Installing tigervnc..."
sudo apt install -y tigervnc-standalone-server

# Encrypt VNC password using vncpasswd
echo "Encrypting VNC password..."
mkdir -p /home/$USER/.vnc
echo "$VNC_PASSWORD" | vncpasswd -f > /home/$USER/.vnc/passwd

# Set ownership and permissions for VNC password file
chown $USER:$USER ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Create ~/.vnc/config file
echo "Creating ~/.vnc/config file..."
cat << EOF > ~/.vnc/config
# Specify session number (replace with your desired number)
Session=1

# Specify desired resolution (replace with your preferred width and height)
Geometry=1024x768
EOF

# Create xstartup.sh script
echo "Creating xstartup.sh script..."
cat << EOF > ~/.vnc/xstartup.sh
#!/bin/bash
exec i3
EOF

# Set ownership and permissions for xstartup.sh
chown $USER:$USER ~/.vnc/xstartup.sh
chmod +x ~/.vnc/xstartup.sh

echo "Tigervnc installation and configuration complete!"

