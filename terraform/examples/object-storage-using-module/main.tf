module "object-storage" {
  source                    = "../../modules/object-storage"
  compartment_ocid          = var.compartment_ocid
  objectstorage_namespace   = var.objectstorage_namespace
  objectstorage_bucket_name = var.objectstorage_bucket_name
  region                    = var.region
}
