output "public_instance_ids" {
  value       = aws_instance.public[*].id
  description = "IDs of public EC2 instances"
}

output "public_instance_public_ips" {
  value       = aws_instance.public[*].public_ip
  description = "Public IPs of public EC2 instances"
}

output "public_instance_private_ips" {
  value       = aws_instance.public[*].private_ip
  description = "Private IPs of public EC2 instances"
}

output "private_instance_ids" {
  value       = aws_instance.private[*].id
  description = "IDs of private EC2 instances"
}

output "private_instance_private_ips" {
  value       = aws_instance.private[*].private_ip
  description = "Private IPs of private EC2 instances"
}

output "public_security_group_id" {
  value       = aws_security_group.public.id
  description = "Public security group ID"
}

output "private_security_group_id" {
  value       = aws_security_group.private.id
  description = "Private security group ID"
}