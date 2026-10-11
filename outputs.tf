output "bds_bds_instance_os_patch_actions_id" {
  description = "Map of id values across all bds_bds_instance_os_patch_actions, keyed the same as var.bds_bds_instance_os_patch_actions except keys with no id are omitted"
  value       = { for k, v in oci_bds_bds_instance_os_patch_action.bds_bds_instance_os_patch_actions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "bds_bds_instance_os_patch_actions_bds_instance_id" {
  description = "Map of bds_instance_id values across all bds_bds_instance_os_patch_actions, keyed the same as var.bds_bds_instance_os_patch_actions except keys with no bds_instance_id are omitted"
  value       = { for k, v in oci_bds_bds_instance_os_patch_action.bds_bds_instance_os_patch_actions : k => v.bds_instance_id if v.bds_instance_id != null && length(v.bds_instance_id) > 0 }
}
output "bds_bds_instance_os_patch_actions_cluster_admin_password" {
  description = "Map of cluster_admin_password values across all bds_bds_instance_os_patch_actions, keyed the same as var.bds_bds_instance_os_patch_actions except keys with no cluster_admin_password are omitted"
  value       = { for k, v in oci_bds_bds_instance_os_patch_action.bds_bds_instance_os_patch_actions : k => v.cluster_admin_password if v.cluster_admin_password != null && length(v.cluster_admin_password) > 0 }
  sensitive   = true
}
output "bds_bds_instance_os_patch_actions_is_dry_run" {
  description = "Map of is_dry_run values across all bds_bds_instance_os_patch_actions, keyed the same as var.bds_bds_instance_os_patch_actions except keys with no is_dry_run are omitted"
  value       = { for k, v in oci_bds_bds_instance_os_patch_action.bds_bds_instance_os_patch_actions : k => v.is_dry_run if v.is_dry_run != null }
}
output "bds_bds_instance_os_patch_actions_os_patch_version" {
  description = "Map of os_patch_version values across all bds_bds_instance_os_patch_actions, keyed the same as var.bds_bds_instance_os_patch_actions except keys with no os_patch_version are omitted"
  value       = { for k, v in oci_bds_bds_instance_os_patch_action.bds_bds_instance_os_patch_actions : k => v.os_patch_version if v.os_patch_version != null && length(v.os_patch_version) > 0 }
}
output "bds_bds_instance_os_patch_actions_patching_configs" {
  description = "Map of patching_configs values across all bds_bds_instance_os_patch_actions, keyed the same as var.bds_bds_instance_os_patch_actions except keys with no patching_configs are omitted"
  value       = { for k, v in oci_bds_bds_instance_os_patch_action.bds_bds_instance_os_patch_actions : k => one(v.patching_configs) if v.patching_configs != null && length(v.patching_configs) > 0 }
}

