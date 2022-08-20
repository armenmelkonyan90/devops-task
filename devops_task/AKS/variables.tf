variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
  default     = "devops_task_rg"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
  default     = "westeurope"
}
variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
  default     = "devopsTaskAks"
}
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.24.0"
}
variable "node_count" {
  type        = number
  description = "Number of AKS worker nodes"
  default     = 2
}
variable "acr_name" {
  type        = string
  description = "ACR name"
  default     = "devopsTaskAcr"
}
variable "acr_sku" {
  type        = string
  description = "ACR name"
  default     = "Standard"
}
variable "acr_admin_enabled" {
  description = "swich acr admin"
  default     = "false"
}
variable "node_wm_size" {
  type        = string
  description = "worker node wirtual mashine size"
  default     = "Standard_DS2_v2"
}
variable "node_type" {
  type        = string
  description = "node vm type"
  default     = "VirtualMachineScaleSets"
}
variable "availability_zones" {
  type        = list(any)
  description = "availabelity zones for worker nodes"
  default     = [1, 2, 3]
}
variable "enable_auto_scaling" {
  description = "enable autoscaling for worker node"
  default     = false
}
variable "identity_type" {
  type        = string
  description = "worker node identity type"
  default     = "SystemAssigned"
}
variable "load_balancer_sku" {
  type        = string
  description = "network profile load balancer sku"
  default     = "standard"
}
variable "network_plugin" {
  type        = string
  description = "network profile network plugin"
  default     = "kubenet"
}


variable "github_token" {
  type        = string
  description = "Github account token"

}
variable "github_owner" {
  type        = string
  description = "Github account username"
  default     = "armenmelkonyan90"

}
variable "github_repo_name" {
  type        = string
  description = "Name for ArgoCD github repository"
  default     = "devops_task_ArgoCD"

}
variable "template_repo_owner" {
  type        = string
  description = "Template repository owner"
  default     = "hakobmkoyan771"

}
variable "template_repo_name" {
  type        = string
  description = "Template repository name"
  default     = "infra"

}
variable "argocd_name" {
  type        = string
  description = "Argo-cd relise name"
  default     = "argocd"

}
variable "argocd_chart_repo" {
  type        = string
  description = "Argo-cd chart repository"
  default     = "https://argoproj.github.io/argo-helm"

}
variable "chart_name" {
  type        = string
  description = "Chart name in repository "
  default     = "argo-cd"

}
variable "chart_version" {
  type        = string
  description = "Argo-cd chart version"
  default     = "4.9.0"

}
variable "namespace" {
  type        = string
  description = "Kubernetes namespase for Argo-cd"
  default     = "argo-cd"

}
variable "create_namespase" {
  type        = bool
  description = "Create namespace for Argo-cd in kubernetes cluster"
  default     = true

}
variable "fluentd_name" {
  type        = string
  description = "Fluentd relise name"
  default     = "fluentd"

}
variable "fluentd_chart_repo" {
  type        = string
  description = "Fluentd chart repository"
  default     = "https://fluent.github.io/helm-charts"
}
variable "f_chart_name" {
  type        = string
  description = "Fluentd chart name"
  default     = "fluentd"
}
variable "f_chart_version" {
  type        = string
  description = "Fluentd chart version"
  default     = "0.3.9"

}
variable "f_namespace" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "kube-logging"

}
