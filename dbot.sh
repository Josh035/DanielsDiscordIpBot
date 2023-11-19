#!/bin/bash


BOT_TOKEN = "[TOKEN HERE]"

##### PREREQUISITE

apt update && apt upgrade -y
apt install -y git


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


##### BOT INSTALL
git clone "https://github.com/Josh035/DanielsDiscordIpBot.git" ~/dev/
sed s/INSERT_TOKEN_HERE/$BOT_TOKEN/ -i ~/dev/DanielsDiscordIpBot/Dockerfile

### remove "-d" flag to add console logging
docker compose -d -f ~/dev/DanielsDiscordIpBot/compose.yml up
