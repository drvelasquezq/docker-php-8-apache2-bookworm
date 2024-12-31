FROM debian:bookworm

#lynx  para apachectl status

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y lynx && \
    apt install -y php && \
    apt-get clean

COPY ./etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

COPY ./etc/php/8.2/apache2/php.ini /etc/php/8.2/apache2/php.ini
COPY ./etc/php/8.2/cli/php.ini /etc/php/8.2/cli/php.ini

RUN a2ensite default-ssl && \
    a2enmod ssl && \
    a2enmod rewrite && \
    service apache2 restart

EXPOSE 80

EXPOSE 443

WORKDIR /var/www

COPY ./var/www/index.php /var/www/index.php
COPY ./var/www/test.php /var/www/test.php

COPY ./temp/script.sh /temp/script.sh

CMD [ "/bin/sh", "/temp/script.sh" ]
