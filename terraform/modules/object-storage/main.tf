#####
# Object Storage
resource "oci_objectstorage_bucket" "objectstorage_bucket" {
  compartment_id = var.compartment_ocid
  name           = var.objectstorage_bucket_name
  namespace      = var.objectstorage_namespace
  access_type    = var.public_access_type
}
