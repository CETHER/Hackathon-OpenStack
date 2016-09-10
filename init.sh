#!/bin/sh
sudo apt-get update
sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y

#Install php
sudo apt-get install libapache2-mod-php5 php5 php5-mcrypt php5-mysql -y
sudo service apache2 restart

#Install Composer
sudo apt install composer -y
composer require php-opencloud/openstack 

wget https://raw.githubusercontent.com/CETHER/Hackathon-OpenStack/master/my-landing-page.html
sudo cp my-landing-page.html /var/www/html/index.html
wget https://raw.githubusercontent.com/CETHER/Hackathon-OpenStack/master/info.php
sudo cp info.php /var/www/html/info.php
wget https://raw.githubusercontent.com/CETHER/Hackathon-OpenStack/master/prueba.php
sudo cp prueba.php /var/www/html/prueba.php