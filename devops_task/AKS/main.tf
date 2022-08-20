
module "aks" {
  source = "../../modules/Azure_k8s"

  resource_group_name = var.resource_group_name
  acr_name            = var.acr_name
  location            = var.location
  acr_sku             = var.acr_sku
  acr_admin_enabled   = var.acr_admin_enabled
  cluster_name        = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  node_count          = var.node_count
  node_wm_size        = var.node_wm_size
  node_type           = var.node_type
  availability_zones  = var.availability_zones
  enable_auto_scaling = var.enable_auto_scaling
  identity_type       = var.identity_type
  load_balancer_sku   = var.load_balancer_sku
  network_plugin      = var.network_plugin
  github_repo_name    = var.github_repo_name
  template_repo_owner = var.template_repo_owner
  template_repo_name  = var.template_repo_name
  argocd_name         = var.argocd_name
  argocd_chart_repo   = var.argocd_chart_repo
  chart_name          = var.chart_name
  chart_version       = var.chart_version
  namespace           = var.namespace
  create_namespase    = var.create_namespase
  fluentd_name        = var.fluentd_name
  fluentd_chart_repo  = var.fluentd_chart_repo
  f_chart_name        = var.f_chart_name
  f_chart_version     = var.f_chart_version
  f_namespace         = var.f_namespace

}


