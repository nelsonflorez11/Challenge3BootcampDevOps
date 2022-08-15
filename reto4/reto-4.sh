#!/bin/bash

#correr export desde la misma shell que ejecute el script, remplazando XXXXXXXX como corresponda 

#export user_docker=XXXXXXXX
#export passwd_docker=XXXXXXXX

PS3='Please enter your choice: '
options=(
        "Crear volumen, crear imagen con Dockerfile, inicar contendor en el puerto 5050 y visualizar pagina con !!HOMEWORK 4"
        "Averiguar cuántas capas tiene mi nueva imagen"
        "Eliminar todos los contenedores y todas las imagenes"
        "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Crear volumen, crear imagen con Dockerfile, inicar contendor en el puerto 5050 y visualizar pagina con !!HOMEWORK 4")
            docker volume create static_content
            docker build -t simple-apache:new .
            docker run -d --name my_apache \
            -v static_content:/usr/local/apache2/htdocs \
            -p 5050:80 \
            simple-apache:new;;
        "Averiguar cuántas capas tiene mi nueva imagen")
            docker inspect simple-apache:new | grep -A 7 Layers ;;
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





 













