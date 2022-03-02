# AWS_EB_Terraform
Creating infrastructure with the Elastic Beanstalk service using Terraform.

# Requirements
- aws-cli 1.22.61
- Terraform 1.1.6
- Make 4.3

# Create infrastructure
cp terraform.tfvars.example terraform.tfvars  
terraform init  
terraform plan  
terraform apply

# Deploy Elastic Beanstalk application
cp .env.example .env  
make create-new-application  
make deploy-environment  