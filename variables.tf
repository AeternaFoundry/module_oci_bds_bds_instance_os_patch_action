variable "bds_bds_instance_os_patch_actions" {
  description = <<EOT
Map of bds_bds_instance_os_patch_actions, attributes below
Required:
    - bds_instance_id
    - cluster_admin_password
    - os_patch_version
Optional:
    - is_dry_run
    - patching_configs (block):
        - batch_size (optional)
        - patching_config_strategy (required)
        - tolerance_threshold_per_batch (optional)
        - tolerance_threshold_per_domain (optional)
        - wait_time_between_batch_in_seconds (optional)
        - wait_time_between_domain_in_seconds (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    bds_instance_id        = string
    cluster_admin_password = string
    os_patch_version       = string
    is_dry_run             = optional(bool)
    patching_configs = optional(object({
      batch_size                          = optional(number)
      patching_config_strategy            = string
      tolerance_threshold_per_batch       = optional(number)
      tolerance_threshold_per_domain      = optional(number)
      wait_time_between_batch_in_seconds  = optional(number)
      wait_time_between_domain_in_seconds = optional(number)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.bds_bds_instance_os_patch_actions : (
        v.patching_configs == null || (contains([for v in ["DOWNTIME_BASED", "BATCHING_BASED", "DOMAIN_BASED"] : lower(v)], lower(v.patching_configs.patching_config_strategy)))
      )
    ])
    error_message = "must be one of: \"DOWNTIME_BASED\", \"BATCHING_BASED\", \"DOMAIN_BASED\""
  }
}

