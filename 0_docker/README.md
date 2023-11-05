# Docker

This folder contains a docker-compose.yml file that defines a Tomcat based web application with a mysql database and a phpmyadmin install for DB administration.

## Instructions
Please refer to the contents of docker-compose.yml to view the set of containers defined for this project.

## Run

1. docker-compose build   # this builds the container images based on the docker-compose.yaml configuration file
2. docker-compose up -d  # this launches the set of containers

## View

Access your web application at http://localhost:8880/IDM3ProjectBasic-1.0-SNAPSHOT/ in your browser. If you named your warfile differently then please change the url appropriately.

Access phpmyadmin  http://localhost:8888/ in your browser

## Container Management

* docker-compose stop db   # Stop the db container
* docker-compose rm -fv db # Stop and remove the db container
* docker-compose stop web  # Stop the web container
* docker-compose rm -fv web # Stop and remove the web container
