resource "google_bigquery_dataset" "analytics_dev" {
  dataset_id    = "analytics_${var.environment}"
  friendly_name = "Dev Dataset for DBT"
  location      = "EU" 
  description   = "Dataset for development environment"
  

  delete_contents_on_destroy = false 
}

resource "google_bigquery_dataset" "analytics_prod" {
  dataset_id    = "analytics_prod"
  location      = "EU"
  description   = "Production dataset"
}