import * as pulumi from "@pulumi/pulumi";
import * as oci from "@pulumi/oci";

require("dotenv").config();

const prefix = "opensearch";

const compartmentId = process.env.COMPARTMENT_ID;
if (typeof compartmentId == "undefined") {
  process.exit(1);
}

const vcn = new oci.core.Vcn("VCN", {
  compartmentId: compartmentId,
  cidrBlock: "10.0.0.0/16",
  displayName: `${prefix}-vcn`,
});

const internetGateway = new oci.core.InternetGateway("Internet Gateway", {
  compartmentId: compartmentId,
  vcnId: vcn.id,
  displayName: `${prefix}-internet-gateway`,
});

const cidrBlockAll = "0.0.0.0/0";
const icmp = "1";
const tcp = "6";
const udp = "17";

const routeTable = new oci.core.DefaultRouteTable("Default Route Table", {
  manageDefaultResourceId: vcn.defaultRouteTableId,
  displayName: "DefaultRouteTable",
  routeRules: [
    {
      destination: cidrBlockAll,
      destinationType: "CIDR_BLOCK",
      networkEntityId: internetGateway.id,
    },
  ],
});

const securityList = new oci.core.SecurityList("Security List", {
  compartmentId: compartmentId,
  vcnId: vcn.id,
  displayName: `${prefix}-security-list`,
  egressSecurityRules: [
    { destination: cidrBlockAll, protocol: tcp, stateless: true },
    { destination: cidrBlockAll, protocol: udp, stateless: true },
    { destination: cidrBlockAll, protocol: icmp, stateless: true },
  ],
  ingressSecurityRules: [
    {
      protocol: tcp,
      source: cidrBlockAll,
      tcpOptions: { max: 5601, min: 5601 },
    },
    {
      protocol: tcp,
      source: cidrBlockAll,
      tcpOptions: { max: 9200, min: 9200 },
    },
  ],
});

const subnet = new oci.core.Subnet("Subnet", {
  compartmentId: compartmentId,
  vcnId: vcn.id,
  cidrBlock: "10.0.0.0/24",
  securityListIds: [securityList.id],
  routeTableId: routeTable.id,
  displayName: `${prefix}-subnet`,
});

const opensearchCluster = new oci.opensearch.Cluster("OpenSearch Cluster", {
  compartmentId: compartmentId,
  displayName: "opensearch-cluster",
  dataNodeCount: 1,
  dataNodeHostType: "FLEX",
  dataNodeHostOcpuCount: 1,
  dataNodeHostMemoryGb: 20,
  dataNodeStorageGb: 50,
  masterNodeCount: 1,
  masterNodeHostType: "FLEX",
  masterNodeHostOcpuCount: 1,
  masterNodeHostMemoryGb: 20,
  opendashboardNodeCount: 1,
  opendashboardNodeHostOcpuCount: 1,
  opendashboardNodeHostMemoryGb: 8,
  softwareVersion: "2.3.0",
  subnetCompartmentId: compartmentId,
  subnetId: subnet.id,
  vcnCompartmentId: compartmentId,
  vcnId: vcn.id,
});

export const vcnId = vcn.id;
export const opensearchClusterId = opensearchCluster.id;
