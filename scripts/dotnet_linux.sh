#!/bin/bash

sudo yum update -y

# Install .Net
wget https://packages.microsoft.com/config/amazon/2/packages-microsoft-prod.rpm -O packages-microsoft-prod.rpm
sudo rpm -i packages-microsoft-prod.rpm
sudo yum install -y dotnet-sdk-7.0

# Install Nginx
sudo yum install -y nginx

sudo systemctl start nginx
sudo systemctl enable nginx