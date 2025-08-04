variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "environment" {
  description = "environemnt (dev/prod)"
  default = "dev"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "europe-west3"  # przykładowo
}