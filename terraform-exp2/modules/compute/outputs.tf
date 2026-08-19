output "web_public_ips" {
  description = "Public IP addresses of the web servers"
  value       = aws_instance.web[*].public_ip
}

output "web_instance_ids" {
  description = "Instance IDs of the web servers"
  value       = aws_instance.web[*].id
}

output "db_private_ip" {
  description = "Private IP address of the database server"
  value       = aws_instance.db.private_ip
}

output "db_instance_id" {
  description = "Instance ID of the database server"
  value       = aws_instance.db.id
}
