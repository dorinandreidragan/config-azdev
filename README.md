# Setup headless VM for development

This setup guide will help you to create a headless VM for development purposes. This is quite useful
when you want to have a VM running in the cloud without a GUI, but you still want to have a GUI.

## Linux VM

Make sure you have the port `22` open. If you run the VM in the cloud, make sure you have the port
`22` open in the network security group.

### Setup i3

```bash
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install i3
```

### Setup VNC

Because we are running a headless VM, using VNC will be faster than using RDP.

#### Step 1: Install `tigervnc` server

On the VM, install the `tigervnc` server using the following command:

```bash
sudo apt install -y tigervnc-standalone-server tigervnc-xorg-extension
```

#### Step 2: Configure VNC server

- Create a password for the VNC server:

  ```bash
  vncpasswd
  ```

- Create a configuration file for the VNC server in `~/.vnc/config`. The configuration file should
  contain the following lines. The `geometry` can be any resolution you want (e.g. `3440x1440`,
  `1920x1080`, etc.).

  ```txt
  session=i3
  geometry=1920x1080
  depth=24
  ```

#### Step 3: Start the VNC server

- Start the VNC server using the following command on the VM:

  ```bash
  vncserver :1
  ```

#### Step 3 (optional): Run the VNC server as a service

TODO: this step is not working yet.

- Create the service file for the VNC server in `/etc/systemd/system/vncserver@.service`:

  ```
  [Unit]
  Description=Remote desktop service (VNC)
  After=syslog.target network.target systemd-user-sessions.service

  [Service]
  Type=forking
  ExecStart=/usr/bin/vncserver %i
  PIDFile=/run/vncsession-%i.pid
  SELinuxContext=system_u:system_r:vnc_session_t:s0

  [Install]
  WantedBy=multi-user.target
  ```

- Enable the VNC server service:

  ```bash
  sudo systemctl enable vncserver@:1.service
  ```

- Start the VNC server service:

  ```bash
  sudo systemctl start vncserver@:1.service
  ```

#### Step 4: Connect to the VNC server using a VNC client

Because the VNC protocol is not secure, you should use a SSH tunnel to connect to the VNC server.
You can do this using the following command on your local machine:

```bash
# instead of your_ip_address, you can use the DNS name of the VM
ssh -L 5901:localhost:5901 your_username@your_ip_address
```

After you have created the SSH tunnel, you can connect to the VNC server using a VNC client on your
local machine. Make sure you are using the `localhost` server and port number `5901`.

If you use Remmina as a VNC client, you can use the following settings:

On the Basic tab:

- Server: `your_ip_address:5901`

On the SSH tunnel tab:

- Enable the SSH tunnel
- Check "Same server at port 22"
- Check "Tunnel via loopback address"
- Username: `your_username`
- Password: `your_password`

#### VNC clients

Some VNC clients you can use:

- Linux clients:

  - [Remmina](https://remmina.org/)

- Windows clients:

  - [Remote Desktop Manager](https://remotedesktopmanager.com/)

