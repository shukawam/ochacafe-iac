package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestObjectStorageFirstStep(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../terraform/examples/object-storage-first-step",
		VarFiles:     []string{"varfile.tfvars"},
		NoColor:      false,
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	actualBucketName := terraform.Output(t, terraformOptions, "objectstorage_bucket_name")

	assert.Equal(t, "test-bucket", actualBucketName)
}
