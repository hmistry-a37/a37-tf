variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EKS cluster and nodes will be launched"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for worker nodes"
  type        = list(string)
}

variable "eks_role_arn" {
  description = "IAM Role ARN for EKS Cluster"
  type        = string
}

variable "eks_node_role_arn" {
  description = "IAM Role ARN for EKS Worker Nodes"
  type        = string
}

variable "instance_profile_name" {
  description = "Instance Profile name for EKS Worker Nodes"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the worker nodes"
  type        = string
  default     = null
}

variable "key_name" {
  description = "SSH Key Pair name for nodes (optional)"
  type        = string
  default     = null
}

variable "node_instance_type" {
  description = "Instance type for the worker nodes"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of nodes"
  type        = number
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}
