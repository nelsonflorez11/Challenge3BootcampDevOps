#!/bin/bash

#correr estos export desde la misma shell que se ejecute el script

#export user=testUsers
#export passwd=test
#export passwd_root=testRoot

docker run --name bbdd  \
-p 3306:3306 \
--env MARIADB_ROOT_PASSWORD=$passwd_root  \
--env MARIADB_DATABASE=prueba  \
--env MARIADB_USER=$user  \
--env MARIADB_PASSWORD=$passwd  \
mariadb --port 3306













