#!/bin/bash

# descarga imagen, levanta contenedor, lista contenedor, lista imagen
docker pull nginx
echo "Se descargo la imagen con exito"
sleep 7

docker run -d --name servidor_web -p 8181:80 nginx
echo "Se levanto un contenedor con nombre servidor_web y con la imagen nginx, contenedor listado a continuacion"
sleep 7

docker ps
echo "La imagen descargada es la siguiente"
sleep 7

docker images
echo "para validar que el contendor levanto en el puerto 8181, por favor abrir en el navegador la URL http://127.0.0.1:8181/"
sleep 17

# para elimina servicios
echo "parando y eliminando servicios"
sleep 7
docker stop servidor_web
docker rm servidor_web
docker ps


docker rmi nginx
docker ps -a





