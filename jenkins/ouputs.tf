output "jenkins_svc_name" {
  description = "name of jenkins service in k8s"
  value       =  helm_release.jenkins.name
}
output "jenkins_svc_port" {
  description = "the port number which jenkins service will expose in k8s"
  value       =  var.jenkins_port
}