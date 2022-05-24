resource "kubernetes_namespace" "jenkins" {
  metadata {
    name = "jenkins"
  }
}
resource "kubernetes_namespace" "nexus" {
  metadata {
    name = "nexus"
  }
}
resource "kubernetes_namespace" "ingress" {
  metadata {
    name = "ingress-controller"
  }
}