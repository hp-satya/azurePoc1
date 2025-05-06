param location string
param environment string
param appServicePlanSku string
param tags object
var appServicePlanName = 'asp-${environment}-fullstack-starter'
var webAppName = 'app-${environment}-fullstack-starter'
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSku
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
  tags: tags
}
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|16-lts'
      alwaysOn: true
    }
    httpsOnly: true
  }
  tags: tags
}
output webAppName string = webApp.name
output webAppHostName string = webApp.properties.defaultHostName
