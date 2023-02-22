#! /bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start httpd 
sudo echo '<h1>Welcome to my site</h1>' | sudo tee /var/www/html/index.html 
sudo mkdir /var/www/html/app1