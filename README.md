# terraform-helm-istio

![Terraform Version](https://img.shields.io/badge/terraform-≥_1.0.0-blueviolet)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/boeboe/terraform-helm-istio?label=registry)](https://registry.terraform.io/modules/boeboe/istio/helm)
[![GitHub issues](https://img.shields.io/github/issues/boeboe/terraform-helm-istio)](https://github.com/boeboe/terraform-helm-istio/issues)
[![Open Source Helpers](https://www.codetriage.com/boeboe/terraform-helm-istio/badges/users.svg)](https://www.codetriage.com/boeboe/terraform-helm-istio)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

This terraform module will deploy [istio](https://istio.io) on any kubernetes cluster, using the official [helm charts](https://artifacthub.io/packages/search?org=istio).

| Helm Chart | Repo | Default Values |
|------------|------|--------|
| base | [repo](https://artifacthub.io/packages/helm/istio-official/base) | [values](https://artifacthub.io/packages/helm/istio-official/base?modal=values) |
| cni | [repo](https://artifacthub.io/packages/helm/istio-official/cni) | [values](https://artifacthub.io/packages/helm/istio-official/cni?modal=values) |
| istiod | [repo](https://artifacthub.io/packages/helm/istio-official/istiod) | [values](https://artifacthub.io/packages/helm/istio-official/istiod?modal=values) |
| gateway | [repo](https://artifacthub.io/packages/helm/istio-official/gateway) | [values](https://artifacthub.io/packages/helm/istio-official/gateway?modal=values) |

## Usage

``` hcl
provider "kubernetes" {
  config_path    = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
  }
}

module "istio" {
  source  = "boeboe/istio/helm"
  version = "0.0.2"

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
```

Check the [examples](examples) for more details.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| istio_version | istio version | string | - | true |
| istio_helm_namespace | istio helm namespace | string | "istio-system" | false |
| istio_helm_repo | istio helm repository | string | "https://istio-release.storage.googleapis.com/charts" | false |
| istio_base_settings | istio base settings | map | {} | false |
| istio_base_enabled | enable helm install of istio base | bool | true | false |
| istio_cni_settings | istio cni settings | map | {} | false |
| istio_cni_enabled | enable helm install of istio cni | bool | false | false |
| istio_istiod_settings | istio istiod settings | map | {} | false |
| istio_istiod_enabled | enable helm install of istio istiod | bool | true | false |
| istio_gateway_settings | istio gateway settings | map | {} | false |
| istio_gateway_enabled | enable helm install of istio gateway | bool | true | false |

## Outputs

| Name | Description | Type |
|------|-------------|------|
| istio_base_helm_metadata | block status of the istio base helm release | list |
| istio_cni_helm_metadata | block status of the istio cni helm release | list |
| istio_istiod_helm_metadata | block status of the istio istiod helm release | list |
| istio_gateway_helm_metadata | block status of the istio gateway helm release | list |


Example output:

``` hcl
istio_istiod_helm_metadata = {
  "app_version" = "1.15.3"
  "chart" = "istiod"
  "name" = "istio-istiod"
  "namespace" = "istio-system"
  "revision" = 1
  "values" = "{\"pilot\":{\"autoscaleMax\":4,\"autoscaleMin\":2}}"
  "version" = "1.15.3"
}

```

## More information

TBC

## License

terraform-helm-istio is released under the **MIT License**. See the bundled [LICENSE](LICENSE) file for details.
