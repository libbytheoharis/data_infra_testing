// This creates the PostgreSQL service
resource "aiven_pg" "postgres_service" {
  project                 = var.project_name
  service_name            = join("-", ["postgres", var.cloud_region])
  cloud_name              = var.cloud_region
  plan                    = "startup-4"
}

// This creates the relational PostgreSQL database
resource "aiven_pg_database" "relational_database" {
  project       = var.project_name
  service_name  = aiven_pg.postgres_service.service_name
  database_name = "relational_database"
}

// This creates the PostgreSQL admin user
resource "aiven_pg_user" "postgres_admin_user" {
  service_name = aiven_pg.postgres_service.service_name
  project      = var.project_name
  username     = var.db_username
  password     = var.db_password
}

// This creates the ClickHouse service
resource "aiven_clickhouse" "clickhouse_service" {
  project                 = var.project_name
  service_name            = join("-", ["clickhouse", var.cloud_region])
  cloud_name              = var.cloud_region
  plan                    = "startup-8" 
}


// ClickHouse service integration for the PostgreSQL service as a source
resource "aiven_service_integration" "clickhouse_postgres_source" {
  project                  = var.project_name
  integration_type         = "clickhouse_postgresql"
  source_service_name      = aiven_pg.postgres_service.service_name
  destination_service_name = aiven_clickhouse.clickhouse_service.service_name
  clickhouse_postgresql_user_config {
    databases {
      database = aiven_pg_database.relational_database.database_name
      schema   = "public"
    }
  }
}

// This creates the Redis service
resource "aiven_redis" "redis_service" {
  project                 = var.project_name
  cloud_name              = var.cloud_region
  plan                    = "startup-4"
  service_name            = join("-", ["redis", var.cloud_region])
}

// This creates the Redis admin user
resource "aiven_redis_user" "redis_admin_user" {
  service_name = aiven_redis.redis_service.service_name
  project      = var.project_name
  username     = var.db_username
  password     = var.db_password
}

resource "aiven_redis" "redis-demo" {
    project = "devrel-dewan" # Find your Aiven project name from top-left of Aiven console
    plan = "hobbyist" # For this exercise, the hobbyist plan will do
    service_name = "redis-demo" # Choose any service name
    cloud_name = "google-northamerica-northeast1" # Choose any cloud region from https://docs.aiven.io/docs/platform/reference/list_of_clouds
}