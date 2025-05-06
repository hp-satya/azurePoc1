param location string = resourceGroup().location
param environment string = 'dev'
param appServicePlanSku string = 'B1'
@description('Tags to apply to all resources')
param tags object = {
  environment: environment
  project: 'fullstack-starter'
}
module appService './modules/app-service.bicep' = {
  name: 'appServiceDeploy'
  params: {
    location: location
    environment: environment
    appServicePlanSku: appServicePlanSku
    tags: tags
  }
}
module database './modules/database.bicep' = {
  name: 'databaseDeploy'
  params: {
    location: location
    environment: environment
    tags: tags
  }
}
