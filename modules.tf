module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source       = "./modules/cluster"
  project_name = var.project_name
  cluster_subnet_ids = [
    module.eks_network.subnet_pub_1a,
    module.eks_network.subnet_pub_1b
  ]
  cluster_version = var.cluster_version
  tags            = local.tags
}

# module "eks_node_group" {
#   source         = "./modules/manage-node-group"
#   project_name   = var.project_name
#   cluster_name   = module.eks_cluster.eks_cluster_name
#   instance_types = var.instance_types
#   desired_size   = 1
#   min_size       = 1
#   max_size       = 1
#   subnet_ids = [
#     module.eks_network.subnet_pub_1a,
#     module.eks_network.subnet_pub_1a
#   ]
#   tags = local.tags
# }

module "eks_load_balancer_controller" {
  source       = "./modules/load-balancer"
  project_name = var.project_name
  tags         = local.tags
}
