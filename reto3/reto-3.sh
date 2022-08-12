#!/bin/bash

#correr export desde la misma shell que ejecute el script, remplazando XXXXXXXX como corresponda 

#export user_docker=XXXXXXXX
#export passwd_docker=XXXXXXXX

PS3='Please enter your choice: '
options=(
        "Crear volumen, crear imagen con Dockerfile, inicar contendor en el puerto 8080 y visualizar pagina con !!HOMEWORK 1"
        "Aautenticarse en docker hub, agregar tag imagen local, publicar imagen en docker hub"
        "Eliminar todos los contenedores y todas las imagenes"
        "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Crear volumen, crear imagen con Dockerfile, inicar contendor en el puerto 8080 y visualizar pagina con !!HOMEWORK 1")
            docker volume create static_content
            docker build -t bootcamp_nginx .
            docker run -d --name bootcamp_container \
            -v $PWD/static_content:/usr/share/nginx/html \
            -p 8080:80 \
            bootcamp_nginx;;
        "Aautenticarse en docker hub, agregar tag imagen local, publicar imagen en docker hub")
            docker login -u $user_docker -p $passwd_docker docker.io 
            docker tag bootcamp_nginx nelsonflorez11/bootcamp_nginx:v1.0.0    
            docker push nelsonflorez11/bootcamp_nginx:v1.0.0 ;;
        "Eliminar todos los contenedores y todas las imagenes")
            docker stop $(docker ps -a -q)
            docker rm $(docker ps -a -q)
            docker rmi -f $(docker images -a -q)
            docker volume rm static_content;;
        "Quit") 
            break ;;
        *) echo "invalid option $REPLY";;
    esac
done
2





 













