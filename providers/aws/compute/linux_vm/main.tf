resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  
  network_interface {
    network_interface_id =   var.network_interface_id
    device_index = 0
  }

  tags = var.tags
}