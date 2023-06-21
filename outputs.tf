output "aiven_pg_uri" {
  value = aiven_pg.postgres_service.service_uri
  sensitive = true
}

output "aiven_clickhouse_uri" {
  value = aiven_clickhouse.clickhouse_service.service_uri
  sensitive = true
}

output "aiven_redis_uri" {
  value = aiven_redis.redis_service.service_uri
  sensitive = true
}
