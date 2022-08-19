#!/bin/bash

#correr export desde la misma shell que ejecute el script, remplazando XXXXXXXX como corresponda 


#MongoDB
#export passwd=test
#export user_root=userRoot

#export user_docker=XXXXXXXX
#export passwd_docker=XXXXXXXX



PS3='Please enter your choice: '
options=(
        "Crear contenedor MongoDB (Ejercicio 1)"
        "Crear contenedor Nginx, Subir Registry DockerHub(Ejercicio 2)"      
        "Eliminar todos los contenedores y todas las imagenes"
        "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Crear contenedor MongoDB (Ejercicio 1)")            
            docker run -d --name MongoDB  \
            -v mongo-data:/data/db \
            -p 27017:27017  \
            --env MONGO_INITDB_ROOT_USERNAME=$user_root \
            --env MONGO_INITDB_ROOT_PASSWORD=$passwd  \
            mongo;;
        "Crear contenedor Nginx, Subir Registry DockerHub(Ejercicio 2)")
            docker build -t bootcamp-web:bootcamp .                
            docker login -u $user_docker -p $passwd_docker docker.io 
            docker tag bootcamp-web:bootcamp nelsonflorez11/bootcamp-web:bootcamp    
            docker push nelsonflorez11/bootcamp-web:bootcamp
            docker run -d --name bootcamp-web \
            -p 9999:80 \
            bootcamp-web:bootcamp;;          
        "Eliminar todos los contenedores y todas las imagenes")
            docker stop $(docker ps -a -q)
            docker rm -v $(docker ps -a -q)
            docker rmi -f $(docker images -a -q)
            docker volume rm $(docker volume ls -q --filter dangling=true);;            
        "Quit") 
            break ;;
        *) echo "invalid option $REPLY";;
    esac
done








 













