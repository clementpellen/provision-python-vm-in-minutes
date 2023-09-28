# !/bin/bash

# Generate SSH key
ssh-keygen -t rsa -b 4096 -f ~/.ssh/ssh-provision-python-vm-in-minutes -q -N ""

# Convert the private key to .pem format
ssh-keygen -p -m PEM -f ~/.ssh/ssh-provision-python-vm-in-minutes -P "" -N ""
openssl rsa -in ~/.ssh/ssh-provision-python-vm-in-minutes -out ~/.ssh/ssh-provision-python-vm-in-minutes.pem

# Remove older private key
rm -f ~/.ssh/ssh-provision-python-vm-in-minutes

# Check if ssh key is generated
ls -la ~/.ssh/ssh-provision-python-vm-in-minutes*