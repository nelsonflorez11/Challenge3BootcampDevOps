#!/bin/bash

#correr exports desde la misma shell que ejecute el script, remplazando XXXXXXXX como corresponda 
#ROOT
# export POSTGRES_USER_ROOT=postgres
# export POSTGRES_DB_ROOT=postgres
# export POSTGRES_PASSWORD_ROOT=postgres


#APP
# export POSTGRES_USER_APP=XXXXXX
# export POSTGRES_PASSWORD_APP=XXXXXX
# export POSTGRES_DB_APP=XXXXXX

PS3='Please enter your choice: '
options=(
        "Crear imagenes, levantar contenedores"
        "Eliminar recursos"
        "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Crear imagenes, levantar contenedores") 
            echo "########################"
            echo "Crea imagenes Docker"
            echo "########################"
            cd src/postgres
            docker build -t nelsonflorez11/postgres:1.0 .
            cd ../myapp
            docker build -t nelsonflorez11/myapp:1.0 .
            docker images
            echo "########################"
            echo "Levanta contendor de app y bd"
            echo "########################"
            docker-compose up -d
            break
            ;;
        "Eliminar recursos")
            docker stop $(docker ps -a -q)
            docker rm $(docker ps -a -q)
            docker rmi -f $(docker images -a -q)
            echo "########################"
            echo "Se borraron todos los contenedores e imagenes"            
            echo "#########################"
            ;;            
        "Quit") 
            break ;;
        *) echo "invalid option $REPLY";;
    esac
done








 













