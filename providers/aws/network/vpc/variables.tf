variable "cidr_block" {
  description = "The IPv4 CIDR block for the VPC. Range must be between /16 and /28 (65.536 - 16 IPs)."
  type = string
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC. Default is 'default'."
  type = string
  default = "default"
}

variable "tags" {
  description = "Additional default tags to add to the resources being deployed"
  type        = map(string)
}