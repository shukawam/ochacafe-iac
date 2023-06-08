#####
# Kube Config
resource "local_file" "kube_config" {
  content  = data.oci_containerengine_cluster_kube_config.kube_config.content
  filename = "${path.root}/kubeconfig"
}
