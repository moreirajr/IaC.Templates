## About
Simple example to create a EC2 instance.

## Creating the infrastructure

1. Create the bucket to save the terraform state.
2. run:
    terraform init

    CREATE:
    terraform plan --var-file=env.tfvars

    terraform apply --var-file=env.tfvars

    DESTROY:
    terraform destroy --var-file=env.tfvars