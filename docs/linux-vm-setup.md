# Setup headless Linux VM for development

This setup guide will help you to create a headless VM for development purposes. This is quite
useful when you want to have a VM running in the cloud without a GUI, but you still want to have a
GUI.

Make sure you have the port `22` open. If you run the VM in the cloud, make sure you have the port
`22` open in the network security group.

This guide assumes the following:

- You are running a Debian-based Linux distribution.
- You have a user with `sudo` privileges.

Let's start!

## Step 1: Install a Window or Desktop Manager

See the [Window Manager Setup](./wm-setup.md) guide for instructions on how to install `i3` on your
VM.

## Step 2: Install VNC or RDP server

For the VNC server, see the [VNC Setup](./vnc-setup.md) guide for instructions on how to install and
configure `tigervnc` on your VM.

For the RDP server, see the [RDP Setup](./rdp-setup.md) guide for instructions on how to install and
configure `xrdp` on your VM.
