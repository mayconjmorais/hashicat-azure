resource "azurerm_resource_group" "example" {
  name     = "my-resources-network"
  location = "westus2"

  tags = {
    department = "devops"
    Billable   = "true"
  }
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  address_spaces      = ["10.0.0.0/16", "10.2.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  subnet_service_endpoints = {
    "subnet1" : ["Microsoft.Sql"],
    "subnet2" : ["Microsoft.Sql"],
    "subnet3" : ["Microsoft.Sql"]
  }

  tags = {
    Department = "devops"
    Billable   = "true"
  }

  depends_on = [azurerm_resource_group.example]
}