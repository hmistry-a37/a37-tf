# --- IAM Module ---
module "iam" {
  source = "./modules/iam"

  cluster_name          = var.cluster_name
  eks_node_role_name    = var.eks_node_role_name
  eks_node_policy_name  = var.eks_node_policy_name
  tags                  = var.tags
}



# --- Route53 Module ---
# module "route53" {
#   source = "./modules/route53"

#   route53_zone_id = var.route53_zone_id
# }

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = var.tags
}

# --- EKS Module ---
module "eks" {
  source = "./modules/eks"

  cluster_name           = var.cluster_name
  vpc_id = module.vpc.vpc_id
  private_subnet_ids     = module.vpc.private_subnet_ids
  eks_role_arn           = module.iam.eks_node_role_arn
  eks_node_role_arn      = module.iam.eks_node_role_arn
  instance_profile_name  = module.iam.eks_node_instance_profile_name
  ami_id                 = var.ami_id
  key_name               = var.key_name
  node_instance_type     = var.node_instance_type
  desired_capacity       = var.desired_capacity
  min_size               = var.min_size
  max_size               = var.max_size
  tags                   = var.tags
}
