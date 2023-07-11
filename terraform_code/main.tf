data "azurerm_resource_group" "etpx-apim-rg" {
  name     = "etpxapimdata"
}

data "azurerm_virtual_network" "etpx-apim-vnet" {
  name                = "vnet-spoke-digetpxdata01intdit001-prod-eu2-001"
  resource_group_name = data.azurerm_resource_group.etpx-apim-rg.name  
}

resource "azurerm_subnet" "etpx-apim-sn" {
    name                 = "etpx-apim-int-sn-2"
    virtual_network_name = data.azurerm_virtual_network.etpx-apim-vnet.name
    resource_group_name  = data.azurerm_resource_group.etpx-apim-rg.name
    address_prefixes     = ["10.0.30.0/24"]
    service_endpoints    = ["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.EventHub"]
        
}    
 
 resource "azurerm_network_security_group" "etpx-apim-nsg" {
  name                = "etpx-apim-nsg-2"
  resource_group_name = data.azurerm_resource_group.etpx-apim-rg.name
  location            = data.azurerm_resource_group.etpx-apim-rg.location

security_rule {
   
                name                        = "AllowManagementEndpointInbound"
                priority                    = 101
                direction                   = "Inbound"
                access                      = "Allow"
                protocol                    = "Tcp"
                source_port_range           = "*"
                destination_port_range      = "3443"
                source_address_prefix       = "ApiManagement.EASTUS2"
                destination_address_prefix  = "VirtualNetwork"
}      
}
