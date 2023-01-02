terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">= 2.9.10"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.27.0"
    }
  }

  backend "gcs" {
    bucket = "schleppe-tfstate"
    prefix = "kazan"
  }

  # backend "local" {}
}

resource "proxmox_vm_qemu" "k8s-kazan-controllers" {
  for_each    = var.k8s_controllers
  name        = each.value.name
  target_node = each.value.target_node
  vmid        = each.value.vmid
  desc        = "Kazan kubernetes cluster controller node: ${each.value.name}"

  sockets = 1
  cores   = each.value.vcpu
  memory  = each.value.memory
  cpu     = "host"

  clone      = "kazan-master-template"
  full_clone = true

  agent    = 1
  onboot   = true
  boot     = "cdn"
  bootdisk = "scsi0"
  os_type  = "cloud-init"
  hotplug  = "network,disk,usb"

  ipconfig0    = "ip=${each.value.ip}${each.value.subnet},gw=${each.value.gw}"
  nameserver   = local.nameserver
  searchdomain = local.searchdomain
  sshkeys      = <<-EOF
  %{for key in local.public_ssh_keys~}
  ${key}
  %{endfor~}
  EOF

  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = each.value.disk_size
    backup  = 0
  }

  network {
    model     = "virtio"
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
  }

  vga {
    memory = 0
    type   = "serial0"
  }
}

resource "proxmox_vm_qemu" "k8s-kazan-workers" {
  for_each    = var.k8s_workers
  name        = each.value.name
  target_node = each.value.target_node
  vmid        = each.value.vmid
  desc        = "Kazan kubernetes cluster worker node: ${each.value.name}"

  sockets = 1
  cores   = each.value.vcpu
  memory  = each.value.memory
  cpu     = "host"

  clone      = "kazan-master-template"
  full_clone = true

  agent    = 1
  onboot   = true
  boot     = "cdn"
  bootdisk = "scsi0"
  os_type  = "cloud-init"
  hotplug  = "network,disk,usb"

  ipconfig0    = "ip=${each.value.ip}${each.value.subnet},gw=${each.value.gw}"
  nameserver   = local.nameserver
  searchdomain = local.searchdomain
  sshkeys      = <<-EOF
  %{for key in local.public_ssh_keys~}
  ${key}
  %{endfor~}
  EOF

  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = each.value.disk_size
    backup  = 0
  }

  network {
    model     = "virtio"
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
  }

  vga {
    type = "serial0"
  }
}
