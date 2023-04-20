data "oci_containerengine_cluster_option" "cluster_option" {
  cluster_option_id = "all"
  compartment_id    = var.compartment_ocid
}

data "oci_core_shapes" "node_shapes" {
  compartment_id = var.compartment_ocid
  filter {
    name   = "name"
    values = ["VM.Standard.E.*Flex"]
    regex  = true
  }
}

data "oci_core_images" "node_images" {
  compartment_id = var.compartment_ocid
  filter {
    name   = "display_name"
    values = ["Oracle-Linux-7\\.9-20.*"]
    regex  = true
  }
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.compartment_ocid
  ad_number      = local.ad_number
}
