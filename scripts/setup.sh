#!/bin/bash

# Run the i3 setup script
./i3-setup.sh

# Run the tightvnc setup script
./tightvnc-setup.sh

# Run the pulsesecure setup script
./pulsesecure-setup.sh

# Start vncserver
vncserver :1
