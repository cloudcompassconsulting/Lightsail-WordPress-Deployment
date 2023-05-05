#!/bin/bash

# Prompt the user to enter the necessary values
echo "Enter the following values:"
read -p "Database name: " DB_NAME
read -p "Database user: " DB_USER
read -p "Database password: " DB_PASSWORD
read -p "Site URL: " SITE_URL
read -p "Site title: " SITE_TITLE
read -p "Admin username: " ADMIN_USER
read -p "Admin password: " ADMIN_PASSWORD
read -p "Admin email: " ADMIN_EMAIL

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
sudo wp config create --path=/var/www/html --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost=localhost --dbprefix=wp_ --extra-php <<PHP
define( 'WP_HOME', '$SITE_URL' );
define( 'WP_SITEURL', '$SITE_URL' );
PHP
sudo wp core install --path=/var/www/html --url="$SITE_URL" --title="$SITE_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --allow-root

# Set file permissions
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Create .gitignore file
echo ".DS_Store" > /var/www/html/.gitignore
echo "wp-config.php" >> /var/www/html/.gitignore
echo "wp-content/uploads" >> /var/www/html/.gitignore

# Restart Apache
sudo service apache2 restart
