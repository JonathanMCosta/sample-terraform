variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "cluster_subnet_ids" {
  type        = list(string)
  description = "Subnets for the cluster"
}

# variable "public_subnet_1a" {
#   type        = string
#   description = "Subnet to create EKS cluster AZ 1a"
# }

# variable "public_subnet_1b" {
#   type        = string
#   description = "Subnet to create EKS cluster AZ 1b"
# }

variable "cluster_version" {
  type        = string
  description = "Version of the cluster"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}
