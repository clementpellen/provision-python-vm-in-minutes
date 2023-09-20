#!/bin/bash

# Le script reçoit SSH_PRIVATE_KEY comme premier argument
SSH_PRIVATE_KEY=$1

# Vérifiez si SSH_PRIVATE_KEY est vide
if [ -z "$SSH_PRIVATE_KEY" ]; then
  # Gérez le cas où SSH_PRIVATE_KEY n'est pas fourni
  echo "SSH_PRIVATE_KEY n'a pas été fourni. Veuillez fournir la clé comme argument de build."
  exit 1
else
  # Créez le dossier .ssh dans le répertoire home du root (ou tout autre utilisateur que vous souhaitez utiliser)
  mkdir -p /root/.ssh/

  # Ajoutez la clé SSH privée dans le dossier .ssh
  echo "${SSH_PRIVATE_KEY}" > /root/.ssh/ssh-active-dir-lab-terraform-neu.pem

  # Convertir la clé SSH privée au format .pem
  # ssh-keygen -f /root/.ssh/ssh-active-dir-lab-terraform-neu -m PEM -e > /root/.ssh/ssh-active-dir-lab-terraform-neu.pem

  # Ajustez les permissions du fichier pour garantir sa sécurité
  chmod 600 /root/.ssh/ssh-active-dir-lab-terraform-neu.pem

  # Supprimez la première clé SSH privée
  # rm -f /root/.ssh/ssh-active-dir-lab-terraform-neu

  echo "La clé SSH a été ajoutée avec succès."
fi
