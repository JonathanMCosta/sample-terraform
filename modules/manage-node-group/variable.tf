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

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}
