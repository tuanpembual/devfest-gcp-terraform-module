resource "google_service_account" "vm_sa" {
  project      = "jakarta-369305"
  account_id   = "vm-sa-estu"
  display_name = "Custom SA for VM Instance"
}

module "vm_estu" {
  source                  = "./modules/compute"
  name                    = "vm-estu"
  metadata_startup_script = "echo hi > /test.txt"

  service_account = google_service_account.vm_sa.email
}
