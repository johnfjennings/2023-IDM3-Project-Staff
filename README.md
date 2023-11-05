# IDM3 Sample Intellij Project

## Introduction
This repo contains a sample Intellij project with a Docker container deployment configuration. 

The root folder of this repo is an Intellij project and should be opened with Intellij Ultimate Edition 2023.2+.

The root folder also contains the following non-Intellij related folders:
 * 0_docker - This folder contains all the docker related files  
 * 1_docs - This is a folder that should contain all documents relating to your project, e.g. reports, presentations, etc.
 * 2_staticwebsite - This folder can contain a static html & css files to build a static website when developing your design template 
 * 3_assets - This folder can contain all of your original source asset files 



## Requirements

Install the following software:
* Intellij Ultimate Edition 2023.2+ (https://www.jetbrains.com/idea/)  
* Docker-desktop (https://docs.docker.com/docker-for-windows/)
* Git (https://git-scm.com/)


## Instructions
1. Clone this repo to your computer
2. Place an SQL dump of your database in ./0_docker/db/mysql.sql. This will be auto loaded into the MYSQL database server at launch
3. Place your packaged WAR file in ./0_docker/web/app.war. 
   1. This will also be auto deployed on launch to the following URL http://localhost:8880/IDM3ProjectBasic-1.0-SNAPSHOT/
   2. To create a new WAR file from Intellij to to the Menu -> BUILD -> BUILD ARTEFACTS -> IDM3ProjectBasic - ACTION ->BUILD
   3. Copy the resultant WAR file from ./target/ to ./0_docker/web/
   4. Follow instructions in the ./0_docker/README.md to build and launch your docker containers 