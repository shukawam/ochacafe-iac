output "vcn" {
  value = oci_core_vcn.vcn
}

output "k8s_api_endpoint_subnet" {
  value = oci_core_subnet.k8s_api_endpoint_regional_subnet
}

output "lb_subnet" {
  value = oci_core_subnet.lb_regional_subnet
}

output "node_pool_subnet" {
  value = oci_core_subnet.node_pool_regional_subnet
}
