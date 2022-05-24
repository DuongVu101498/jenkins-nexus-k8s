provider "helm" {
  kubernetes {
    config_path = var.kube_config
  }
}
resource "helm_release" "nexus" {
    name       = "controller"
    repository = "https://helm.nginx.com/stable"
    chart      = "nginx-ingress"
    version    = "0.13.2"
    namespace  = kubernetes_namespace.ingress.metadata.0.name
  
    // values for helm chart
    values = [
     "${file("${path.module}/ingress-nginx-values.yaml")}"
    ]
}