# Controller outputs
output "controller_vm_id" {
  description = "The VM Id"
  value = {
    for k, vm in proxmox_vm_qemu.k8s-kazan-controllers : k => vm.id
  }
}

output "controller_vm_name" {
  description = "The VM name"
  value = {
    for k, vm in proxmox_vm_qemu.k8s-kazan-controllers : k => vm.name
  }
}

output "controller_clone" {
  description = "Template name that this VM was cloned from"
  value = {
    for k, vm in proxmox_vm_qemu.k8s-kazan-controllers : k => vm.clone
  }
}

# Worker outputs
output "worker_vm_id" {
  description = "The VM Id"
  value = {
    for k, vm in proxmox_vm_qemu.k8s-kazan-workers : k => vm.id
  }
}

output "worker_vm_name" {
  description = "The VM name"
  value = {
    for k, vm in proxmox_vm_qemu.k8s-kazan-workers : k => vm.name
  }
}

output "worker_clone" {
  description = "Template name that this VM was cloned from"
  value = {
    for k, vm in proxmox_vm_qemu.k8s-kazan-workers : k => vm.clone
  }
}
