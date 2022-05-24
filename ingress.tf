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
              name = "${module.helm_jenkins.jenkins_svc_name}"
              port {
                number = "${module.helm_jenkins.jenkins_svc_port}"
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
              name = "${module.helm_nexus.jenkins_svc_name}"
              port {
                number = "${module.helm_nexus.jenkins_svc_port}"
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
    namespace = "default"
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
              name = "${module.helm_jenkins.jenkins_svc_name}"
              port {
                number = "${module.helm_jenkins.jenkins_svc_port}"
              }
              }
            path = "/"
         }
        }
      }
    }
  }
}