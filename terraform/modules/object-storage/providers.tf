provider "oci" {
  region           = var.region
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key      = var.private_key
  private_key_path = var.private_key_path
  fingerprint      = var.fingerprint
}

terraform {
  required_version = ">=1.4.5"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.116.0, < 5.0.0"
    }
  }
}
