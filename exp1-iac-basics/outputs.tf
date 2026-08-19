output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.lab_vm.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.lab_vm.public_ip
}
