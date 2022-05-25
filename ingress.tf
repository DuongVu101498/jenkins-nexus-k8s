resource "kubernetes_ingress_v1" "jenkins" {
  metadata {
    name = "jenkins-ingress"
    namespace = kubernetes_namespace.jenkins.metadata.0.name
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      host = var.jenkins_host
      http {
        path {
          backend {
            service {
              name = module.helm_jenkins.jenkins_svc_name
              port {
                number = module.helm_jenkins.jenkins_port
              }
            }
          }
          path = "/"
        }
        }
      }
    }
}

resource "kubernetes_ingress_v1" "nexus" {
  metadata {
    name = "nexus-ingress"
    namespace = kubernetes_namespace.nexus.metadata.0.name
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      host = var.nexus_host
      http {
        path {
          backend {
            service {
              name = "sonatype-nexus-nexus-repository-manager"
              port {
                number = var.nexus_repo_port
              }
            }
          }
          path = "/"
        }
        }
      }
    }
}

resource "kubernetes_ingress_v1" "localhost" {
  metadata {
    name = "localhost-ingress"
    namespace =  kubernetes_namespace.jenkins.metadata.0.name
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      host = "localhost"
      http {
        path {
          backend {
            service {
              name = "jenkins"
              port {
                number = var.jenkins_port
              }
              }
           }
          path = "/"
        }
      }
    }
  }
}