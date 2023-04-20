module "shukawam_containerengine_cluster" {
  source                                    = "../../modules/container-engine"
  compartment_ocid                          = var.compartment_ocid
  region                                    = var.region
  vcn_id                                    = var.vcn_id
  lb_subnet_id                              = var.lb_subnet_id
  node_pool_subnet_id                       = var.node_pool_subnet_id
  k8s_api_endpoint_subnet_id                = var.k8s_api_endpoint_subnet_id
  cluster_name                              = var.cluster_name
  node_pool_instance_number                 = var.node_pool_instance_number
  node_pool_node_shape_config_memory_in_gbs = var.node_pool_node_shape_config_memory_in_gbs
  node_pool_node_shape_config_ocpus         = var.node_pool_node_shape_config_ocpus
}
