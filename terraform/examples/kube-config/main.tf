#####
# Kube Config
module "kube-config" {
  source = "../../modules/kube-config"
  cluster_id = var.cluster_id
  compartment_ocid = var.compartment_ocid
  region = var.region
}
