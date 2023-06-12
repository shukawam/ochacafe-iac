terraform {
  required_version = ">=1.4.5"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "< 6.0.0"
    }
  }
}
