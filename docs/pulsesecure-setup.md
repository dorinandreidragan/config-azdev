# PulseSecure Setup

This guide will help you to install PulseSecure on a Linux VM.

## Prerequisites

Make sure you have the PulseSecure deb file downloaded.

## Step 1: Install dependencies

Install the following dependencies:

```bash
sudo apt update
sudo apt install -y \
  acl \
  bzip2 \
  libnss3-tools \
  libwebkit2gtk-4.0-37 \
  libgtkmm-3.0-1v5
```

## Step 2: Install PulseSecure

Pipe `Y` to the `dpkg` command to automatically answer `yes` to keep the existing configuration
file. Install the PulseSecure deb file. Replace `/path/to/pulsesecure.deb` with the path to the deb
file.

```bash
Y | sudo dpkg -i /path/to/pulsesecure.deb
```

## Step 3: Install Chrome Embedded Framework (CEF) dependencies

After installing PulseSecure, you need to install the Chrome Embedded Framework (CEF) dependencies.
The PulseSecure installation comes with the `setup_cef.sh` script that you can use to install the
dependencies.

```bash
sudo /opt/pulsesecure/bin/setup_cef.sh install
```

## Step 4: Add the PulseSecure binary to the PATH

Add the PulseSecure binary to the PATH by adding the following line to your `.bashrc` file:

```bash
export PATH=$PATH:/usr/local/pulsesecure
```

## Step 5: Start PulseSecure

PulseSecure requires you to have a GUI to run.
