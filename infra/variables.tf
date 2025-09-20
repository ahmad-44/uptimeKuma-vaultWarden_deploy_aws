variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.small"
}

variable "ssh_key_name" {
  description = "Name of the AWS SSH key pair to access the server"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH (example: YOUR_PUBLIC_IP/32)"
}

variable "admin_token" {
  description = "Admin token for Vaultwarden"
  type        = string
  sensitive   = true
}
