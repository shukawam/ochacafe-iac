terraform {
  required_version = ">=1.4.5"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.116.0, < 5.0.0"
    }
  }
}
