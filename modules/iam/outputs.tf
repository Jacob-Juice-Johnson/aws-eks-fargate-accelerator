output "role_arn" {
  description = "ID of the EKS IAM role"
  value       = aws_iam_role.this.arn
}

output "fargate_arn" {
  description = "ID of the fargate IAM role"
  value       = aws_iam_role.fargate.arn
}
