resource "kubernetes_ingress" "jenkins" {
  metadata {
    name = "jenkins-ingress"
    namespace = kubernetes_namespace.jenkins.metadata.0.name
  }

  spec {
    rule {
      host = var.jenkins_host
      http {
        path {
          backend {
            service_name = module.jenkins.jenkins_svc_name
            service_port = module.jenkins.jenkins_svc_port
          }

          path = "/"
        }
        }
      }
    }
}

resource "kubernetes_ingress" "nexus" {
  metadata {
    name = "nexus-ingress"
    namespace = kubernetes_namespace.nexus.metadata.0.name
  }
  spec {
    rule {
      host = var.nexus_host
      http {
        path {
          backend {
            service_name = module.nexus.nexus_repo_svc_name
            service_port = module.nexus.nexus_repo_svc_port
          }

          path = "/"
        }
        }
      }
    }
}

resource "kubernetes_ingress" "localhost" {
  metadata {
    name = "localhost-ingress"
    namespace = "default"
  }

  spec {
    rule {
      host = var.jenkins_host
      http {
        path {
          backend {
            service_name = module.jenkins.jenkins_svc_name
            service_port = module.jenkins.jenkins_svc_port
          }

          path = "/"
        }
        }
      }
    }
}