#!/bin/sh
echo "start init"
chown -R developer:docker /var/www
su developer -c 'composer config -g repo.packagist composer https://packagist.phpcomposer.com'
su developer -c 'composer global require "laravel/installer=~1.1" '
su developer -c 'composer create-project laravel/laravel /var/www/laravel --prefer-dist'
chown -R www-data:docker /var/www
chown -R www-data:docker /var/www/laravel/storage /var/www/laravel/bootstrap/cache
echo "init ok"
exit 0
