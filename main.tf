resource "aws_opensearchserverless_collection_group" "opensearchserverless_collection_groups" {
  for_each = var.opensearchserverless_collection_groups

  name             = each.value.name
  standby_replicas = each.value.standby_replicas
  description      = each.value.description
  generation       = each.value.generation
  region           = each.value.region
  tags             = each.value.tags

  dynamic "capacity_limits" {
    for_each = each.value.capacity_limits != null ? each.value.capacity_limits : []
    content {
      max_indexing_capacity_in_ocu = capacity_limits.value.max_indexing_capacity_in_ocu
      max_search_capacity_in_ocu   = capacity_limits.value.max_search_capacity_in_ocu
      min_indexing_capacity_in_ocu = capacity_limits.value.min_indexing_capacity_in_ocu
      min_search_capacity_in_ocu   = capacity_limits.value.min_search_capacity_in_ocu
    }
  }
}

