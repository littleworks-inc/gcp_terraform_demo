module "storage_01"  {
  source = "./modules/storage"
 
  region                = var.region
  bucket_name           = "terraform-demo-bucket-01"
  project_name          = var.project_id
  bucket_storage_class  = "STANDARD"

  label_environment     = var.environment
  label_application     = var.application 
}

