import * as pulumi from "@pulumi/pulumi";
import * as oci from "@pulumi/oci";

const compartmentId = "ocid1.compartment.oc1..aaaaaaaanjtbllhqxcg67dq7em3vto2mvsbc6pbgk4pw6cx37afzk3tngmoa";
const namespace = "orasejapan";

// Create an Object Storage bucket
const bucket = new oci.objectstorage.Bucket("myBucket", {
    compartmentId: compartmentId,
    name: "myBucket",
    namespace: namespace,
});

// Create a Log Group
const logGroup = new oci.logging.LogGroup("myLogGroup", {
    compartmentId: compartmentId,
    displayName: "my-log-group",
});

// Create a service connector
const connector = new oci.sch.Connector("myConnector", {
    compartmentId: compartmentId,
    displayName: "my-connector",
    source: {
        kind: "logging",
        logSources: [
            {
                logGroupId: logGroup.id,
                compartmentId: compartmentId, // Add the missing compartmentId
            },
        ],
    },
    target: {
        kind: "objectStorage",
        bucket: bucket.name,
        namespace: namespace,
    },
    tasks: [
        {
            kind: "logRule",
            condition: "logContent.logType='example_log_type'", // Replace 'example_log_type' with your logType
        },
    ],
});

// Export the bucket name and log group ID
export const bucketName = bucket.name;
export const logGroupName = logGroup.id;
