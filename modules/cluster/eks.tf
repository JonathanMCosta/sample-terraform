resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids              = var.cluster_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  version = var.cluster_version

  # access_config {
  #   authentication_mode = "API"
  # }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-cluster"
    }
  )

  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
  ]
}
