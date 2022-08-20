
# Azure Kubernetes Cluster

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_role_assignment" "main" {
  scope                            = azurerm_container_registry.main.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.main.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_container_registry" "main" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name                  = "worker"
    node_count            = var.node_count
    vm_size               = var.node_wm_size
    type                  = var.node_type
    enable_auto_scaling   = var.enable_auto_scaling
    enable_node_public_ip = true
  }
  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file("~/.ssh/devtask.pub")
    }
  }



  identity {
    type = var.identity_type
  }

  network_profile {
    load_balancer_sku = var.load_balancer_sku
    network_plugin    = var.network_plugin
  }
}

resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.main]
  filename   = "config"
  content    = azurerm_kubernetes_cluster.main.kube_config_raw
}

# GITHUB REPOSITORY

resource "github_repository" "main" {
  name        = var.github_repo_name
  description = "ArgoCD repository"

  visibility = "public"

  template {
    owner      = var.template_repo_owner
    repository = var.template_repo_name
  }
}

# Argo-cd with helm

resource "helm_release" "argocd" {
  depends_on       = [local_file.kubeconfig]
  name             = var.argocd_name
  repository       = var.argocd_chart_repo
  chart            = var.chart_name
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespase

  values = [
    "${file("values.yaml")}"
  ]
}
resource "helm_release" "fluentd" {
  depends_on       = [local_file.kubeconfig]
  name             = var.fluentd_name
  repository       = var.fluentd_chart_repo
  chart            = var.f_chart_name
  version          = var.f_chart_version
  namespace        = var.f_namespace
  create_namespace = var.create_namespase

  values = [
    "${file("f_values.yaml")}"
  ]
  # set {
  #   name  = "configMap"
  #   value = "elasticsearch-output"
  # }
  # set {
  #   name  = "ELASTICSEARCH_HOST"
  #   value = "35.158.104.5"
  # }
  # set {
  #   name  = "ELASTICSEARCH_PORT"
  #   value = "9200"
  #   }

  # set {
  #   name = "aggregator.configMap"
  #   value = "elasticsearch-output"
  # }
  # set {
  #   name = "aggregator.extraEnv[0].name"
  #   value = "ELASTICSEARCH_HOST"
  # }
  # set {
  #   name = "aggregator.extraEnv[0].value"
  #   value = "18.192.116.234"
  # }
  # set {
  #   name = "aggregator.extraEnv[1].name"
  #   value = "ELASTICSEARCH_POR"
  # }
  # set {
  #   name = "aggregator.extraEnv[1].value"
  #   value = "9200"
  # }
}

