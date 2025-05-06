param location string
param environment string
param tags object
var serverName = 'sql-${environment}-fullstack-starter'
var databaseName = 'db-${environment}-fullstack-starter'
resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: serverName
  location: location
  properties: {
    administratorLogin: 'sqladmin'
    administratorLoginPassword: 'P@ssw0rd123!'
    minimalTlsVersion: '1.2'
  }
  tags: tags
}
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: databaseName
  parent: sqlServer
  location: location
  sku: {
    name: 'Basic'
  }
  tags: tags
}
output sqlServerName string = sqlServer.name
output sqlDatabaseName string = sqlDatabase.name
