resource "google_service_account" "dbt_sa" {
  account_id   = "dbt-runner"
  display_name = "DBT Service Account"
}

resource "google_service_account_key" "dbt_key" {
  service_account_id = google_service_account.dbt_sa.name
}

resource "local_file" "dbt_key_file" {
  filename = "${path.module}/secrets/dbt-sa-key.json"
  content  = base64decode(google_service_account_key.dbt_key.private_key)
}

resource "google_project_iam_member" "dbt_bq_role" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.dbt_sa.email}"
}

# Nadaj uprawnienia SA do datasetu dev
resource "google_bigquery_dataset_iam_member" "analytics_dev_access" {
  dataset_id = google_bigquery_dataset.analytics_dev.dataset_id 
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.dbt_sa.email}"
}

# Uprawnienia do datasetu prod (jeśli używasz)
resource "google_bigquery_dataset_iam_member" "analytics_prod_access" {
  dataset_id = google_bigquery_dataset.analytics_prod.dataset_id
  role       = "roles/bigquery.dataOwner"  # Pełne uprawnienia
  member     = "serviceAccount:${google_service_account.dbt_sa.email}"
}