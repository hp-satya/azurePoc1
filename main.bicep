// Storage Account for Frontend
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'fst${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

// App Service Plan for Backend
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'backendAppServicePlan'
  location: resourceGroup().location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
}

// App Service for Backend
resource backendApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'backendApp${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
      ]
    }
  }
}

output storageAccountName string = storageAccount.name
output backendAppName string = backendApp.name
