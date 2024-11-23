variable "name" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "n2-standard-2"
}

variable "project" {
  type    = string
  default = "jakarta-369305"
}

variable "network" {
  type    = string
  default = "projects/jakarta-369305/global/networks/default"
}

variable "subnetwork" {
  type    = string
  default = "projects/jakarta-369305/regions/asia-southeast2/subnetworks/default"
}

variable "zone" {
  type    = string
  default = "asia-southeast2-a"
}

variable "deletion_protection" {
  type    = bool
  default = true
}

variable "disk_image" {
  type    = string
  default = "debian-cloud/debian-11"
}

variable "disk_size" {
  type    = number
  default = 20
}

variable "disk_type" {
  type    = string
  default = "pd-balanced"
}

variable "disk_labels" {
  type    = map(string)
  default = { name = "disk-vm-estu" }
}

variable "service_account" {
  type = string
}

variable "scopes" {
  type    = list(string)
  default = ["cloud-platform"]
}

variable "metadata" {
  type    = map(string)
  default = {}
}

variable "is_public" {
  type    = bool
  default = true
}

variable "public_ip_address" {
  type    = string
  default = ""
}

variable "metadata_startup_script" {
  type    = string
  default = null
}
