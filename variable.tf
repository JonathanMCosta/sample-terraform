variable "cidr_block" {
  type        = string
  description = "Networking CIDR block to be used for the VPC"
}

variable "az_number" {
  # Assign a number to each AZ letter used in our configuration
  default = {
    a = 1
    b = 2
    c = 3
    d = 4
    e = 5
    f = 6
  }
}
