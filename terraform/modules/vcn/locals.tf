locals {
  vcn_cidr_block                                = "10.0.0.0/16"
  cidr_block_node_pool_subnet                   = "10.0.10.0/24"
  cidr_block_k8s_api_endpoint_subnet            = "10.0.0.0/28"
  cidr_block_lb_subnet                          = "10.0.20.0/24"
  all_services                                  = data.oci_core_services.all_services.services.0
  cidr_block_all                                = "0.0.0.0/0"
  destination_type_cidr                         = "CIDR_BLOCK"
  destination_type_service                      = "SERVICE_CIDR_BLOCK"
  protocol_all                                  = "all"
  protocol_icmp                                 = "1"
  protocol_tcp                                  = "6"
  internet_gateway_display_name                 = "internet-gateway"
  nat_gateway_display_name                      = "nat-gateway"
  service_gateway_display_name                  = "service-gateway"
  public_route_table_display_name               = "public-route-table"
  private_route_table_display_name              = "private-route-table"
  k8s_api_endpoint_security_list_display_name   = "k8s-api-endpoint-security-list"
  node_pool_security_list_display_name          = "node-pool-security-list"
  lb_security_list_display_name                 = "lb-security-list"
  k8s_api_endpoint_regional_subnet_display_name = "k8s-api-endpoint-regional-subnet"
  node_pool_regional_subnet_display_name        = "node-pool-regional-subnet"
  lb_regional_subnet_display_name               = "lb-regional-subnet"
  subnet_prohibit_public_ip_on_vnic             = "true"
}
