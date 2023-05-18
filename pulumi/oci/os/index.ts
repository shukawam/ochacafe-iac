import * as pulumi from "@pulumi/pulumi";
import * as oci from "@pulumi/oci";

const config = new pulumi.Config();
const compartmentId = config.require("compartmentId");
const namespace = config.require("namespace");

const exampleBucket = new oci.objectstorage.Bucket("exampleBucket", {
    compartmentId: compartmentId,
    namespace: namespace,
    name: "example-bucket",
});

export const bucketId = exampleBucket.id;
