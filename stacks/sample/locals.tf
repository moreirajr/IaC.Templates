locals {

    # VPC
    vpc_cidr_block = "10.0.0.0/16"

    # Subnet
    subnet_cicd_block = "10.0.1.0/24" # from 10.0.1.0 to 10.0.1.255.
    # RESERVED
    # 10.0.1.0 = network address
    # 10.0.1.1 = reserved by AWS for VPC router
    # 10.0.0.2 = reserved by AWS for mapping to Amazon-provided DNS
    # 10.0.0.3 = reserved by AWS for future use
    # 10.0.1.255 = broadcast address
    private_ips = ["10.0.1.4"]

    # EC2
    availability_zone = "us-east-1a"
    instance_type = "t2.nano"
    ami = "ami-0c101f26f147fa7fd"

    # Security Group
    sg_name = "ec2-sample-sg"
    
    sg_ingress_rules = [
      {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        protocol = "tcp"
        to_port = 80
      }
    ]

    sg_egress_rules = [
      {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 0
        protocol = "-1" # semantically equivalent to all ports
        to_port = 0
      }
    ]

    user_data_file = "../../scripts/dotnet_linux.sh"
}