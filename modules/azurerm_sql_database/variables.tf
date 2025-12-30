variable "sql_database" {
  type = map(object({
    name           = string
    sql_server_key = string
    collation      = string
    max_size_gb    = number
    sku_name       = string

    short_term_retention_policy = optional(object({
      retention_days = number
    }))
  }))
}

variable "sql_server_ids" {
  type = map(string)
}
