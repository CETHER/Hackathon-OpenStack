#!/bin/sh

#Apache
sudo apt-get update
sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y

#MySql
echo mysql-server-5.1 mysql-server/root_password password raccoon | debconf-set-selections
echo mysql-server-5.1 mysql-server/root_password_again password raccoon | debconf-set-selections
apt-get install -y mysql-server
dpkg --get-seletions | grep mysql

#CreatDB
mysql -u root -praccoon -e "Create database raccoon"
mysql -u root -praccoon -e "USE raccoon; CREATE TABLE usuarios ( id_usuario int(6) NOT NULL, nombre varchar(50) NOT NULL, email varchar(50) NOT NULL, PRIMARY KEY (id_usuario) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;"

#PHP
sudo apt-get install libapache2-mod-php5 php5 php5-mycrypt php-mysql -y
sudo service apache2 restart

#Composer
sudo apt install composer -y
composer require php-opencloud/openstack

wget https://raw.githubusercontent.com/openstack-hackathon/training-shade-cucea/master/challenge1/my-landing-page.html
sudo cp my-landing-page.html /var/www/html/index.html
