variable "istio_version" {
  description = "istio version"
  type        = string
}

variable "istio_helm_namespace" {
  description = "istio helm namespace"
  type        = string
  default     = "istio-system"
}

variable "istio_helm_repo" {
  description = "istio helm repository"
  type        = string
  default     = "https://istio-release.storage.googleapis.com/charts"
}


variable "istio_base_settings" {
  description = "istio base settings"
  type        = map
  default     = {}
}

variable "istio_base_enabled" {
  description = "enable helm install of istio base"
  type        = bool
  default     = true
}

variable "istio_cni_settings" {
  description = "istio cni settings"
  type        = map
  default     = {}
}

variable "istio_cni_enabled" {
  description = "enable helm install of istio cni"
  type        = bool
  default     = false
}

variable "istio_istiod_settings" {
  description = "istio istiod settings"
  type        = map
  default     = {}
}

variable "istio_istiod_enabled" {
  description = "enable helm install of istio istiod"
  type        = bool
  default     = true
}

variable "istio_gateway_settings" {
  description = "istio gateway settings"
  type        = map
  default     = {}
}

variable "istio_gateway_enabled" {
  description = "enable helm install of istio gateway"
  type        = bool
  default     = true
}