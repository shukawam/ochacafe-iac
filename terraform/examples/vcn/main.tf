module "shukawam-vcn" {
  source = "../../modules/vcn"
  compartment_ocid = var.compartment_ocid
  region = var.region
  vcn_display_name = var.vcn_display_name
}