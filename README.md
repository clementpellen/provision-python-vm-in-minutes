# Provisionnement rapide d'un projet Python sur Azure ☁️

Avec ce projet, déploiez votre application Python sur un serveur Azure en un rien de temps grâce à Docker ! 🚀

### 💡 Fonctionnalités principales

- Provisionnement automatique d'une VM sur Azure.
- Configuration de la VM avec Ansible.
- Installation et démarrage de Docker sur la VM.
- Déploiement de votre application Python dans un conteneur Docker.


### 🚀 Démarrage rapide

1. Clonez le répertoire :
 `git clone [URL_DU_REPO]`

2. Construisez l'image Docker :
`docker build -f master.Dockerfile -t provision-python-vm-in-minutes .`

3. Démarrez le déploiement :
`docker run provision-python-vm-in-minutes:latest terraform apply -auto-approve`

4. (Optionnel) Supprimez le déploiement :
`docker run provision-python-vm-in-minutes:latest terraform destroy -auto-approve`


### 🔍 Observer les logs

1. Lancez le conteneur Docker en mode interactif :
`docker run -it provision-python-vm-in-minutes:latest`

2. Connectez-vous à la machine virtuelle :
`ssh -i ~/.ssh/ssh-provision-python-vm-in-minutes.pem adminuser@<ip-address>`

3. Observez les logs de l'application :
`sudo docker logs -f server-container`


### 🛠 Personnalisation du code

1. Accédez au code source de l'application :
`cd ~/src/app`

2. Modifiez le code principal :
`sudo nano app.py`

3. (Optionnel) Modifiez le Dockerfile :
`sudo nano ~/infrastructure/docker/server.Dockerfile`

4. Reconstruisez et redémarrez le conteneur en suivant les étapes du "Démarrage rapide".
