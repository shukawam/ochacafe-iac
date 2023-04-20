locals {
  kubernetes_version                                      = reverse(sort(data.oci_containerengine_cluster_option.cluster_option.kubernetes_versions))[0]
  cluster_options_kubernetes_network_config_pods_cidr     = "10.1.0.0/16"
  cluster_options_kubernetes_network_config_services_cidr = "10.2.0.0/16"
  is_public_ip_enabled                                    = "true"
  cluster_options_add_ons_is_kubernetes_dashboard_enabled = "false"
  cluster_options_add_ons_is_tiller_enabled               = "false"
  node_pool_name                                          = "pool1"
  node_pool_node_shape                                    = data.oci_core_shapes.node_shapes.shapes.0.name
  node_source_image_id                                    = data.oci_core_images.node_images.images.0.id
  node_source_type                                        = "IMAGE"
  node_source_boot_volume_size                            = "50"
  ad_number                                               = "1"
}
