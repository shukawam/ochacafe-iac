data "oci_containerengine_cluster_kube_config" "kube_config" {
  cluster_id    = var.cluster_id
  expiration    = local.cluster_kube_config_expiration
  token_version = local.cluster_kube_config_token_version
}
