variable "vpc_id"{
  description = "The VPC where the subnet will be created."
  type = string
}

variable "cidr_block" {
  description = "The CIDR block."
  type = string
}

variable "availability_zone" {
  description = "The AZ where the subnet will be created."
  type = string
}

variable "tags" {
  description = "Additional default tags to add to the resources being deployed"
  type        = map(string)
}