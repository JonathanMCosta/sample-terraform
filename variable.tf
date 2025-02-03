variable "cidr_block" {
  type        = string
  description = "Networking CIDR block to be used for the VPC"
}

variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "cluster_version" {
  type        = string
  description = "Version of the cluster"
}

variable "instance_types" {
  type        = list(string)
  description = "Instances types of the each node"
}
