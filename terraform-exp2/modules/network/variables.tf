variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_az" {
  description = "Availability Zone for the public subnet"
  type        = string
}

variable "private_az" {
  description = "Availability Zone for the private subnet"
  type        = string
}

variable "admin_cidr" {
  description = "CIDR allowed to SSH into the web servers"
  type        = string
}
