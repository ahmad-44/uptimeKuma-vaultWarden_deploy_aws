## Instructions to reproduce

- Clone the repo and navigate inside it

- Crate a user in AWS with at least three services. (ignore if you are already an admin)

        1. EC2FullAccess
        2. VPC Full VPCFullAcces
        3. IAMReadOnlyAccess

- Create a key pair for your user account in AWS > EC2 > KeyPairs

- Create Access Key ID and Secret Access Key of the user from AWS > IAM > Users > [Select the User] > Security Credentials > Create Access Key. Copy it in a safe place.

- Make a copy of _terraform.tfvars_ by runnung `cp infra/terraform.tfvars.example infra/terraform.tfvars`
- Fill the variables inside \*infra/terraform.tfvars

- Make a copy of .env.example by running `cp docker/.env.example docker/.env`
- Fill the values inside docker/.env

- run `aws configure` to authenticate your AWS with terraform.

- Run these commands to deploye Uptime Kuma and Vaultwarden
        cd infra
        terraform init
        terraform plan
        terraform apply
