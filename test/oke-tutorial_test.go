package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestOkeTutorial(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../terraform/live/oke-tutorial",
		Vars: map[string]interface{}{
			"region":                    "uk-london-1",
			"vcn_display_name":          "example-vcn",
			"cluster_name":              "example-cluster",
			"node_pool_instance_number": "1",
			"node_pool_node_shape_config_memory_in_gbs": "16",
			"node_pool_node_shape_config_ocpus":         "1",
		},
		NoColor: false,
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	actualClusterName := terraform.Output(t, terraformOptions, "oke_cluster_name")

	assert.Equal(t, "example-cluster", actualClusterName)
}
