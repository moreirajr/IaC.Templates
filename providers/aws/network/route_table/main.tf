resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.test.id

  dynamic "route" {
    for_each = var.routes
    content {
        cidr_block     = each.value.cidr_block
        carrier_gateway_id = each.value.carrier_gateway_id
        core_network_arn = each.value.core_network_arn
        egress_only_gateway_id = each.value.egress_only_gateway_id
        gateway_id = each.value.gateway_id
        local_gateway_id = each.value.local_gateway_id
        nat_gateway_id = each.value.nat_gateway_id
        network_interface_id = each.value.network_interface_id
        transit_gateway_id = each.value.transit_gateway_id
        vpc_endpoint_id = each.value.vpc_endpoint_id
        vpc_peering_connection_id = each.value.vpc_peering_connection_id  
    }
  }

  tags = var.tags
}