terraform {
  required_providers {
    aiven = {
      source  = "aiven/aiven"
      version = "~> 4.1.0"
    }
  }
}

provider "aiven" {
  api_token = var.aiven_api_token
}