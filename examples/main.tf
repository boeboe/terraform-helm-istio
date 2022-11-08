locals {
  kubeconfig_path = "~/.kube/config"

  istio_version = "1.15.3"
  istio_istiod_settings = {
    "pilot.autoscaleMin" = 2
    "pilot.autoscaleMax" = 4
  }
  istio_gateway_settings = {
    "autoscaling.minReplicas" = 2
    "autoscaling.maxReplicas" = 4
  }
}

provider "kubernetes" {
  config_path    = local.kubeconfig_path
}

provider "helm" {
  kubernetes {
    config_path    = local.kubeconfig_path
  }
}

module "istio" {
  source = "./.."

  istio_version          = local.istio_version
  istio_istiod_settings  = local.istio_istiod_settings
  istio_gateway_settings = local.istio_gateway_settings
}