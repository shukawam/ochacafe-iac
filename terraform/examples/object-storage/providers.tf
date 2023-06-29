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
      version = "< 6.0.0"
    }
  }
  backend "http" {
    address       = "https://objectstorage.ap-tokyo-1.oraclecloud.com/p/p8WWREnN6N8-eo2hPy64o1mKxx_Vw5jRpm_tpuXdHNJXdk1a0wcySN9U1erWf_yT/n/orasejapan/b/terraform-state/o/object-storage/terraform.tfstate"
    update_method = "PUT"
  }
}
