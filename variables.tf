variable "aiven_api_token" {
  description = "Aiven console API token"
  type        = string
}

variable "project_name" {
  description = "Aiven console project name"
  type        = string
}

variable "cloud_region" {
  description = "The specific cloud region to use"
  type        = string
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

# values are provided through % export TF_VAR_aiven_api_token=<here is token>
# OR
# use tf.vars file with terraform apply -var-file=var-values.tfvars