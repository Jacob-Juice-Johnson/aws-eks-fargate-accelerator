output "public_subnet_id_a" {
  description = "The public subnet ID"
  value       = aws_subnet.public_a.id
}

output "public_subnet_id_b" {
  description = "The public subnet ID"
  value       = aws_subnet.public_b.id
}

output "private_subnet_id_a" {
  description = "The private subnet ID"
  value       = aws_subnet.private_a.id
}

output "private_subnet_id_b" {
  description = "The private subnet ID"
  value       = aws_subnet.private_b.id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}
