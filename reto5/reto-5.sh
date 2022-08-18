#!/bin/bash

#correr export desde la misma shell que ejecute el script, remplazando XXXXXXXX como corresponda 

#export user_docker=XXXXXXXX
#export passwd_docker=XXXXXXXX

PS3='Please enter your choice: '
options=(
        "Crear imagen node y subir contenedor en la URL http://localhost:4000/"
        "Aautenticarse en docker hub, agregar tag imagen local, publicar imagen en docker hub"      
        "Eliminar todos los contenedores y todas las imagenes"
        "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Crear imagen node y subir contenedor en la URL http://localhost:4000/")
            docker build -t nodejs:bootcamp .
            docker run  -d --name bootcamp_nodejs -p 4000:4000 nodejs:bootcamp;;
        "Aautenticarse en docker hub, agregar tag imagen local, publicar imagen en docker hub")
            docker login -u $user_docker -p $passwd_docker docker.io 
            docker tag nodejs:bootcamp nelsonflorez11/nodejs:bootcamp    
            docker push nelsonflorez11/nodejs:bootcamp;;
        "Eliminar todos los contenedores y todas las imagenes")
            docker stop $(docker ps -a -q)
            docker rm $(docker ps -a -q)
            docker rmi -f $(docker images -a -q);;            
        "Quit") 
            break ;;
        *) echo "invalid option $REPLY";;
    esac
done






 













