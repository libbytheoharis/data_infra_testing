resource "aiven_redis" "redis-demo" {
    project = "devrel-dewan" # Find your Aiven project name from top-left of Aiven console
    plan = "hobbyist" # For this exercise, the hobbyist plan will do
    service_name = "redis-demo" # Choose any service name
    cloud_name = "aws-us-east1" # Choose any cloud region from https://docs.aiven.io/docs/platform/reference/list_of_clouds
}