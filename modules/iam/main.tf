resource "aws_iam_user" "users" {
  for_each = local.users

  name = each.value.username
  tags = {
    Role = each.value.role
  }
}

resource "aws_iam_user_policy_attachment" "role_policy" {
  for_each = local.users

  user       = aws_iam_user.users[each.key].name
  policy_arn = local.role_policy_arns[each.value.role]
}
