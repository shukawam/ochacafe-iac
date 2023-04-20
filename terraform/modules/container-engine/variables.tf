variable "compartment_ocid" {
  description = "Compartment OCID"
}

variable "region" {
  description = "OCI Region"
}

variable "cluster_name" {
  description = "Cluster name"
}

variable "vcn_id" {
  description = "VCN OCID"
}

variable "k8s_api_endpoint_subnet_id" {
  description = "Kubernetes API Endpoint Subnet OCID"
}

variable "lb_subnet_id" {
  description = "Load Balancer Subnet OCID"
}

variable "node_pool_subnet_id" {
  description = "Node Pool Subnet OCID"
}

variable "node_pool_instance_number" {
  description = "Node Pool Instance Number"
}

variable "node_pool_node_shape_config_memory_in_gbs" {
  description = "Instance Memory(GB)"
}

variable "node_pool_node_shape_config_ocpus" {
  description = "Instance OCPUs"
}
