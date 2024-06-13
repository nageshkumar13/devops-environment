#!/bin/bash

# Update package index
echo -e -e "\e[93mUpdate package index...\e[0m"
sudo apt-get update
sudo apt-get install -y zsh
echo

# Install Terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform

# Add Terraform to PATH
echo"Paths to DevOps Tools" >> ~/.zshrc
echo'export PATH="$PATH:/usr/local/bin/terraform"' >> ~/.zshrc
source ~/.zshrc
echo

# Install Ansible
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y 

# Add Ansible to PATH
echo 'export PATH="$PATH:/usr/bin/ansible"' >> ~/.zshrc
source ~/.zshrc
echo

# Install Docker
sudo apt install docker.io -y
sudo systemctl enable docker --now

# Add Docker to PATH
echo 'export PATH="$PATH:/usr/bin/docker"' >> ~/.zshrc
source ~/.zshrc
echo
