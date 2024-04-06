resource "aws_resourcegroups_group" "rg" {
  name = var.name
  tags = var.tags
}