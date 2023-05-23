variable "region" {
  description = "OCI Region Identifier. (e.g. ap-tokyo-1, ...)"
}

variable "compartment_ocid" {
  description = "OCID of compartment."
}

variable "objectstorage_namespace" {
  description = "Namespace of Object Storage."
}

variable "objectstorage_bucket_name" {
  description = "Name of Object Storage Bucket."
}
