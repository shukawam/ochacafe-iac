package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestVcn(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../terraform/examples/vcn",
		Vars: map[string]interface{}{
			"region":           "uk-london-1",
			"vcn_display_name": "example-vcn",
		},
		NoColor: false,
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	actualVcnName := terraform.Output(t, terraformOptions, "vcn_display_name")

	assert.Equal(t, "example-vcn", actualVcnName)
}
