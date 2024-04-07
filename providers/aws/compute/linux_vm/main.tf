data "template_file" "user_data" {
  template = file(var.user_data_file)
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  subnet_id     = var.subnet_id  
  availability_zone = var.availability_zone
  vpc_security_group_ids = var.vpc_security_group_ids
  
  # Creates network interface only if it's declared
  dynamic "network_interface" {
    for_each = var.network_interface_id != null ? [1] : []
    content {
      network_interface_id = var.network_interface_id
      device_index = 0
    }
  }

  user_data = data.template_file.user_data.rendered

  tags = var.tags
}