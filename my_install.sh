# Update
apt-get update -y && \
# Install Unzip
apt-get install unzip -y && \
# need wget
apt-get install wget -y && \
# vim
apt-get install vim -y

################################
# Install Terraform
################################

# Download terraform for linux
wget https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip

# Unzip
unzip terraform_1.5.7_linux_amd64.zip

# Move to local bin
sudo mv terraform /usr/local/bin/
# Check that it's installed
terraform --version 

rm terraform_1.5.7_linux_amd64.zip

################################
# Install AZURE CLI
################################

# Download
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Check that it's installed
az --version

az login --use-device-code