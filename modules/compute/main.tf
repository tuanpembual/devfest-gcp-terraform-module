locals {
  metadata = {
    "enable-oslogin"         = "true"
    "block-project-ssh-keys" = "true"
  }
}

resource "google_compute_instance" "compute" {
  name                = var.name
  machine_type        = var.machine_type
  zone                = var.zone
  project             = var.project
  deletion_protection = var.deletion_protection

  boot_disk {
    initialize_params {
      image  = var.disk_image
      size   = var.disk_size
      type   = var.disk_type
      labels = var.disk_labels
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    dynamic "access_config" {
      for_each = var.is_public ? [true] : []

      content {
        nat_ip = var.public_ip_address
      }
    }
  }

  metadata_startup_script = var.metadata_startup_script

  metadata = merge(var.metadata, local.metadata)

  service_account {
    email  = var.service_account
    scopes = var.scopes
  }
}