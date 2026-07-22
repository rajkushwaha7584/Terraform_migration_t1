locals {
  users_data = yamldecode(file("${path.module}/user.yaml"))
}