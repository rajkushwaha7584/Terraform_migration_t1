module "ec2" {
  source = "./modules/ec2"

  instance_type          = var.instance_type
  ami_id                 = var.ami_id
  vpc_security_group_ids = var.vpc_security_group_ids
}

module "s3" {
  source = "./modules/s3"
}

module "iam" {
  source = "./modules/iam"
}
