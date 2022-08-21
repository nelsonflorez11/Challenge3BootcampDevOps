#!/bin/bash

PS3='Please enter your choice: '
options=(
        "Crear contenedor web (Ejercicio 1)"      
        "Eliminar todos los contenedores y todas las imagenes"
        "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Crear contenedor web (Ejercicio 1)")
            docker build -t web:bootcamp .            
            docker run -d --name web -p 8000:80 web:bootcamp
            docker exec -it web ls            
            ;;         
        "Eliminar todos los contenedores y todas las imagenes")
            docker stop $(docker ps -a -q)
            docker rm $(docker ps -a -q)
            docker rmi -f $(docker images -a -q)
            ;;            
        "Quit") 
            break ;;
        *) echo "invalid option $REPLY";;
    esac
done








 













