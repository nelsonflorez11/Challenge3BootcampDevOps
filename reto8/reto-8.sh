#!/bin/bash

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
            docker build -t neslonflorez11/pokepy:1.0 .
            docker images
            echo "########################"
            echo "Imagen neslonflorez11/pokepy:1.0 creada"
            echo "#########################"
            docker run -d --name web -p 5000:5000 neslonflorez11/pokepy:1.0
            docker ps
            echo "########################"
            echo "Contenedor creado"
            echo "ingresar a URL http://localhost:5000/"
            echo "#########################";;
        "Eliminar recursos")
            cd src
            cd ..          
            rm -rf $PWD/pokepy
            docker stop $(docker ps -a -q)
            docker rm $(docker ps -a -q)
            docker rmi -f $(docker images -a -q)
            ;;            
        "Quit") 
            break ;;
        *) echo "invalid option $REPLY";;
    esac
done








 













