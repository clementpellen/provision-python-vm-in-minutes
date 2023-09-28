### Pull Terraform base image ###
FROM ubuntu:20.04

# Set the user to root
USER root

# Install dependencies
RUN apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y unzip sudo vim curl openssh-server openssh-client openssl python3-pip && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /root

################################
# Install Azure CLI
################################

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash && \
  az login --use-device-code

################################
# Install Terraform
################################

# Set Terraform version
ENV TERRAFORM_VERSION=1.5.7

# Download, unzip, and move terraform to /usr/local/bin/
RUN wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
  && unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -d /usr/local/bin/ \
  && rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

################################
# Install Ansible
################################

# Install Ansible
RUN pip install ansible

################################
# Copy the files
################################

# Copy the files
COPY . .

################################
# Execute Scripts
################################

# Make the scripts executable and run them
RUN chmod +x ./scripts/generate_ssh_keys.sh ./scripts/create_st_tfstate.sh && chmod +x ./infrastructure/ansible/run_ansible_playbook.sh && \
  ./scripts/generate_ssh_keys.sh && \
  ./scripts/create_st_tfstate.sh

################################
# Run Terraform
################################

# Set the working directory
WORKDIR /root/infrastructure/terraform

# Init terraform
RUN terraform init
