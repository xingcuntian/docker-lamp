FROM php:7.0-apache

RUN  pecl install redis-3.1.0
COPY config/php.ini /usr/local/etc/php/
COPY ./ext /tmp/
RUN  cd /tmp/mysql \
      &&  /usr/local/bin/phpize \
      && ./configure --with-php-config=/usr/local/bin/php-config --with-mysql=mysqlnd \
      && make \
      && make install 
RUN  cd /tmp/mysqli \
      &&  /usr/local/bin/phpize \
      && ./configure --with-php-config=/usr/local/bin/php-config --with-mysqli=mysqlnd \
      && make \
      && make install 
RUN  cd /tmp/pdo_mysql \
      &&  /usr/local/bin/phpize \
      && ./configure --with-php-config=/usr/local/bin/php-config --with-pdo-mysql=mysqlnd \
      && make \
      && make install

RUN  cd /tmp/zlib-1.2.8 \
      && ./configure \
      && make \
      && make install 

RUN  cd /tmp/zip \
      &&  /usr/local/bin/phpize \
      && ./configure --with-php-config=/usr/local/bin/php-config \
      && make \
      && make install 

RUN   rm -rf /tmp/*
RUN   echo "extension=redis.so" >> /usr/local/etc/php/php.ini \
      && echo "extension=mysql.so" >> /usr/local/etc/php/php.ini \
      && echo "extension=mysqli.so" >> /usr/local/etc/php/php.ini \
      && echo "extension=pdo_mysql.so" >> /usr/local/etc/php/php.ini \
      && echo "extension=zip.so" >> /usr/local/etc/php/php.ini 

###################apache###############################################

RUN /usr/sbin/a2enmod rewrite
ADD config/000-laravel.conf /etc/apache2/sites-available/
ADD config/001-laravel-ssl.conf /etc/apache2/sites-available/
RUN /usr/sbin/a2dissite '*' && /usr/sbin/a2ensite 000-laravel 001-laravel-ssl

########################################################################

RUN   groupadd docker \
      && useradd sensetime -g docker \
      && useradd developer -g docker -m -s /bin/bash \
      && chmod 777 /home/developer  \
      #&& usermod -g docker sensetime \
      && mkdir /var/www/html/app \
      && chown -R sensetime:docker /var/www

ENV APACHE_RUN_USER sensetime
ENV APACHE_RUN_GROUP docker
ENV APACHE_LOG_DIR /var/log/apache2

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN   php -r "readfile('https://getcomposer.org/installer');" | php \
      && mv composer.phar /usr/local/bin/composer \
      && chmod +x /usr/local/bin/composer \
      && ldconfig

# ENV PATH=~/.composer/vendor/bin:$PATH
ADD composer_start.sh /usr/local/bin/composer_start.sh
RUN chmod +x /usr/local/bin/composer_start.sh
# USER developer
WORKDIR /var/www
# RUN /usr/local/bin/composer config -g repo.packagist composer https://packagist.phpcomposer.com
# RUN /usr/local/bin/composer create-project laravel/laravel /var/www/laravel --prefer-dist
# RUN /bin/chown www-data:docker -R /var/www/laravel/storage /var/www/laravel/bootstrap/cache
# RUN mkdir /tmp/app && cd /tmp/app && composer create-project "laravel/laravel=5.4.30" /tmp/app --prefer-dist

# USER root
# ENTRYPOINT ["/usr/local/bin/composer_start.sh"]

