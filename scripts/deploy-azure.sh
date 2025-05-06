#!/bin/bash
# Check if Azure CLI is installed
if ! command -v az &> /dev/null
then
   echo "Azure CLI could not be found. Please install it first."
   exit 1
fi
# Login to Azure
az login
# Set variables
RESOURCE_GROUP="fullstack-starter-rg"
LOCATION="eastus"
ENVIRONMENT="dev"
# Create resource group
az group create --name $RESOURCE_GROUP --location $LOCATION
# Deploy infrastructure
az deployment group create \
 --resource-group $RESOURCE_GROUP \
 --template-file infrastructure/main.bicep \
 --parameters infrastructure/parameters.json
echo "Azure deployment complete!"