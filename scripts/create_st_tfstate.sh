#!/bin/bash

# Resource group name
RG_NAME="rg-tfstate-provision-python-vm-in-minutes-neu"
# Region
LOCATION="northeurope"
# Storage account name
ST_NAME="tfstateprovisionvm"
# Container name
CONTAINER_NAME="tfstateprovisionvm"

# Check if a resource group doesn't already exist
if [[ $(az group exists --name "$RG_NAME") == "false" ]]; then
    echo "Resource group does not exist. Creating $RG_NAME..."
    az group create --name "$RG_NAME" --location "$LOCATION"
else
    echo "Resource group $RG_NAME already exists."
fi

# Check if a storage account doesn't already exist
if [[ $(az storage account check-name --name "$ST_NAME" --query 'nameAvailable' --output tsv) == "true" ]]; then
    echo "Storage account does not exist. Creating $ST_NAME..."
    az storage account create --name "$ST_NAME" --resource-group "$RG_NAME" --location "$LOCATION" --sku Standard_LRS
else
    echo "Storage account $ST_NAME already exists."
fi

# Get the storage account key to authenticate the container operations
ST_KEY=$(az storage account keys list --resource-group "$RG_NAME" --account-name "$ST_NAME" --query "[0].value" --output tsv)

# Check if the container exists
if [[ $(az storage container exists --name "$CONTAINER_NAME" --account-name "$ST_NAME" --account-key "$ST_KEY" --query 'exists' --output tsv) == "false" ]]; then
    echo "Container does not exist. Creating $CONTAINER_NAME..."
    az storage container create --name "$CONTAINER_NAME" --account-name "$ST_NAME" --account-key "$ST_KEY"
else
    echo "Container $CONTAINER_NAME already exists."
fi






