variable "name" {
  description = "The name of the security group"
  type = string
}

variable "vpc_id" {
 type = string 
}

variable "ingress_rules" {
  description = "The ingress rule list"
  type        = list(object({
    security_group_id     = string
    cidr_ipv4 = string
    from_port = number
    ip_protocol = string
    to_port = number
  }))
  default     = []
}

variable "egress_rules" {
  description = "The egress rule list"
  type        = list(object({
    security_group_id     = string
    cidr_ipv4 = string
    from_port = number
    ip_protocol = string
    to_port = number
  }))
  default     = []
}

variable "tags" {
  description = "Additional default tags to add to the resources being deployed"
  type        = map(string)
}