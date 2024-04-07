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

# module "eni" {
#   depends_on = [
#     module.public_subnet 
#   ]

#   source = "../../providers/aws/network/eni"
#   subnet_id = module.public_subnet.id
#   private_ips = local.private_ips
# }

module "sg" {
  depends_on = [
    module.vpc
  ]
  
  source = "../../providers/aws/network/security_group"
  vpc_id = module.vpc.id
  name = local.sg_name

  ingress_rules = local.sg_ingress_rules
  egress_rules = local.sg_egress_rules

  tags = var.tags
}

# network_interface_id and vpc_security_group_ids are mutually exclusive
module "public_ec2_instance" {
  depends_on = [
    #module.eni,
    module.vpc,
    module.public_subnet,
    module.sg
  ]

  source = "../../providers/aws/compute/linux_vm"
  ami = local.ami
  instance_type = local.instance_type

  subnet_id = module.public_subnet.id
  availability_zone = local.availability_zone
  #network_interface_id =  module.eni.id
  vpc_security_group_ids = [module.sg.id]

  user_data_file = local.user_data_file

  tags = var.tags
}