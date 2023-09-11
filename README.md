# IDM3 Sample docker setup

Docker compose for glassfish based web application with mysql database and phpmyadmin.

## Instructions:

1. Install Docker-desktop:  https://docs.docker.com/docker-for-windows/

2. Place an SQL dump of your database in ./db/mysql.sql. This will be auto loaded at launch

3. Place your app.war file in ./web/app.war. This will also be auto deployed on launch

## mysql

The following MySql connection details must be coded in your application

* Username = site_user

* Password = site_password

* database hostname = db

* database port = 3306

## Run

The easiest way to interact with this deployment is to open this folder in CS Code and in a new terminal enter the following commands:

1. docker-compose build   # this builds the container images based on the docker-compose.yaml configuration file
2. docker-compose up -d  # this launches the set of containers

## View

Access your web application at http://localhost:8880/app in browser. If you named your warfile differently then please change the url appropriately.

Access phpmyadmin  http://localhost:8888/ in browser



## Container Management

* docker-compose stop db   # Stop the db container
* docker-compose rm -fv db # Stop and remove the db container
* docker-compose stop web  # Stop the web container
* docker-compose rm -fv web # Stop and remove the web container
