provider "helm" {
  kubernetes {
    config_path = var.kube_config
  }
}

resource "helm_release" "jenkins" {
  name       = "jenkins"
  wait       = false
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    =  "4.1.1"
  namespace  = var.jenkins_namespace
  set{
    name   = "controller.servicePort"
    value  = "${var.jenkins_port}"
  }
}