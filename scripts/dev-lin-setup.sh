#!/bin/bash

REGION="westeurope"
VM_NAME="dev-lin-vm"

# Remove scripts directory from the dev-lin-vm machine
ssh $VM_NAME.$REGION.cloudapp.azure.com "rm -rf scripts"

# Copy the scripts directory to the dev-lin-vm machine via scp
scp -r ../scripts $VM_NAME.$REGION.cloudapp.azure.com:~/

# Connect to the dev-lin-vm machine and run the setup scripts
ssh $VM_NAME.$REGION.cloudapp.azure.com "cd scripts \
  && export VNC_PASSWORD='$VNC_PASSWORD' \
  && ./i3-setup.sh \
  && ./tigervnc-setup.sh \
  && ./pulsesecure-setup.sh \
  && vncserver :1"

