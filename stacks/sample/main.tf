module "vpc" {
  source = "../../providers/aws/network/vpc"
  cidr_block = local.vpc_cidr_block

  tags = var.tags
}

module "public_subnet" {
  depends_on = [
    module.vpc
  ]

  source = "../../providers/aws/network/subnet"
  vpc_id = module.vpc.id
  cidr_block = local.subnet_cicd_block
  availability_zone = local.availability_zone

  tags = var.tags
}

module "eni" {
  depends_on = [
    module.public_subnet 
  ]

  source = "../../providers/aws/network/eni"
  subnet_id = module.public_subnet.id
  private_ips = local.private_ips
}

module "public_ec2_instance" {
  depends_on = [
    module.eni
  ]

  source = "../../providers/aws/compute/linux_vm"
  ami = local.ami
  instance_type = local.instance_type
  availability_zone = local.availability_zone
  network_interface_id =  module.eni.id

  tags = var.tags
}