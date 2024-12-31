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

# ejemplo para construir la imagen: 
# docker build --tag php-8-apache2-bookworm:v1.0 .

# ejemplo para crear contenedor que solo ejecute el script sh
# docker run --name contenedor-php-8-apache2-bookworm php-8-apache2-bookworm:v1.0

# ejemplo para crear contenedor con la imagen y ejecutarlo de manera interactiva:
# docker run --tty --interactive -p 80:80 --name contenedor-php-8-apache2-bookworm php-8-apache2-bookworm:v1.0 bash

# ejemplo para crear contenedor con la imagen y ejecutarlo en segundo plano
# docker run -d -p 80:80 --name contenedor-php-8-apache2-bookworm php-8-apache2-bookworm:v1.0
# docker exec -ti contenedor-php-8-apache2-bookworm bash

# ejemplo para remover contenedor:
# docker rm -f contenedor-php-8-apache2-bookworm

# ejemplo de copia de archivo:
# docker cp contenedor-php-8-apache2-bookworm:/etc/php/8.2/cli/php.ini ./etc/php/8.2/cli/