    # A single-node Redis service
    
    resource "aiven_redis" "single-node-aiven-redis" {
      project                 = var.project_name
      cloud_name              = "aws-us-east-1"
      plan                    = "hobbyist"
      service_name            = "aws-us-redis"
    } 