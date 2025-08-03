resource "google_storage_bucket" "my_bucket" {
  name     = "${var.project_id}-bucket-${var.environment}"
  location = var.region
  force_destroy = true
  uniform_bucket_level_access = true
}