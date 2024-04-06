terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }

  # https://developer.hashicorp.com/terraform/language/settings/backends/s3
  backend "s3" {
    bucket = "my-tfsample"
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

# Configure the AWS provider
provider "aws" {
  region = var.region
}