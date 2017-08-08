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
RUN   rm -rf /tmp/*
RUN   echo "extension=redis.so" >> /usr/local/etc/php/php.ini \
      && echo "extension=mysql.so" >> /usr/local/etc/php/php.ini \
      && echo "extension=mysqli.so" >> /usr/local/etc/php/php.ini \
      && echo "extension=pdo_mysql.so" >> /usr/local/etc/php/php.ini 
