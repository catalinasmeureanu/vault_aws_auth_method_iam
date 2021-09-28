#!/bin/bash -x
set -aex

vault server -dev -dev-root-token-id root -dev-listen-address 0.0.0.0:8200&

export VAULT_ADDR='http://127.0.0.1:8200'

terraform init

terraform apply -auto-approve -var-file="secret.tfvars"

export VAULT_ADDR='http://127.0.0.1:8200'

vault login -method=aws role=test-role   
