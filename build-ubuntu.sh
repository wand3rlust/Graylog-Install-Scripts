#!/bin/bash
# Check Install Permissions
echo -e "[+] Checking...\n"
if [[ $EUID -eq 0 ]];then
    echo -e "[+] You are root.\n"
else
    if [[ $(dpkg-query -s sudo) ]];then
        export SUDO="sudo"
        export SUDOE="sudo -E"
        echo -e "[+] sudo will be used for the install.\n"
    else
        echo -e "[-] Please install sudo or run this as root.\n"
        exit 1
    fi
fi
# Upgrade Packages
sudo apt-get update && sudo apt-get upgrade -y
# For VMware Guest Integration
sudo apt-get install -y open-vm-tools
# Install Pre-requisites
sudo apt-get install -y gnupg lsb-release ca-certificates curl gnupg2
# MongoDB Installation
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | gpg --dearmor -o server-6.0.asc.gpg
sudo mv server-6.0.asc.gpg /etc/apt/trusted.gpg.d/
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update && sudo apt-get install -y mongodb-org
# Enable, Start, and Verify Status
sudo systemctl daemon-reload
sudo systemctl enable mongod.service
sudo systemctl restart mongod.service
sudo systemctl --type=service --state=active | grep mongod
# OpenSearch Installation
curl -fsSL https://artifacts.opensearch.org/publickeys/opensearch.pgp | sudo gpg --dearmor -o opensearch.pgp.gpg
sudo mv opensearch.pgp.gpg /etc/apt/trusted.gpg.d/
echo "deb https://artifacts.opensearch.org/releases/bundle/opensearch/2.x/apt stable main" | sudo tee /etc/apt/sources.list.d/opensearch-2.x.list
sudo apt-get update && sudo apt-get install -y opensearch
# Verify Below Fingerprint If Prompted
# Fingerprint: c5b7 4989 65ef d1c2 924b a9d5 39d3 1987 9310 d3fc
# Enable, Start, and Verify Status
sudo systemctl daemon-reload
sudo systemctl enable opensearch.service
sudo systemctl start opensearch.service
sudo systemctl --type=service --state=active | grep opensearch
# Graylog Open Installation
wget https://packages.graylog2.org/repo/packages/graylog-5.1-repository_latest.deb
sudo dpkg -i graylog-5.1-repository_latest.deb
sudo apt-get update && sudo apt-get install graylog-server
sudo systemctl enable graylog-server.service
sudo rm graylog-5.1-repository_latest.deb
