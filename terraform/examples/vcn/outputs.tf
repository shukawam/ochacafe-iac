output "vcn_display_name" {
  value = module.shukawam-vcn.vcn.display_name
}

output "vcn_id" {
  value = module.shukawam-vcn.vcn.id
}

output "lb_subnet_id" {
  value = module.shukawam-vcn.lb_subnet.id
}

output "node_pool_subnet_id" {
  value = module.shukawam-vcn.node_pool_subnet.id
}

output "k8s_api_endpoint_subnet_id" {
  value = module.shukawam-vcn.k8s_api_endpoint_subnet.id
}
