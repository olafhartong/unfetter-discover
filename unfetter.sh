#! /bin/bash

# Install prerequisites and useful tools
apt update
apt install -y jq whois build-essential git vim unzip python3-dev python3-pip curl htop

# Install Docker-ce
apt install -y apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install -y docker-ce

# Install Docker compose
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod 755 /usr/local/bin/docker-compose

# Enable Docker with systemd and start service
sudo systemctl enable docker
sudo systemctl start docker

# Add user to docker group
sudo gpasswd -a $USER docker

# Install Unfetter Discover
git clone https://github.com/unfetter-discover/unfetter.git
cd ./unfetter

# Launch Unfetter Discover
docker-compose up -d
