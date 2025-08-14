# puede visualizarse en ejecución en

<a href="https://test.drvelasquezq.site/" target="_blank">https://test.drvelasquezq.site/</a>

<a href="https://test.drvelasquezq.site/test.php" target="_blank">https://test.drvelasquezq.site/test.php</a>

## Descripción

Este proyecto da los pasos para utilizar y crear imagen de docker que ejecuta una aplicación de PHP integrando Apache en Debian

<ul>
<li>Apache: 2.4.62</li>
<li>PHP: 8.2.29</li>
<li>Debian: Bookworm</li>
</ul>

## Docker hub

[https://hub.docker.com/r/drvelasquezq/php-8-apache2-bookworm](https://hub.docker.com/r/drvelasquezq/php-8-apache2-bookworm)

## caracteristicas

<ul>
<li>Permite depurar el código con VS Code con Xdebug 3.2.0 con Docker</li>
</ul>

# Uso

```bash
# clonar proyecto
git clone https://github.com/drvelasquezq/docker-php-8-apache2-bookworm.git
# ingresar al proyecto
cd docker-php-8-apache2-bookworm
# crear contenedor
docker compose up -d
```

luego podrá ingresar a: http://localhost:8080

### ejemplo para construir la imagen: 
```bash
docker build --no-cache --progress=plain --tag drvelasquezq/php-8-apache2-bookworm:1.0.0 . > output-build-image/output.log 2>&1
```

### ejemplo para crear contenedor que solo ejecute el script sh que ya está en la imagen
```bash
docker run --name container-php-8-apache2-bookworm drvelasquezq/php-8-apache2-bookworm:1.0.0
```

### ejemplo para crear contenedor con la imagen y ejecutarlo de manera interactiva:
```bash
docker run --tty --interactive -p 8080:80 --name container-php-8-apache2-bookworm drvelasquezq/php-8-apache2-bookworm:1.0.0 bash
```

### ejemplo para crear contenedor con la imagen y ejecutarlo en segundo plano
```bash
docker run -d -p 8080:80 --name container-php-8-apache2-bookworm drvelasquezq/php-8-apache2-bookworm:1.0.0
```
```bash
# para luego ingresar al contenedor
docker exec -ti container-php-8-apache2-bookworm bash
```

### ejemplo para remover contenedor:
```bash
docker rm -f container-php-8-apache2-bookworm
```

### ejemplo de copia de archivo:
```
docker cp container-php-8-apache2-bookworm:/etc/php/8.2/cli/php.ini ./etc/php/8.2/cli/
```

### ejemplo para subir imagen a docker hub
```bash
docker tag php-8-apache2-bookworm:1.0.0 drvelasquezq/php-8-apache2-bookworm:1.0.0
```
```
docker push drvelasquezq/php-8-apache2-bookworm:1.0.0
```