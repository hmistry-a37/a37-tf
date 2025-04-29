output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS Kubernetes API server"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "The base64 encoded certificate data required to communicate with the cluster"
  value       = module.eks.cluster_certificate_authority_data
}

output "cluster_oidc_issuer_url" {
  description = "The OIDC Issuer URL associated with the EKS cluster"
  value       = module.eks.cluster_oidc_issuer_url
}

output "node_security_group_id" {
  description = "Security Group ID associated with the worker nodes"
  value       = module.eks.node_security_group_id
}

output "nodegroup_name" {
  description = "The name of the EKS Node Group"
  value       = module.eks.nodegroup_name
}
