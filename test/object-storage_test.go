package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestObjectStorage(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../terraform/examples/object-storage",
		Vars: map[string]interface{}{
			"region":                    "ap-tokyo-1",
			"objectstorage_namespace":   "orasejapan",
			"objectstorage_bucket_name": "test-bucket",
			"public_access_type":        "NoPublicAccess",
		},
		NoColor: false,
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	actualBucketName := terraform.Output(t, terraformOptions, "objectstorage_bucket_name")

	assert.Equal(t, "test-bucket", actualBucketName)
}
