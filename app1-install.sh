#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd 
sudo systemctl start httpd 
sudo echo '<h1>Welcome to my site</h1>' | sudo tee /var/www/html/index.html 
sudo mkdir /var/www/html/app1
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/metadata.html