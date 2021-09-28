variable "AWS_ACCESS_KEY_ID" {
  description = "AWS_ACCESS_KEY_ID"
  type        = string
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS_SECRET_ACCESS_KEY"
  type        = string
  sensitive   = true
}

variable "bound_iam_principal_arns" {
  description = "bound_iam_principal_arns"
  type        = string
  sensitive   = true
}