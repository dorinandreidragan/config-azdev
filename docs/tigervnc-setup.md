# Setting up a VNC server on a Linux VM

This guide will help you set up the `tigervnc` server on a Linux VM. This is useful when you want to
have a VM running in the cloud with a GUI.

## Step 1: Install the prerequisites

On the VM, install the `tigervnc` server using the following command:

```bash
sudo apt install -y tigervnc-standalone-server
```

## Step 2: Configure the VNC server

- Create a password for the VNC server:

  ```bash
  vncpasswd
  ```

- Create a configuration file for the VNC server in `~/.vnc/config`. The configuration file should
  contain the following lines. The `geometry` can be any resolution you want (e.g. `3440x1440`,
  `1920x1080`, etc.).

  ```txt
  session=vnc
  geometry=1920x1080
  depth=24
  ```

- In the `~/.vnc/xstartup` file, add the following lines for the `i3` window manager. If you are
  using a different window manager, replace `i3` with the name of the window manager.

  ```bash
  #!/bin/sh

  unset SESSION_MANAGER
  exec /usr/bin/i3
  ```

- Make sure you have the correct permissions for the `~/.vnc/xstartup` file:

  ```bash
  chmod +x ~/.vnc/xstartup
  ```

## Step 3: Start the VNC server

- Start the VNC server using the following command on the VM:

  ```bash
  vncserver :1
  ```

## Step 4: Connect to the VNC server using a VNC client

Because the VNC protocol is not secure, you should use a SSH tunnel to connect to the VNC server.
You can do this using the following command on your local machine:

```bash
# instead of your_ip_address, you can use the DNS name of the VM
ssh -L 5901:localhost:5901 your_username@your_ip_address
```

After you have created the SSH tunnel, you can connect to the VNC server using a VNC client on your
local machine. Make sure you are using the `localhost` server and port number `5901`.

If you use Remmina as a VNC client, you can use SSH tunneling to connect to the VNC server. Here is
how you can do it:

- On the Basic tab:

  - Server: `your_ip_address:5901`

- On the SSH tunnel tab:

  - Enable the SSH tunnel
  - Check "Same server at port 22"
  - Check "Tunnel via loopback address"
  - Username: `your_username`
  - Password: `your_password`

### VNC clients

Some VNC clients you can use:

- [Remmina](https://remmina.org/)
- [Remote Desktop Manager](https://remotedesktopmanager.com/)

