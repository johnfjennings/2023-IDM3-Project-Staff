# IDM3 Sample docker setup

Docker compose for glassfish based web application with mysql database and phpmyadmin. 

## Instructions:
Install Docker-desktop:  https://docs.docker.com/docker-for-windows/

Place dump of database in ./db/mysql.sql to be auto loaded at launch

Place app.war file in ./web/app.war to be auto deployed on launch

## mysql

Username:password = site_user:site_password

database hostname = db

database port = 3306


## Run

Build:

docker-compose build

Run:

docker-compose up -d

Access web application at http://localhost:8880/app in browser

Access phpmyadmin  http://localhost:8888/ in browser

Stop:

docker-compose stop db

docker-compose rm -fv db

docker-compose stop web

docker-compose rm -fv web



