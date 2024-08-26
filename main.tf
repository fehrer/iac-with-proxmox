terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.0"
    }
  }
}

provider "proxmox" {
  pm_api_url  = "https://179.94.98.152:8006/api2/json" 
  pm_user     = "root@pam"
  pm_password = "sccp1910"
}

# VM Web 1
resource "proxmox_vm_qemu" "web1" {
  name        = "web1"
  target_node = "homelab"
  clone       = "vm:100"
  full_clone  = true # Clone from template ID 100

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  agent = 1
}

# VM Web 2 
resource "proxmox_vm_qemu" "web2" {
  name        = "vm2"
  target_node = "homelab"
  clone       = "vm:100"
  full_clone  = true # Clone from template ID 100

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  agent = 1
}

# VM DataBase
resource "proxmox_vm_qemu" "database" {
  name        = "db"
  target_node = "homelab"

  clone      = "vm:100"
  full_clone = true # Clone from template ID 100


  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  agent = 1
}