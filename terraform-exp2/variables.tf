variable "aws_region" {
  description = "AWS region for Experiment 2"
  type        = string
}

variable "ami_id" {
  description = "Amazon Linux 2023 AMI ID"
  type        = string
}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string
}

variable "admin_cidr" {
  description = "Public IP CIDR allowed to SSH to web servers"
  type        = string
}

variable "web_count" {
  description = "Number of web servers"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
