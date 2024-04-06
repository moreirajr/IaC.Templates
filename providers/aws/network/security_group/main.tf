# Used to get the vpc cidr
data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_security_group" "sg" {
  name        = var.name
  vpc_id      = var.vpc_id

 dynamic "ingress" {
    for_each = var.ingress_rules 
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = [aws_security_group.sg.id]
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = [aws_security_group.sg.id]
    }
  }

  tags = var.tags
}
