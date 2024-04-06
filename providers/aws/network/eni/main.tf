
resource "aws_network_interface" "eni" {
  subnet_id = var.subnet_id
  private_ips = var.private_ips
}