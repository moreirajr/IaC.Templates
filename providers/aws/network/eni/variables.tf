variable "subnet_id" {
  description = "The subnet Id."
  type = string
}

variable "private_ips" {
  description = "List of private IPs to attach to the ENI."
  type = list(string)
}