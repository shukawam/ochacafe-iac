#####
# Container Engine for Kubernetes(OKE Managed Nodes)
resource "oci_containerengine_cluster" "containerengine_cluster" {
  compartment_id     = var.compartment_ocid
  kubernetes_version = local.kubernetes_version
  name               = var.cluster_name
  vcn_id             = var.vcn_id
  endpoint_config {
    subnet_id            = var.k8s_api_endpoint_subnet_id
    is_public_ip_enabled = local.is_public_ip_enabled
  }
  options {
    service_lb_subnet_ids = [var.lb_subnet_id]
    add_ons {
      is_kubernetes_dashboard_enabled = local.cluster_options_add_ons_is_kubernetes_dashboard_enabled
      is_tiller_enabled               = local.cluster_options_add_ons_is_tiller_enabled
    }
    kubernetes_network_config {
      pods_cidr     = local.cluster_options_kubernetes_network_config_pods_cidr
      services_cidr = local.cluster_options_kubernetes_network_config_services_cidr
    }
  }
}

resource "oci_containerengine_node_pool" "node_pool" {
  cluster_id         = oci_containerengine_cluster.containerengine_cluster.id
  compartment_id     = var.compartment_ocid
  kubernetes_version = local.kubernetes_version
  name               = local.node_pool_name
  node_shape         = local.node_pool_node_shape
  node_source_details {
    image_id                = local.node_source_image_id
    source_type             = local.node_source_type
    boot_volume_size_in_gbs = local.node_source_boot_volume_size
  }
  node_config_details {
    placement_configs {
      availability_domain = data.oci_identity_availability_domain.ad.name
      subnet_id           = var.node_pool_subnet_id
    }
    size = var.node_pool_instance_number
  }
  node_shape_config {
    memory_in_gbs = var.node_pool_node_shape_config_memory_in_gbs
    ocpus         = var.node_pool_node_shape_config_ocpus
  }
}
