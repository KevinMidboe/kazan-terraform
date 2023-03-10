provider "proxmox" {
  pm_api_url          = "https://${local.node}.${local.domain}:8006/api2/json"
  pm_tls_insecure     = true
  pm_debug            = true
  pm_log_enable       = true
  pm_log_file         = "terraform-plugin-proxmox.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
