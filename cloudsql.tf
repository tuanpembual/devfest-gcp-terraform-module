resource "google_sql_database_instance" "db_estu" {
  project          = "jakarta-369305"
  name             = "db-estu"
  database_version = "POSTGRES_15"
  region           = "asia-southeast2"

  deletion_protection = false

  settings {
    tier      = "db-f1-micro"
    disk_size = 10

    disk_autoresize       = true
    disk_autoresize_limit = 11

    backup_configuration {
      enabled                        = true
      location                       = "asia-southeast2"
      point_in_time_recovery_enabled = true
    }

    insights_config {
      query_insights_enabled = true
    }

    maintenance_window {
      day  = 5
      hour = 20
    }

    availability_type = "ZONAL"
  }

  lifecycle {
    ignore_changes = [
      settings[0].disk_size
    ]
  }
}
