variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
}
variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
}
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}
variable "node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}
variable "acr_name" {
  type        = string
  description = "ACR name"
}
variable "acr_sku" {
  type        = string
  description = "ACR name"

}
variable "acr_admin_enabled" {
  description = "Swich acr admin"

}
variable "node_wm_size" {
  type        = string
  description = "Worker node wirtual mashine size"

}
variable "node_type" {
  type        = string
  description = "Node vm type"

}
variable "availability_zones" {
  type        = list(any)
  description = "Availabelity zones for worker nodes"

}
variable "enable_auto_scaling" {
  description = "Enable autoscaling for worker node"

}
variable "identity_type" {
  type        = string
  description = "Worker node identity type"

}
variable "load_balancer_sku" {
  type        = string
  description = "Network profile load balancer sku"

}
variable "network_plugin" {
  type        = string
  description = "Network profile network plugin"

}
variable "github_repo_name" {
  type        = string
  description = "Name for ArgoCD github repository"

}
variable "template_repo_owner" {
  type        = string
  description = "Template repository owner"

}
variable "template_repo_name" {
  type        = string
  description = "Template repository name"

}
variable "argocd_name" {
  type        = string
  description = "Argo-cd relise name"

}
variable "argocd_chart_repo" {
  type        = string
  description = "Argo-cd chart repository"

}
variable "chart_name" {
  type        = string
  description = "Chart name in repository "

}
variable "chart_version" {
  type        = string
  description = "Argo-cd chart version"

}
variable "namespace" {
  type        = string
  description = "Kubernetes namespase for Argo-cd"

}
variable "create_namespase" {
  type        = bool
  description = "Create namespace for Argo-cd in kubernetes cluster"

}
variable "fluentd_name" {
  type        = string
  description = "Fluentd relise name"

}
variable "fluentd_chart_repo" {
  type        = string
  description = "Fluentd chart repository"

}
variable "f_chart_name" {
  type        = string
  description = "Fluentd chart name"

}
variable "f_chart_version" {
  type        = string
  description = "Fluentd chart version"

}
variable "f_namespace" {
  type        = string
  description = "Kubernetes namespace for fluentd"

}


