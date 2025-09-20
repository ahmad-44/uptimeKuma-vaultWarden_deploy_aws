variable "instance_type" {}
variable "ssh_key_name" {}
variable "allowed_ssh_cidr" {}
variable "user_data_file" {}
variable "admin_token" {
  description = "Admin token for Vaultwarden"
  type        = string
  sensitive   = true
}