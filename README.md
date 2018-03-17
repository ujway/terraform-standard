# terraform-standard

## This is still hoge

## Important: To keep Immutable Infrastructure is expected.

## Prepare
1. cp terraform.tfvars.sample terraform.tfvars
2. vim terraform.tfvars

Edit config variables.

## Deployment
1. terraform plan

*.tf files are automatically included.

2. terraform apply
3. terraform show

## Destroy
1. terraform plan --destroy
2. terraform destroy
