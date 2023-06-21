terraform {
    required_providers {
      aiven = {
        source = "aiven/aiven"
        version = "~> 4.5.0" # the ~ means that the that major.minor.0 versions will be in sync, but the patches will get updated. 
      }
    }
}

provider "aiven" {
    api_token = var.aiven_api_token
}