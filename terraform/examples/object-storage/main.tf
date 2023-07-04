module "object-storage" {
  source                    = "../../modules/object-storage"
  region                    = var.region
  tenancy_ocid              = var.tenancy_ocid
  user_ocid                 = var.user_ocid
  private_key_path          = var.private_key_path
  private_key               = var.private_key
  fingerprint               = var.fingerprint
  compartment_ocid          = var.compartment_ocid
  objectstorage_namespace   = var.objectstorage_namespace
  objectstorage_bucket_name = var.objectstorage_bucket_name
  public_access_type        = var.public_access_type
}
