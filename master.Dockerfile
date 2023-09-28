### Pull base image with Terraform, Azure CLI and Python ###
FROM zenika/terraform-azure-cli:release-6.1_terraform-1.0.6_azcli-2.28.1

# Set the user to root
USER root

RUN \
  # Update
  apt-get update -y && \
  # Install Unzip
  apt-get install unzip -y && \
  # need sudo
  apt-get install sudo -y && \
  # vim
  apt-get install vim -y && \
  # need curl
  apt-get install curl -y && \
  # need ssh server and client
  apt-get install openssh-server openssh-client -y && \
  # need openssl
  apt-get install openssl -y

# Set the working directory
WORKDIR /root

################################
# Generate SSH Keys
################################

# Copy the script to the image
COPY ./scripts/generate_ssh_keys.sh ./scripts/generate_ssh_keys.sh

# Make the script executable
RUN chmod +x ./scripts/generate_ssh_keys.sh

# Run the script
RUN ./scripts/generate_ssh_keys.sh

################################
# Install pip
################################

# Install python
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip

################################
# Install Ansible
################################

# Install Ansible
RUN pip install ansible

################################
# Connect to Azure account
################################

# update Azure CLI
RUN az upgrade --yes

# Connection to Azure
RUN az login --use-device-code

################################
# Create St Account for Terraform
################################

# Copy the script to the image
COPY ./scripts/create_st_tfstate.sh ./scripts/create_st_tfstate.sh

# Make the script executable
RUN chmod +x ./scripts/create_st_tfstate.sh

# Run the script
RUN ./scripts/create_st_tfstate.sh

################################
# Copy the files
################################

# Copy the files
COPY ./infrastructure/ ./infrastructure/
COPY ./src/ ./src/

# Make the script executable
RUN chmod +x ./infrastructure/ansible/run_ansible_playbook.sh

################################
# Run Terraform
################################

# Set the working directory
WORKDIR /root/infrastructure/terraform

# Init terraform
RUN terraform init

# Plan terraform
# CMD ["terraform", "plan"]
