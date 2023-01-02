k8s_controllers = {
  lb1 = {
    target_node = "apollo",
    vcpu        = "2",
    memory      = "2048",
    disk_size   = "10G",
    name        = "lb1.kazan.schleppe",
    vmid        = 440
    ip          = "10.0.0.140",
    subnet      = "/24",
    gw          = "10.0.0.1"
  },
  c1 = {
    target_node = "apollo",
    vcpu        = "2",
    memory      = "2048",
    disk_size   = "10G",
    name        = "c1.kazan.schleppe",
    vmid        = 441
    ip          = "10.0.0.141",
    subnet      = "/24",
    gw          = "10.0.0.1"
  },
  c2 = {
    target_node = "apollo",
    vcpu        = "2",
    memory      = "2048",
    disk_size   = "10G",
    name        = "c2.kazan.schleppe",
    vmid        = 442
    ip          = "10.0.0.142",
    subnet      = "/24",
    gw          = "10.0.0.1"
  },
  c3 = {
    target_node = "apollo",
    vcpu        = "2",
    memory      = "2048",
    disk_size   = "10G",
    name        = "c3.kazan.schleppe",
    vmid        = 443
    ip          = "10.0.0.143",
    subnet      = "/24",
    gw          = "10.0.0.1"
  }
}

k8s_workers = {
  w1 = {
    target_node = "apollo",
    vcpu        = "2",
    memory      = "2048",
    disk_size   = "10G",
    name        = "w1.kazan.schleppe",
    vmid        = 444
    ip          = "10.0.0.144",
    subnet      = "/24",
    gw          = "10.0.0.1"
  },
  w2 = {
    target_node = "apollo",
    vcpu        = "2",
    memory      = "2048",
    disk_size   = "10G",
    name        = "w2.kazan.schleppe",
    vmid        = 445
    ip          = "10.0.0.145",
    subnet      = "/24",
    gw          = "10.0.0.1"
  },
  w3 = {
    target_node = "apollo",
    vcpu        = "2",
    memory      = "2048",
    disk_size   = "10G",
    name        = "w3.kazan.schleppe",
    vmid        = 446
    ip          = "10.0.0.146",
    subnet      = "/24",
    gw          = "10.0.0.1"
  }
}