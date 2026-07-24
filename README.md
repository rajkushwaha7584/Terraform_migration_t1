# Terraform migration t1

Terraform configuration that creates an EC2 instance, a private encrypted S3 bucket
containing `rj.txt`, and IAM users defined in `modules/iam/user.yaml`.

## Prerequisites

- Terraform 1.10 or later
- AWS credentials with access to the configured S3 state bucket and permissions to
  manage the resources in this configuration
- The remote-state bucket `us-app-tf-state` must already exist in `us-east-1`

## Usage

```powershell
terraform init
terraform plan
terraform apply
```

Configure the AWS region and instance type in `terraform.tfvars`. The AMI is
region-specific; if you change the region, set an appropriate `ami_id` in
`terraform.tfvars`. Provide `vpc_security_group_ids` for the instance rather
than relying on the default security group.
