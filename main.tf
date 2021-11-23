terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.48.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.cluster_name}-${var.env_name}"
  location = "eastus"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.cluster_name}-${var.env_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.cluster_name}-${var.env_name}"
  
  linux_profile {
    admin_username = "ubuntu"

        ssh_key {
            key_data = file(var.ssh_public_key)
        }
    }


    default_node_pool {
        name            = "agentpool"
        node_count      = var.agent_count
        vm_size         = "Standard_B2S"
    }

    identity {
        type = "SystemAssigned"
    }

    #addon_profile {
        #oms_agent {
        #enabled                    = true
        #log_analytics_workspace_id = azurerm_log_analytics_workspace.test.id
        #}
    #}

    network_profile {
        load_balancer_sku = "Standard"
        network_plugin = "kubenet"
    }

    tags = {
        Environment = "${var.env_name}"
    }
  }

