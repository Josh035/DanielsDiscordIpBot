#!/bin/bash


BOT_TOKEN=$1

##### PREREQUISITE

sudo apt update && apt upgrade -y
sudo apt install -y git


##### DOCKER INSTALL

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update


sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo /sbin/usermod docker $USER

##### BOT INSTALL
git clone "https://github.com/Josh035/DanielsDiscordIpBot.git" ~/dev/ipBot
sed s/INSERT_TOKEN_HERE/$BOT_TOKEN/ -i ~/dev/ipBot/Dockerfile


### remove "-d" flag to add console logging
docker compose -d -f ~/dev/ipBot/compose.yml up
