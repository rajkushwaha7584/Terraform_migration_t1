terraform {
  backend "s3" {
    bucket       = "us-app-tf-state"
    key          = "learning-project/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
