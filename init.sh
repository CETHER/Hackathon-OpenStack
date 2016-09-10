#!/bin/sh

#Install Apache
sudo apt-get update
sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y


#Copying landing page
wget https://raw.githubusercontent.com/CETHER/Hackathon-OpenStack/master/my-landing-page.html
sudo cp my-landing-page.html /var/www/html/index.html
wget https://raw.githubusercontent.com/CETHER/Hackathon-OpenStack/master/info.php
sudo cp info.php /var/www/html/info.php
wget https://raw.githubusercontent.com/CETHER/Hackathon-OpenStack/master/prueba.php
sudo cp prueba.php /var/www/html/prueba.php