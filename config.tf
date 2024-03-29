#############################################################################
#                            Backend Config                                 #
#############################################################################
terraform {
  backend "gcs" {
  }
}
#############################################################################
#                            Provider Config                                #
#############################################################################

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.77.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
}
