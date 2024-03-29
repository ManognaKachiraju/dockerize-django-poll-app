
resource "azurerm_resource_group" "example" {
  name     = "django-app-test"
  location = "West Europe"
} 

resource "azurerm_kubernetes_cluster" "example" {
  name                = "poll-app-aks1"
  location            = "West Europe"
  resource_group_name = "django-app-test"
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}
