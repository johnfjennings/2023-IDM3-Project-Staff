# Deploy to Azure

Source: https://learn.microsoft.com/en-us/azure/container-instances/tutorial-docker-compose


## Setup

Install Azure CLI - https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli



## Commands 

# First you need to login to Azure and create an account if necessary
az login 

# Next create a resource group to contain all resources for this project 

az group create --name myResourceGroup --location northeurope 


# Once you've created the resource group, create an Azure container registry with the az acr create command. The container registry name must be unique within Azure, and contain 5-50 alphanumeric characters:

az acr create --resource-group myResourceGroup --name tusidm3 --sku Basic



# You might need to login again if you come back to this step
az login

# You must log in to your Azure Container Registry instance before pushing images to it
az acr login --name tusidm3


# To use Docker commands to run containers in Azure Container Instances, first log into Azure:

docker login azure

# Create an ACI context by running docker context create aci. This context associates Docker with an Azure subscription and resource group so you can create and manage container instances. For example, to create a context called myacicontext:

docker context create aci myacicontext

# Next, change to the ACI context. Subsequent Docker commands run in this context.
docker context use myacicontext



# Need to upload mysql.sql and app.war files to azure file share 

https://learn.microsoft.com/en-us/azure/container-instances/container-instances-volume-azure-files



# Create the storage account with the parameters & then create the file share
az storage account create --resource-group myResourceGroup --name mystorageaccountidm32023 --location northeurope --sku Standard_LRS


az storage share create --name idm3share --account-name mystorageaccountidm32023

Login to https://portal.azure.com/
Goto Storage Accounts 
Create idm3share-db folder
Create idm3share-war folder
upload mysql.sql to idm3share-db folder
upload app.war to idm3share-war folder





# After each reboot or session

az login

az acr login --name tusidm3


docker login azure
docker-compose up --build

Goto Azure Portal and find public IP address of container

Goto http://<ipaddress>:80/ to access phpmyadmin
Goto http://<ipaddress>:8080/app/ to access WebApplication 