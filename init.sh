#!/bin/sh
sudo apt-get update
sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y

#Install mysql
echo mysql-server-5.1 mysql-server/root_password password raccoon | debconf-set-selections
echo mysql-server-5.1 mysql-server/root_password_again password raccoon | debconf-set-selections
apt-get install -y mysql-server
dpkg --get-selections | grep mysql


#CreateDB
mysql -u root -praccoon -e "create database raccoon"
mysql -u root -praccoon -e "USE raccoon; CREATE TABLE usuarios ( id_usuario int(6) NOT NULL, nombre varchar(50) NOT NULL, email varchar(50) NOT NULL, PRIMARY KEY (id_usuario) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;"


#Install php
sudo apt-get install libapache2-mod-php5 php5 php5-mcrypt php5-mysql -y
sudo service apache2 restart

#Install Composer
sudo apt install composer -y

#Install Git
sudo apt-get install git

composer require php-opencloud/openstack 

wget https://raw.githubusercontent.com/CETHER/Hackathon-OpenStack/master/my-landing-page.html
sudo cp my-landing-page.html /var/www/html/index.html
wget https://raw.githubusercontent.com/CETHER/Hackathon-OpenStack/master/info.php
sudo cp info.php /var/www/html/info.php
wget https://raw.githubusercontent.com/CETHER/Hackathon-OpenStack/master/prueba.php
sudo cp prueba.php /var/www/html/prueba.php