#!/bin/bash

#correr export desde la misma shell que ejecute el script, remplazando XXXXXXXX como corresponda 

#export user_docker=XXXXXXXX
#export passwd_docker=XXXXXXXX

PS3='Please enter your choice: '
options=(
        "Iniciar"
        "Eliminar recursos"
        "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Iniciar")           
            git clone https://github.com/roxsross/pokepy.git
            cp -r src/requirements.txt pokepy/requirements.txt
            echo "########################"
            echo Repositorio Descargado""
            echo "########################"
            cd pokepy 
            docker build -t nelsonflorez11/pokepy:1.0 .
            docker images
            echo "########################"
            echo "Imagen neslonflorez11/pokepy:1.0 creada"
            echo "#########################"
            docker run -d --name web -p 5000:5000 nelsonflorez11/pokepy:1.0
            docker ps
            echo "########################"
            echo "Contenedor creado"
            echo "ingresar a URL http://localhost:5000/"
            echo "#########################"
            docker login -u $user_docker -p $passwd_docker docker.io                
            docker push nelsonflorez11/pokepy:1.0
            echo "########################"
            echo "Imagen subida a Docker Hub"            
            echo "#########################"
            ;;
        "Eliminar recursos")
            cd src
            cd ..          
            rm -rf $PWD/pokepy
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








 













