# Linux VM with lightdm and VNC

This page describes how to setup a Linux VM with a GUI using `lightdm` and `tigervnc`. This setup is
useful when you want to have a VM running in the cloud with a GUI.

## Setup lightdm

### Step 1: Install prerequisites

On the VM, install `lightdm` and `tigervnc` server using the following command:

```bash
sudo apt install -y lightdm tigervnc-standalone-server tigervnc-xorg-extension
```

# Step 2: Configure VNC server

Create a password for the VNC server:

```bash
vncpasswd
```

## Step 2: Configure lightdm

Edit the `/etc/lightdm/lightdm.conf` file and add the following lines:

```txt
[VNCServer]
enabled=true
command=Xvnc -rfbauth /home/<username>/.vnc/passwd
port=5901
width=1920
height=1080
depth=24
```

Adjust the resolution according to your screen size.

Replace `<username>` with the username you used to create the VNC password.

### Step 3: Start lightdm

Start the `lightdm` service using the following command:

```bash
sudo systemctl start lightdm
```

## Step 4: Connect to the VNC server using a VNC client

You now have a Linux VM running with a GUI accessible via VNC. You can connect to the VNC server
using any VNC client and the IP address of the VM.

`lightdm` will start the GUI session when you connect to the VNC server, and it will let you choose
what desktop environment to use.
