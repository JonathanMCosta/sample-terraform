module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = local.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b
}

module "eks_node_group" {
  source       = "./modules/manage-node-group"
  project_name = var.project_name
  cluster_name = module.eks_cluster.eks_cluster_name
  subnet_ids = [
    module.eks_network.subnet_priv_1a,
    module.eks_network.subnet_priv_1a
  ]
  tags = local.tags
}
