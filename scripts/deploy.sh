#!/bin/bash
sudo apt update -y
sudo apt install -y git vim wget gnupg lsb-release


sudo curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs


cd /home/ubuntu/
sudo git clone https://github.com/lopesma2/teste-devops.git

cd /home/ubuntu/teste-devops/
sudo git clone https://github.com/herbsjs/todolist-on-herbs.git
cd todolist-on-herbs/
sudo npm install
cd /home/ubuntu/teste-devops/

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo apt-get update
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

sudo docker-compose -f docker-compose.yml up -d --build
