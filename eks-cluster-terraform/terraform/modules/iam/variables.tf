variable "eks_node_role_name" {
  description = "Name of the IAM role for EKS worker nodes"
  type        = string
}

variable "eks_node_policy_name" {
  description = "Name of the IAM policy for EKS worker nodes"
  type        = string
}

variable "tags" {
  description = "Tags to apply to IAM resources"
  type        = map(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster (used to name IAM resources)"
  type        = string
}
