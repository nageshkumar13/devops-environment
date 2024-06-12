#!/bin/bash

# Update package index
echo -e -e "\e[93mUpdate package index...\e[0m"
sudo apt-get update
sudo apt-get install -y zsh
echo