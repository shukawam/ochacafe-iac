module "shukawam-vcn" {
  source = "../../modules/vcn"

  region                    = var.region
  tenancy_ocid              = var.tenancy_ocid
  user_ocid                 = var.user_ocid
  private_key_path          = var.private_key_path
  private_key               = var.private_key
  fingerprint               = var.fingerprint

  compartment_ocid = var.compartment_ocid
  vcn_display_name = var.vcn_display_name
}
