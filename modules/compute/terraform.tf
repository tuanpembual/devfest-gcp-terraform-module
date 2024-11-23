terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.12.0"
    }
  }
  required_version = ">= 1.8.1"
}
