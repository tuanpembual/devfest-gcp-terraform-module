resource "google_storage_bucket" "terraform_state" {
  project       = "jakarta-369305"
  name          = "terraform-state-backend-estu"
  location      = "asia-southeast2"
  force_destroy = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 90
    }
  }
}
