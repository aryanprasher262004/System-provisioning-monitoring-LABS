variable "ami_id" {
  description = "AMI ID used for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string
}

variable "web_count" {
  description = "Number of web servers"
  type        = number
  default     = 2
}

variable "public_subnet_id" {
  description = "Public subnet ID for web servers"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID for database server"
  type        = string
}

variable "web_security_group_id" {
  description = "Security group ID for web servers"
  type        = string
}

variable "db_security_group_id" {
  description = "Security group ID for database server"
  type        = string
}
