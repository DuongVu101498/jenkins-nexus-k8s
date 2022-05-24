provider "kubernetes" {
  config_path = var.kube_config
}

// helm install jenkins
module "jenkins" {
    source = "./jenkins"
    jenkins_namespace = kubernetes_namespace.jenkins.metadata.0.name
    jenkins_port = var.jenkins_port 
}

//// helm install nexus repo
module "nexus" {
    source = "./nexus"
    nexus_namespace = kubernetes_namespace.nexus.metadata.0.name
    nexus_repo_port = var.nexus_repo_port
    docker_registry_port = var.docker_registry_port
}

