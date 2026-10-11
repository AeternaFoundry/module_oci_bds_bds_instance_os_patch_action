resource "oci_bds_bds_instance_os_patch_action" "bds_bds_instance_os_patch_actions" {
  for_each = var.bds_bds_instance_os_patch_actions

  bds_instance_id        = each.value.bds_instance_id
  cluster_admin_password = each.value.cluster_admin_password
  os_patch_version       = each.value.os_patch_version
  is_dry_run             = each.value.is_dry_run

  dynamic "patching_configs" {
    for_each = each.value.patching_configs != null ? [each.value.patching_configs] : []
    content {
      batch_size                          = patching_configs.value.batch_size
      patching_config_strategy            = patching_configs.value.patching_config_strategy
      tolerance_threshold_per_batch       = patching_configs.value.tolerance_threshold_per_batch
      tolerance_threshold_per_domain      = patching_configs.value.tolerance_threshold_per_domain
      wait_time_between_batch_in_seconds  = patching_configs.value.wait_time_between_batch_in_seconds
      wait_time_between_domain_in_seconds = patching_configs.value.wait_time_between_domain_in_seconds
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

