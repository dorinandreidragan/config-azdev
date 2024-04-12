# Setup SSH Tunnel for Remote Desktop

## Prerequisites

Make sure you have OpenSSH Server installed on the remote Windows machine.

Run the following PowerShell command to install OpenSSH Server as an Administrator:

```powershell
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
```

Restart the Windows machine after the installation.

See instructions here: [Get started with OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=powershell)

## Setup SSH Tunnel


