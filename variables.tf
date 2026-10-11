variable "opensearchserverless_collection_groups" {
  description = <<EOT
Map of opensearchserverless_collection_groups, attributes below
Required:
    - name
    - standby_replicas
Optional:
    - description
    - generation
    - region
    - tags
    - capacity_limits (block):
        - max_indexing_capacity_in_ocu (optional)
        - max_search_capacity_in_ocu (optional)
        - min_indexing_capacity_in_ocu (optional)
        - min_search_capacity_in_ocu (optional)
EOT

  type = map(object({
    name             = string
    standby_replicas = string
    description      = optional(string)
    generation       = optional(string)
    region           = optional(string)
    tags             = optional(map(string))
    capacity_limits = optional(list(object({
      max_indexing_capacity_in_ocu = optional(number)
      max_search_capacity_in_ocu   = optional(number)
      min_indexing_capacity_in_ocu = optional(number)
      min_search_capacity_in_ocu   = optional(number)
    })))
  }))
}

