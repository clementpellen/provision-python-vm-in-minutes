# Comment faire tourner mon projet Python sur un serveur en ligne en quelques minutes ? 🧐

## Ce projet met à disposition un conteneur Docker qui fait tout pour vous ! 🤩

### - Création d'une machine virtuelle sur le cloud Azure

### - Provisioning de la machine virtuelle avec Ansible

### - Installation de Docker sur la machine virtuelle

### - Lancement du conteneur Docker avec le projet Python

## Commamndes à exécuter :

### - `git clone` - Clonez le projet sur votre machine

### - `docker build -f master.Dockerfile --build-arg SSH_PRIVATE_KEY="$(cat ~/.ssh/ssh-active-dir-lab-terraform-neu.pem)" -t provision-python-vm-in-minutes .` - Créez l'image Docker

### - `docker run --name provision-python-vm-in-minutes-container provision-python-vm-in-minutes:latest terraform apply -auto-approve` - Lancez le conteneur Docker

### - `docker run --name provision-python-vm-in-minutes-container provision-python-vm-in-minutes:latest terraform destroy -auto-approve` - Détruisez le conteneur Docker
