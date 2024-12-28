output "eks_vpc_config" {
  value = aws_eks_cluster.eks_cluster.vpc_config
}

output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}
