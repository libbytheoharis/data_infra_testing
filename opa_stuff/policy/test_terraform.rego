package terraform.test_analysis

import data.terraform.analysis

test_allow_dev_deployment {
	analysis.allow_dev_deployment with input as {"planned_values": {"root_module": {"resources": [{
		"address": "aiven_redis.redis-demo",
		"mode": "managed",
		"type": "aiven_redis",
		"name": "redis-demo",
		"provider_name": "registry.terraform.io/aiven/aiven",
		"schema_version": 1,
		"values": {
			"cloud_name": "google-northamerica-northeast1",
			"plan": "hobbyist",
			"project": "devrel-dewan",
			"service_name": "redis-demo",
			"service_type": "redis",
		},
	}]}}}
}

test_not_allow_prod_deployment {
	not analysis.allow_prod_deployment with input as {"planned_values": {"root_module": {"resources": [{
		"address": "aiven_redis.redis-demo",
		"mode": "managed",
		"type": "aiven_redis",
		"name": "redis-demo",
		"provider_name": "registry.terraform.io/aiven/aiven",
		"schema_version": 1,
		"values": {
			"cloud_name": "google-northamerica-northeast1",
			"plan": "hobbyist",
			"project": "devrel-dewan",
			"service_name": "redis-demo",
			"service_type": "redis",
		},
	}]}}}
}
