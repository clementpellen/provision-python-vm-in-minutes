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
  echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa

  # Ajustez les permissions du fichier pour garantir sa sécurité
  chmod 600 /root/.ssh/id_rsa

  echo "La clé SSH a été ajoutée avec succès."
fi
