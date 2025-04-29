resource "aws_iam_role" "eks_node_role" {
  name = "${var.cluster_name}-node-role-v3"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = [
            "ec2.amazonaws.com",
            "eks.amazonaws.com"
          ]
        },
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_policy" "eks_node_open_policy" {
  name        = var.eks_node_policy_name
  description = "Open policy allowing all actions (for testing only — tighten later)"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "*",
        Resource = "*"
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "attach_open_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = aws_iam_policy.eks_node_open_policy.arn
}

resource "aws_iam_instance_profile" "eks_node_instance_profile" {
  name = "${var.eks_node_role_name}-instance-profile"
  role = aws_iam_role.eks_node_role.name
}
