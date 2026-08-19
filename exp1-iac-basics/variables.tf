variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "machine_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "exp1-terraform-vm"
}
