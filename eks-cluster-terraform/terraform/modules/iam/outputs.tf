output "eks_node_role_arn" {
  description = "ARN of the IAM role for EKS worker nodes"
  value       = aws_iam_role.eks_node_role.arn
}

output "eks_node_instance_profile_name" {
  description = "Name of the instance profile for EKS worker nodes"
  value       = aws_iam_instance_profile.eks_node_instance_profile.name
}
