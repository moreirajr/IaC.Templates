variable "vpc_id" {
 type = string 
}

variable "name" {
  description = "The name of the security group"
  type = string
  default = null
}

variable "ingress_rules" {
  description = "The ingress rule list"
  type        = list(object({
    cidr_blocks = list(string)
    from_port = number
    protocol = string
    to_port = number
  }))
  default     = []
}

variable "egress_rules" {
  description = "The egress rule list"
  type        = list(object({
    cidr_blocks = list(string)
    from_port = number
    protocol = string
    to_port = number
  }))
  default     = []
}

variable "tags" {
  description = "Additional default tags to add to the resources being deployed"
  type        = map(string)
}