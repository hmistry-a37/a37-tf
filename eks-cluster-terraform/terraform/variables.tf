variable "aws_profile" {
  description = "AWS CLI Profile name"
  type        = string
  default     = "default" 
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "availability_zones" {
  description = "List of AZs"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDRs for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDRs for private subnets"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for the EKS Worker Nodes (optional)"
  type        = string
  default     = null
}

variable "key_name" {
  description = "EC2 Key Pair name to SSH into EKS Worker Nodes (optional)"
  type        = string
  default     = null
}

variable "region" {
  description = "AWS Region to deploy the resources"
  type        = string
  default     = "us-west-1"
}

variable "cluster_name" {
  description = "The name of the EKS Cluster"
  type        = string
  default     = "applied37dev-eks-cluster"
}

variable "eks_node_role_name" {
  description = "Name of the EKS node IAM role"
  type        = string
}

variable "eks_node_policy_name" {
  description = "Name of the EKS node IAM open policy"
  type        = string
}

variable "node_instance_type" {
  description = "EC2 instance type for EKS worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Desired number of EKS worker nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of EKS worker nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of EKS worker nodes"
  type        = number
  default     = 5
}

variable "domain_name" {
  description = "Domain name for Route53 Hosted Zone (e.g., applied37.io)"
  type        = string
}

variable "route53_zone_id" {
  description = "The Route53 Hosted Zone ID for applied37.ai"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "applied37"
  }
}
