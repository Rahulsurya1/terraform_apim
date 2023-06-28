resource "azurerm_resource_group" "etpx-rg" {
  name     = "eptx-apim-workflow1"
  location = "eastus2"
}

#API Management creation

resource "azurerm_api_management" "apimservice" {
  name                = "ETPX-service-1"
  location            = azurerm_resource_group.etpx-rg.location
  resource_group_name = azurerm_resource_group.etpx-rg.name
  publisher_name      = "etpxse"
  publisher_email     = "supr@rahul.com"
  sku_name            = "Developer_1"

}
resource "azurerm_api_management_custom_domain" "custdom" {
  api_management_id = azurerm_api_management.apimservice.id

  gateway {
    host_name            = "ETPX-APIM-1"
    key_vault_id         = null
    certificate          = null
    certificate_password = null
    negotiate_client_certificate = false
    default_ssl_binding = true

  }
}
#create application insights
resource "azurerm_application_insights" "insight" {
  name                = "eptx-app-insight-1"
  location            = azurerm_resource_group.etpx-rg.location
  resource_group_name = azurerm_resource_group.etpx-rg.name
  workspace_id        = azurerm_log_analytics_workspace.log.id
  application_type    = "web"
}

#create log analytics workspace
resource "azurerm_log_analytics_workspace" "log" {
  name                = "etpx-log-analytics-1"
  location            = azurerm_resource_group.etpx-rg.location
  resource_group_name = azurerm_resource_group.etpx-rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 40
  internet_ingestion_enabled = true
  internet_query_enabled = false
}

resource "azurerm_api_management_logger" "logger" {
  name                = "etpx-apimlogger-1"
  api_management_name = azurerm_api_management.apimservice.name
  resource_group_name = azurerm_resource_group.etpx-rg.name
  
  application_insights {
    instrumentation_key = azurerm_application_insights.insight.instrumentation_key
  }
}

