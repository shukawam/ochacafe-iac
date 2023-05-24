package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestObjectStorageFirstStep(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../terraform/examples/object-storage-first-step",
		Vars: map[string]interface{}{
			"compartment_ocid":          os.Getenv("COMPARTMENT_ID"),
			"region":                    "ap-tokyo-1",
			"objectstorage_namespace":   "orasejapan",
			"objectstorage_bucket_name": "test-bucket",
		},
		NoColor: false,
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	actualBucketName := terraform.Output(t, terraformOptions, "objectstorage_bucket_name")

	assert.Equal(t, "test-bucket", actualBucketName)
}
