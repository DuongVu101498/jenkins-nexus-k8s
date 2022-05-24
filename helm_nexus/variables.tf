variable "kube_config" {
  type        = string
  description = "the path to the kube config file, which store k8s credentail and k8s api server's URL"
  default = "~/.kube/config"
}
variable "nexus_repo_port" {
  type        = number
  description = "the port that the nexus repository service will expose, ones the chart is installed in k8s cluster"
  default = 8081
}
variable "docker_registry_port" {
  type        = number
  description = "the port that the nexus docker repository service will expose, ones the chart is installed in k8s cluster"
  default = 5000
}
variable "nexus_namespace" {
    type        = string
    description = "the namespace where helm install the chart"
    default = "nexus"
}