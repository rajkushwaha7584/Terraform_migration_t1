output "user_names" {
  description = "Names of the IAM users created from user.yaml."
  value       = keys(aws_iam_user.users)
}
