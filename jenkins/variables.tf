variable "kube_config" {
  type        = string
  description = "the path to the kube config file, which store k8s credentail and k8s api server's URL"
  default = "~/.kube/config"
}
variable "jenkins_port" {
  type        = number
  description = "the port that the jeknins service will expose, ones the chart is installed in k8s cluster"
  default = 8080
}
variable "jenkins_namespace" {
    type        = string
    description = "the namespace where helm install the chart"
    default = "jenkins"
}