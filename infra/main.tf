provider "aws" {
  region = var.aws_region
}

# Call the EC2 module
module "ec2" {
  source           = "./modules/ec2"
  instance_type    = var.instance_type
  ssh_key_name     = var.ssh_key_name
  allowed_ssh_cidr = var.allowed_ssh_cidr
  user_data_file   = "${path.module}/../user-data/cloud-init.sh"
}
