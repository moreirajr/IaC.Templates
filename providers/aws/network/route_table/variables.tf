variable "cidr_block" {
  description = "The CIDR block of the route."
  type = string
}

variable "gateway_id" {
  description = "Identifier of a VPC internet gateway, virtual private gateway, or local."
  type = string
  default = "local"
}

variable "routes" {
  description = "The route list"
  type        = list(object({
    cidr_block     = string
    
    # One of the following target argument must be supplied:
    carrier_gateway_id = string
    core_network_arn = string
    egress_only_gateway_id = string
    gateway_id = string
    local_gateway_id = string
    nat_gateway_id = string
    network_interface_id = string
    transit_gateway_id = string
    vpc_endpoint_id = string
    vpc_peering_connection_id = string
  }))
  default     = []
}

variable "tags" {
  description = "Additional default tags to add to the resources being deployed"
  type        = map(string)
}