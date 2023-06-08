#####
# Kube Config
module "kube-config" {
  source = "../../modules/kube-config"

  region           = var.region
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key_path = var.private_key_path
  private_key      = var.private_key
  fingerprint      = var.fingerprint
  compartment_ocid = var.compartment_ocid

  cluster_id = var.cluster_id
}
