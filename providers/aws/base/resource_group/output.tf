output "id" {
  description = "Id of the created Resource Group"
  value = aws_resourcegroups_group.rg.id
}

output "name" {
  description = "Name of the created Resource Group"
  value = aws_resourcegroups_group.rg.name
}
