#!/bin/bash

# Update the system packages
sudo apt-get update
sudo apt-get upgrade -y

# Install required software
sudo apt-get install -y apache2 mysql-server php php-mysql libapache2-mod-php php-cli unzip

# Download and install WP-CLI
sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# Download and install WordPress
sudo wp core download --path=/var/www/html --allow-root
sudo wp core config --path=/var/www/html --dbname=DB_NAME --dbuser=DB_USER --dbpass=DB_PASSWORD --dbhost=localhost --dbprefix=wp_ --allow-root
sudo wp core install --path=/var/www/html --url=http://PUBLIC_IP_ADDRESS_OR_DOMAIN_NAME --title="My WordPress Site" --admin_user=admin --admin_password=PASSWORD --admin_email=EMAIL --allow-root

# Set file permissions
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Restart Apache
sudo service apache2 restart
