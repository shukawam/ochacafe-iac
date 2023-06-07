# OCHaCafe - Infrastructure as Code(IaC)

![badge](https://github.com/shukawam/ochacafe-iac/actions/workflows/terraform-module-test-object-storage.yaml/badge.svg) ![badge](https://github.com/shukawam/ochacafe-iac/actions/workflows/terraform-module-test-vcn.yaml/badge.svg) ![badge](https://github.com/shukawam/ochacafe-iac/actions/workflows/terraform-e2e-test.yaml/badge.svg)

Contains sample and demo code used in [OCHaCafe Season7 #2 - Best practice of IaC](https://ochacafe.connpass.com/event/284592/).

```bash
.
├── .github
│   └── workflows # GitHub Actions 関連ファイル（Terraform Module に対する自動テスト）
├── pulumi # Pulumi のサンプルコード
│   ├── kubernetes
│   └── oci
├── terraform # Terraform のサンプルコード
│   ├── examples
│   ├── live
│   └── modules
└── test # Terratest のサンプルコード
```

## Related

- [https://github.com/shukawam/terraform-oci-oke-quickstart](https://github.com/shukawam/terraform-oci-oke-quickstart)
  - Sample module that provisioning OKE(Container Engine for Kubernetes) with VCN.
- [https://github.com/shukawam/tfsec-oci-custom-checks](https://github.com/shukawam/tfsec-oci-custom-checks)
  - Tfsec custom rule for OCI based on Cloud Guard.
