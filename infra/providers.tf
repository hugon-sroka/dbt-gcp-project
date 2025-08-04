terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.85.0"  # Sprawdź najnowszą wersję na https://registry.terraform.io/providers/hashicorp/google/latest
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}