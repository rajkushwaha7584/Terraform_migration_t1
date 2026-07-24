locals {
  users_data = yamldecode(file("${path.module}/user.yaml"))

  users = {
    for user in local.users_data.users : user.username => user
  }

  role_policy_arns = {
    admin        = "arn:aws:iam::aws:policy/AdministratorAccess"
    read-only    = "arn:aws:iam::aws:policy/ReadOnlyAccess"
    ec2allaccess = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  }
}
