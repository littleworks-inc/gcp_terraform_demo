module "storage_01"  {
  source = "./modules/storage"
 
  region                = local.region
  bucket_name           = "terraform-demo-bucket-01"
  project_name          = local.project_id
  bucket_storage_class  = "STANDARD"

  label_environment     = local.environment
  label_application     = local.application 
}

