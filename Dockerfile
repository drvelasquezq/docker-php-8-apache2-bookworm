FROM debian:bookworm

RUN apt-get update && \
    apt-get clean

# apache
RUN apt-get install -y apache2 && \
    ## lynx  para apachectl status
    apt-get install -y lynx && \
    apt-get clean

# versionamiento
RUN apt-get install -y git && \
    apt-get clean

# herramientas para manejo de contenedor
RUN apt install iputils-ping -y && \
    apt install net-tools -y && \
    apt install curl -y && \
    # apt install netcat -y && \
    apt install nano -y && \
    apt install wget -y && \
    apt-get clean

# php
RUN apt install php8.2 -y && \
    apt install php8.2-xdebug -y && \
    apt-get clean

COPY ./etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
#COPY ./etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

COPY ./etc/php/8.2/apache2/php.ini /etc/php/8.2/apache2/php.ini
COPY ./etc/php/8.2/cli/php.ini /etc/php/8.2/cli/php.ini

COPY ./etc/php/8.2/mods-available/opcache.ini /etc/php/8.2/mods-available/opcache.ini
COPY ./etc/php/8.2/mods-available/xdebug.ini /etc/php/8.2/mods-available/xdebug.ini

# RUN a2ensite default-ssl && \
#    a2enmod ssl 

# composer
## https://getcomposer.org/doc/00-intro.md#docker-image
COPY --from=composer/composer:2.8 /usr/bin/composer /usr/bin/composer

EXPOSE 80

# EXPOSE 443

WORKDIR /var/www

COPY ./var/www/index.php /var/www/index.php
COPY ./var/www/xdebug.php /var/www/xdebug.php
COPY ./var/www/test.php /var/www/test.php

COPY ./scripts/script.sh /scripts/script.sh

CMD [ "/bin/sh", "/scripts/script.sh" ]
