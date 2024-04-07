output "vpc_id" {
  value = module.vpc.id
}

output "subnet_id" {
  value = module.public_subnet.id
}

# output "eni_id" {
#   value = module.eni.id
# }

output "ec2_instance" {
  value = module.public_ec2_instance.id
}

output "sg_id" {
  value = module.sg.id
}