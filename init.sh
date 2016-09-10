#!/bin/sh
sudo apt-get update
sudo apt-get install apache2
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql

wget https://raw.githubusercontent.com/CETHER/Hackathon-OpenStack/master/my-landing-page.html
sudo cp my-landing-page.html /var/www/html/index.html
