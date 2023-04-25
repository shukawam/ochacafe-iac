#####
# VCN
module "shukawam_vcn" {
  source           = "../../modules/vcn"
  compartment_ocid = var.compartment_ocid
  region           = var.region
  vcn_display_name = var.vcn_display_name
}

#####
# Oracle Container Engine for Kubernetes
module "shukawam_containerengine_cluster" {
  source                                    = "../../modules/container-engine"
  compartment_ocid                          = var.compartment_ocid
  region                                    = var.region
  vcn_id                                    = module.shukawam_vcn.vcn.id
  lb_subnet_id                              = module.shukawam_vcn.lb_subnet.id
  node_pool_subnet_id                       = module.shukawam_vcn.node_pool_subnet.id
  k8s_api_endpoint_subnet_id                = module.shukawam_vcn.k8s_api_endpoint_subnet.id
  cluster_name                              = var.cluster_name
  node_pool_instance_number                 = var.node_pool_instance_number
  node_pool_node_shape_config_memory_in_gbs = var.node_pool_node_shape_config_memory_in_gbs
  node_pool_node_shape_config_ocpus         = var.node_pool_node_shape_config_ocpus
}
