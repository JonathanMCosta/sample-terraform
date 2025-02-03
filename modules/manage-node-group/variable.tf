variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name node group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet ids for node group"
}

variable "instance_types" {
  type        = list(string)
  description = "Instances types of the each node"
}

variable "desired_size" {
  type    = number
  default = 1
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 1
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}
