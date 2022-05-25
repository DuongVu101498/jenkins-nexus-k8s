provider "helm" {
  kubernetes {
    config_path = var.kube_config
  }
}

resource "helm_release" "nexus" {
  name       = "sonatype-nexus"
  wait       = false
  repository = "https://sonatype.github.io/helm3-charts/"
  chart      = "nexus-repository-manager"
  version    = "38.1.2"
  namespace  = var.nexus_namespace
  
  // values for helm chart
  /*
  values = [
    "${file("${path.module}/values/values.yaml")}"
  ]
  */
  set{
    type    = string
    name    = "nexus.nexusPort"
    value   = var.nexus_repo_port
  }
  set {
    type    = string
    name    = "nexus.docker.registries.port"
    value   = var.docker_registry_port
  }
 
  
  set {
    name    = "nexus.docker.enabled"
    value   = "true"
  }
  set {
    name    = "nexus.docker.registries.host"
    value   = "chart.local"
  }
  set {
    name    = "nexus.docker.registries.secretName"
    value   = "registry-secret"
  }
  
}