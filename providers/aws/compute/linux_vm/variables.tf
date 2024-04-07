variable "ami" {
  description = "The Id of the AMI."
  type = string
}

variable "instance_type" {
  description = "Instance type of the EC2 instance"
  type = string
}

variable "subnet_id" {
  description = "The Id of the subnet."
  type = string
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type = string
}

variable "network_interface_id" {
  type = string
  default = null
}

variable "vpc_security_group_ids" {
  description = "(Optional, VPC only) List of security group IDs to associate with."
  type = list(string)
  default = []
}

variable "tags" {
  description = "Additional default tags to add to the resources being deployed"
  type        = map(string)
}