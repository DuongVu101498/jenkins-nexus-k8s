output "nexus_repo_svc_name" {
  description = "name of nexus repository service in k8s"
  value       =  "${helm_release.nexus.name}-nexus-repository-manager"
}
output "nexus_repo_svc_port" {
  description = "the port number which nexus repository service will expose in k8s"
  value       =  var.nexus_repo_port
}