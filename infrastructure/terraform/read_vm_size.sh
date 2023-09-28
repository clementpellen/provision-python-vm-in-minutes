#!/bin/bash

# Lire la première ligne qui correspond à la taille de la VM
VM_SIZE=$(cat ~/AZURE-SERVER-SIZE.txt | grep "AZURE_SERVER_SIZE =" | cut -d'=' -f2 | tr -d '[:space:]')

# Afficher la taille pour pouvoir l'utiliser dans Terraform
echo "{ \"vm_size\": \"${VM_SIZE}\" }"
