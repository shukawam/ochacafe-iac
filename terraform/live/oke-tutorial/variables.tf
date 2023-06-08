#####
# Provider
variable "region" {
  description = "OCI Region Identifier. (e.g. ap-tokyo-1, ...)"
}

variable "tenancy_ocid" {
  description = "OCID of tenancy."
}

variable "user_ocid" {
  description = "OCID of user."
}

variable "private_key_path" {
  default     = null
  description = "File path of private key."
}

variable "private_key" {
  default     = null
  description = "Content of private key."
}

variable "fingerprint" {
  description = "Fingerprint."
}

variable "compartment_ocid" {
  description = "OCID of compartment."
}

#####
# VCN
variable "vcn_display_name" {
  description = "VCN display name"
}


#####
# Oracle Container Engine for Kubernetes
variable "cluster_name" {
}

variable "node_pool_instance_number" {
}

variable "node_pool_node_shape_config_memory_in_gbs" {
}

variable "node_pool_node_shape_config_ocpus" {
}

#####
# Kube Config
variable "cluster_id" {
}
