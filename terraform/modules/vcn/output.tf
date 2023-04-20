output "vcn_id" {
  value = oci_core_vcn.vcn.id
}

output "k8s_api_endpoint_subnet_id" {
  value = oci_core_subnet.k8s_api_endpoint_regional_subnet.id
}

output "lb_subnet_id" {
  value = oci_core_subnet.lb_regional_subnet.id
}

output "node_pool_subnet_id" {
  value = oci_core_subnet.node_pool_regional_subnet.id
}
