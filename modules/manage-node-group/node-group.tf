resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-node-group"
  node_role_arn   = aws_iam_role.eks_mgn_role.arn
  subnet_ids      = var.subnet_ids

  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.large"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # update_config {
  #   max_unavailable = 1
  # }

  tags = merge(
    var.tags,
    {
      Name                               = "${var.project_name}-node-group"
      "kubernetes.io/cluster/my-cluster" = "owned"
    }
  )

  depends_on = [
    aws_iam_role_policy_attachment.nmg_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nmg_AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.nmg_AmazonEKS_CNI_Policy,
  ]
}