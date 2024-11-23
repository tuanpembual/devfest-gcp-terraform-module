resource "google_service_account" "vm_sa" {
  project      = "jakarta-369305"
  account_id   = "vm-sa-estu"
  display_name = "Custom SA for VM Instance"
}

resource "google_compute_instance" "vm_estu" {
  project      = "jakarta-369305"
  name         = "vm-estu"
  machine_type = "n2-standard-1"
  zone         = "asia-southeast2-a"

  deletion_protection = true

  boot_disk {
    initialize_params {
      image  = "debian-cloud/debian-11"
      size   = 20
      type   = "pd-balanced"
      labels = {
        name = "disk-vm-estu"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    email  = google_service_account.vm_sa.email
    scopes = ["cloud-platform"]
  }
}