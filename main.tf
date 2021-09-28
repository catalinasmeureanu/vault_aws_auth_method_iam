terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "vault" {
  address = "http://127.0.0.1:8200"
}

#Build AWS auth method
resource "vault_auth_backend" "aws" {
type = "aws"
#path = "aws"
}

#Configures the client used by an AWS Auth Backend in Vault
resource "vault_aws_auth_backend_client" "aws_client" {
backend = vault_auth_backend.aws.path
access_key = var.AWS_ACCESS_KEY_ID
secret_key = var.AWS_SECRET_ACCESS_KEY
}

#Map an AWS IAM role to a vault role
resource "vault_aws_auth_backend_role" "example-role-iam" {
backend = vault_auth_backend.aws.path
role = "test-role" 
auth_type = "iam"
#bound_iam_role_arns = ["*"]
bound_iam_principal_arns = [var.bound_iam_principal_arns]
#bound_iam_principal_arns = ["arn:aws:iam::*"]

token_ttl = 60
token_max_ttl = 120
token_policies = ["default"]
}