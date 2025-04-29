# --- SECURITY GROUP ---
resource "aws_security_group" "eks_cluster_sg" {
  name        = "${var.cluster_name}-eks-cluster-sg"
  description = "Security group for the EKS cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow EKS API access from anywhere (tighten later)"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = var.tags
}

# --- EKS CLUSTER ---
resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    security_group_ids      = [aws_security_group.eks_cluster_sg.id]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  kubernetes_network_config {
    service_ipv4_cidr = "172.20.0.0/16"
  }

  tags = var.tags

  depends_on = [
    aws_security_group.eks_cluster_sg
  ]
}

# --- LAUNCH TEMPLATE ---
resource "aws_launch_template" "eks_launch_template" {
  name_prefix   = "${var.cluster_name}-lt-"
  image_id      = var.ami_id
  instance_type = var.node_instance_type
  key_name      = var.key_name

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 50
      volume_type = "gp3"
      delete_on_termination = true
    }
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.eks_cluster_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }

  tags = var.tags
}

# --- EKS NODE GROUP ---
resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-nodegroup"
  node_role_arn   = var.eks_node_role_arn
  subnet_ids      = var.private_subnet_ids

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_size
    min_size     = var.min_size
  }

  launch_template {
    id      = aws_launch_template.eks_launch_template.id
    version = "$Latest"
  }

  update_config {
    max_unavailable = 1
  }

  tags = var.tags

  depends_on = [
    aws_launch_template.eks_launch_template
  ]
}
