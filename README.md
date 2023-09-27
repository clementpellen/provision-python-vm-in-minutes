# Comment faire tourner mon projet Python sur un serveur en ligne en quelques minutes ? 🧐

### Ce projet met à disposition un conteneur Docker qui fait tout pour vous ! 🤩

- Création d'une machine virtuelle sur le cloud Azure
- Provisionnement de la machine virtuelle avec Ansible
- Installation de Docker sur la machine virtuelle
- Lancement du conteneur Docker avec le projet Python

## Commandes à exécuter :

- `git clone` - Clonez le projet sur votre machine

- `docker build -f master.Dockerfile -t provision-python-vm-in-minutes .` - Créez l'image Docker

- `docker run provision-python-vm-in-minutes:latest terraform apply -auto-approve` - Lancez le conteneur Docker

- `docker run provision-python-vm-in-minutes:latest terraform destroy -auto-approve` - Détruisez le conteneur Docker

## Observer les logs du programme :

- `docker run -it provision-python-vm-in-minutes:latest` - Lancez le conteneur Docker en mode interactif

- `ssh -i ~/.ssh/ssh-provision-python-vm-in-minutes adminuser@<ip-address>` - Connectez-vous à la machine virtuelle

- `sudo docker logs -f server-container` - Observez les logs du programme
