# puede visualizarse en ejecución en: 
<a href="https://test.drvelasquezq.site/" target="_blank">https://test.drvelasquezq.site/</a>

<a href="https://test.drvelasquezq.site/test.php" target="_blank">https://test.drvelasquezq.site/test.php</a>

# Docker hub:
[https://hub.docker.com/r/drvelasquezq/php-8-apache2-bookworm](https://hub.docker.com/r/drvelasquezq/php-8-apache2-bookworm)

## ejemplo para construir la imagen: 
```bash
docker build --tag php-8-apache2-bookworm:v1.0 .
```

## ejemplo para crear contenedor que solo ejecute el script sh
```bash
docker run --name contenedor-php-8-apache2-bookworm php-8-apache2-bookworm:v1.0
```

## ejemplo para crear contenedor con la imagen y ejecutarlo de manera interactiva:
```bash
docker run --tty --interactive -p 80:80 --name contenedor-php-8-apache2-bookworm php-8-apache2-bookworm:v1.0 bash
```

## ejemplo para crear contenedor con la imagen y ejecutarlo en segundo plano
```bash
docker run -d -p 80:80 --name contenedor-php-8-apache2-bookworm php-8-apache2-bookworm:v1.0
```
```bash
## para luego ingresar al contenedor
docker exec -ti contenedor-php-8-apache2-bookworm bash
```

## ejemplo para remover contenedor:
```bash
docker rm -f contenedor-php-8-apache2-bookworm
```

## ejemplo de copia de archivo:
```
docker cp contenedor-php-8-apache2-bookworm:/etc/php/8.2/cli/php.ini ./etc/php/8.2/cli/
```

## ejemplo para subir imagen a docker hub
```bash
docker tag php-8-apache2-bookworm:v1.0 drvelasquezq/php-8-apache2-bookworm:v1.0
```
```
docker push drvelasquezq/php-8-apache2-bookworm:v1.0
```