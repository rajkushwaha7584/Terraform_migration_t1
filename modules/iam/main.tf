resource "aws_iam_user" "users" {
  for_each = { for user in local.users_data.users : user.username => user }

  name = each.value.username

}