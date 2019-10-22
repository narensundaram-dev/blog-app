Terraform remote S3 backend config for terraform state ...
terraform init \
  -backend-config "bucket=sse-dev-state" \
  -backend-config "key=global-tf-migrate-test/terraform-test.state" \
  -backend-config "encrypt=1"
Downloading modules...
Get: file:///home/vagrant/projects/sse-deployments/terraform/modules/network/aws/iam
Get: file:///home/vagrant/projects/sse-deployments/terraform/modules/microsvc-infra/aws/iam
Get: file:///home/vagrant/projects/sse-deployments/terraform/modules/cassandra/aws/iam
Get: file:///home/vagrant/projects/sse-deployments/terraform/modules/opscenter/aws/iam
Get: file:///home/vagrant/projects/sse-deployments/terraform/modules/vault/aws/iam
Get: file:///home/vagrant/projects/sse-deployments/terraform/modules/pingfederate/aws/iam

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins on https://releases.hashicorp.com...
- Downloading plugin for provider "terraform" (1.0.2)...
- Downloading plugin for provider "aws" (2.33.0)...



The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 2.33"
* provider.terraform: version = "~> 1.0"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
Terraform get, plan ...
terraform get
terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.terraform_remote_state.tfstate: Refreshing state...
aws_iam_role.mi_controller_role: Refreshing state... (ID: SSEMIControllerRole)
aws_iam_policy.mi_controller_policy: Refreshing state... (ID: arn:aws:iam::182570719012:policy/SSEMIControllerPolicy)
aws_iam_policy.mi_worker_policy: Refreshing state... (ID: arn:aws:iam::182570719012:policy/SSEMIWorkerPolicy)
aws_iam_role.mi_worker_role: Refreshing state... (ID: SSEMIWorkerRole)
aws_iam_policy.bastion_policy: Refreshing state... (ID: arn:aws:iam::182570719012:policy/SSEBastionPolicy)
aws_iam_policy.management_policy: Refreshing state... (ID: arn:aws:iam::182570719012:policy/SSEManagementPolicy)
aws_iam_role.bastion_role: Refreshing state... (ID: SSEBastionRole)
aws_iam_role.management_instance_role: Refreshing state... (ID: SSEManagementInstanceRole)
aws_iam_role.opscenter_role: Refreshing state... (ID: SSEOpscenterRole)
aws_iam_policy.opscenter_policy: Refreshing state... (ID: arn:aws:iam::182570719012:policy/SSEOpscenterPolicy)
aws_iam_role.cassandra_role: Refreshing state... (ID: SSECassandraRole)
aws_iam_role.vault_role: Refreshing state... (ID: SSEVaultRole)
aws_iam_policy.pingfederate_policy: Refreshing state... (ID: arn:aws:iam::182570719012:policy/SSEPingfederatePolicy)
aws_iam_policy.cassandra_policy: Refreshing state... (ID: arn:aws:iam::182570719012:policy/SSECassandraPolicy)
aws_iam_policy.vault_policy: Refreshing state... (ID: arn:aws:iam::182570719012:policy/SSEVaultPolicy)
aws_iam_role.pingfederate_role: Refreshing state... (ID: SSEPingfederateRole)
aws_iam_instance_profile.mi_controller_instance_profile: Refreshing state... (ID: SSEMIControllerInstanceProfile)
aws_iam_instance_profile.mi_worker_instance_profile: Refreshing state... (ID: SSEMIWorkerInstanceProfile)
aws_iam_instance_profile.managment_profile: Refreshing state... (ID: SSEManagementInstanceProfile)
aws_iam_instance_profile.bastion_instance_profile: Refreshing state... (ID: SSEBastionInstanceProfile)
aws_iam_instance_profile.opscenter_instance_profile: Refreshing state... (ID: SSEOpscenterInstanceProfile)
aws_iam_policy_attachment.bastion_policy_attach: Refreshing state... (ID: SSEBastionPolicyAttachment)
aws_iam_policy_attachment.mi_worker_policy_attach: Refreshing state... (ID: SSEMIWorkerPolicyAttachment)
aws_iam_policy_attachment.mi_controller_policy_attach: Refreshing state... (ID: SSEMIControllerPolicyAttachment)
aws_iam_instance_profile.cassandra_instance_profile: Refreshing state... (ID: SSECassandraInstanceProfile)
aws_iam_instance_profile.vault_instance_profile: Refreshing state... (ID: SSEVaultInstanceProfile)
aws_iam_policy_attachment.management_policy_attach: Refreshing state... (ID: SSEManagementPolicyAttachment)
aws_iam_instance_profile.pingfederate_instance_profile: Refreshing state... (ID: SSEPingfederateInstanceProfile)
aws_iam_policy_attachment.opscenter_policy_attach: Refreshing state... (ID: SSEOpscenterPolicyAttachment)
aws_iam_policy_attachment.cassandra_policy_attach: Refreshing state... (ID: SSECassandraPolicyAttachment)
aws_iam_policy_attachment.pingfederate_policy_attach: Refreshing state... (ID: SSEPingfederatePolicyAttachment)
aws_iam_policy_attachment.vault_policy_attach: Refreshing state... (ID: SSEVaultPolicyAttachment)

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  ~ module.iam_cassandra.aws_iam_role.cassandra_role
      force_detach_policies: "" => "false"

  ~ module.iam_mi.aws_iam_role.mi_controller_role
      force_detach_policies: "" => "false"

  ~ module.iam_mi.aws_iam_role.mi_worker_role
      force_detach_policies: "" => "false"
      max_session_duration:  "43200" => "3600"

  ~ module.iam_network.aws_iam_role.bastion_role
      force_detach_policies: "" => "false"

  ~ module.iam_network.aws_iam_role.management_instance_role
      force_detach_policies: "" => "false"

  ~ module.iam_opscenter.aws_iam_role.opscenter_role
      force_detach_policies: "" => "false"

  ~ module.iam_pingfederate.aws_iam_policy.pingfederate_policy
      policy:                "{\n    \"Version\": \"2012-10-17\",\n    \"Statement\": [\n        {\n            \"Sid\": \"VisualEditor0\",\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"ssm:DescribeDocument\",\n                \"cloudwatch:PutMetricData\",\n                \"ec2messages:GetEndpoint\",\n                \"logs:DescribeLogStreams\",\n                \"ds:CreateComputer\",\n                \"logs:*\",\n                \"s3:ListBucket\",\n                \"ssmmessages:OpenControlChannel\",\n                \"ec2messages:GetMessages\",\n                \"ssm:PutConfigurePackageResult\",\n                \"ssm:ListInstanceAssociations\",\n                \"sqs:*\",\n                \"ssm:UpdateAssociationStatus\",\n                \"ssm:GetManifest\",\n                \"s3:GetEncryptionConfiguration\",\n                \"logs:CreateLogStream\",\n                \"ec2messages:DeleteMessage\",\n                \"ssm:UpdateInstanceInformation\",\n                \"s3:AbortMultipartUpload\",\n                \"ec2messages:FailMessage\",\n                \"ssmmessages:OpenDataChannel\",\n                \"ssm:GetDocument\",\n                \"ssm:PutComplianceItems\",\n                \"ec2:DescribeInstanceStatus\",\n                \"sns:*\",\n                \"ssm:DescribeAssociation\",\n                \"s3:ListBucketMultipartUploads\",\n                \"logs:DescribeLogGroups\",\n                \"ssm:GetDeployablePatchSnapshotForInstance\",\n                \"ec2messages:AcknowledgeMessage\",\n                \"ssm:GetParameters\",\n                \"ssmmessages:CreateControlChannel\",\n                \"logs:CreateLogGroup\",\n                \"logs:PutLogEvents\",\n                \"s3:ListMultipartUploadParts\",\n                \"ssmmessages:CreateDataChannel\",\n                \"s3:PutObject\",\n                \"s3:GetObject\",\n                \"ssm:PutInventory\",\n                \"ec2:Describe*\",\n                \"cloudwatch:*\",\n                \"ds:DescribeDirectories\",\n                \"ec2messages:SendReply\",\n                \"ssm:ListAssociations\",\n                \"s3:GetBucketLocation\",\n                \"rds:DescribeDBClusters\",\n                \"ssm:UpdateInstanceAssociationStatus\"\n            ],\n            \"Resource\": \"*\"\n        },\n        {\n            \"Sid\": \"VisualEditor1\",\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"kms:Decrypt\",\n                \"rds:ModifyDBCluster\",\n                \"s3:ListBucket\"\n            ],\n            \"Resource\": [\n                \"arn:aws:rds:*:cluster:*-aurora-cluster\",\n                \"arn:aws:kms:us-east-1:803105940036:key/6e7e958c-c2f5-4323-b999-68292f5ba1ad\",\n                \"arn:aws:kms:us-east-1:182570719012:key/dfbb2cd9-9a15-4780-b220-d9b59bda7a5c\",\n                \"arn:aws:kms:eu-central-1:830262426339:key/15028ec1-2dd2-4a7b-9cef-f8aad0de90a8\",\n                \"arn:aws:kms:us-east-1:830262426339:key/297ea7e9-eafb-41e9-bd5f-7f3b8daf4ac7\",\n                \"arn:aws:s3:::sse-dev*-state\"\n            ]\n        },\n        {\n            \"Sid\": \"VisualEditor2\",\n            \"Effect\": \"Allow\",\n            \"Action\": \"s3:GetObject\",\n            \"Resource\": [\n                \"arn:aws:s3:::sse-dev*-state/*/sitekey/*\",\n                \"arn:aws:s3:::sse-dev*-state/pingfederate/generic_aws_pass\",\n                \"arn:aws:s3:::sse-dev*-state/*/rabbitmq/*\",\n                \"arn:aws:s3:::sse-dev*-state/*/rds/*\",\n                \"arn:aws:s3:::sse-dev*-state/*/rootpassword/*\",\n                \"arn:aws:s3:::sse-dev*-state/*/datadog_apikey\",\n                \"arn:aws:s3:::sse-dev*-state/*/osquery/*\"\n            ]\n        },\n        {\n            \"Sid\": \"VisualEditor3\",\n            \"Effect\": \"Allow\",\n            \"Action\": \"s3:ListObjects\",\n            \"Resource\": [\n                \"arn:aws:s3:::sse-dev*-state/*/sitekey/*\",\n                \"arn:aws:s3:::sse-dev*-state/pingfederate/generic_aws_pass\",\n                \"arn:aws:s3:::sse-dev*-state/*/rabbitmq/*\",\n                \"arn:aws:s3:::sse-dev*-state/*/rds/*\",\n                \"arn:aws:s3:::sse-dev*-state/*/rootpassword/*\",\n                \"arn:aws:s3:::sse-dev*-state/*/datadog_apikey\",\n                \"arn:aws:s3:::sse-dev*-state/*/osquery/*\"\n            ]\n        },\n        {\n            \"Sid\": \"VisualEditor4\",\n            \"Effect\": \"Allow\",\n            \"Action\": \"s3:*\",\n            \"Resource\": [\n                \"arn:aws:s3:::id-broker/backup-config/*\",\n                \"arn:aws:s3:::id-broker-sse-dev*/backup-config/*\"\n            ]\n        },\n        {\n            \"Sid\": \"VisualEditor5\",\n            \"Effect\": \"Allow\",\n            \"Action\": \"s3:*\",\n            \"Resource\": [\n                \"arn:aws:s3:::pf-discovery-*\",\n                \"arn:aws:s3:::pf-discovery-sse-dev*-*\"\n            ]\n        },\n        {\n            \"Sid\": \"VisualEditor6\",\n            \"Effect\": \"Allow\",\n            \"Action\": \"s3:*\",\n            \"Resource\": [\n                \"arn:aws:s3:::id-broker-templates*\",\n                \"arn:aws:s3:::id-broker-templates-sse-dev*\"\n            ]\n        }\n    ]\n}" => "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogAllow\",\n      \"Action\": [\n        \"ec2:Describe*\",\n        \"cloudwatch:*\",\n        \"logs:*\",\n        \"sns:*\",\n        \"sqs:*\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": \"*\"\n    },\n    {\n      \"Sid\": \"AllowAccessToBucket\",\n      \"Action\": [\n        \"s3:ListBucket\"\n      ],\n      \"Resource\": [\n        \"arn:aws:s3:::sse-dev*-state\"\n      ],\n      \"Effect\": \"Allow\"\n    },\n    {\n      \"Sid\": \"SecretsGetAllow\",\n      \"Action\": [\n        \"s3:GetObject\",\n        \"s3:ListObjects\"\n      ],\n      \"Resource\": [\n        \"arn:aws:s3:::sse-dev*-state/*/sitekey/*\",\n        \"arn:aws:s3:::sse-dev*-state/pingfederate/generic_aws_pass\",\n        \"arn:aws:s3:::sse-dev*-state/*/rabbitmq/*\",\n        \"arn:aws:s3:::sse-dev*-state/*/rds/*\",\n        \"arn:aws:s3:::sse-dev*-state/*/rootpassword/*\",\n        \"arn:aws:s3:::sse-dev*-state/*/datadog_apikey\",\n         \"arn:aws:s3:::sse-dev*-state/*/osquery/*\"\n      ],\n      \"Effect\": \"Allow\"\n    },\n    {\n      \"Sid\": \"ConfigBackupAllow\",\n      \"Action\": \"s3:*\",\n      \"Resource\": [\n        \"arn:aws:s3:::id-broker/backup-config/*\",\n        \"arn:aws:s3:::id-broker-sse-dev*/backup-config/*\"\n      ],\n      \"Effect\": \"Allow\"\n    },\n    {\n      \"Sid\": \"ClusterDiscoveryAllow\",\n      \"Action\": \"s3:*\",\n      \"Resource\": [\n        \"arn:aws:s3:::pf-discovery-*\",\n        \"arn:aws:s3:::pf-discovery-sse-dev*-*\"\n      ],\n      \"Effect\": \"Allow\"\n    },\n    {\n      \"Sid\": \"LoginTemplatesAllow\",\n      \"Action\": \"s3:*\",\n      \"Resource\": [\n        \"arn:aws:s3:::id-broker-templates*\",\n        \"arn:aws:s3:::id-broker-templates-sse-dev*\"\n      ],\n      \"Effect\": \"Allow\"\n    },\n    {\n      \"Sid\": \"RDSRefreshTokenModifyAllow\",\n      \"Action\": \"rds:ModifyDBCluster\",\n      \"Resource\": \"arn:aws:rds:*:cluster:*-aurora-cluster\",\n      \"Effect\": \"Allow\"\n    },\n    {\n      \"Sid\": \"RDSDescribeDBClustersAllow\",\n      \"Action\": \"rds:DescribeDBClusters\",\n      \"Resource\": \"*\",\n      \"Effect\": \"Allow\"\n    },\n    {\n      \"Sid\": \"PutObject\",\n      \"Action\": [\n        \"s3:PutObject\"\n      ],\n      \"Resource\": [\n         \"*\"\n      ],\n      \"Effect\": \"Allow\"\n     },\n       {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"ssm:DescribeAssociation\",\n                \"ssm:GetDeployablePatchSnapshotForInstance\",\n                \"ssm:GetDocument\",\n                \"ssm:DescribeDocument\",\n                \"ssm:GetManifest\",\n                \"ssm:GetParameters\",\n                \"ssm:ListAssociations\",\n                \"ssm:ListInstanceAssociations\",\n                \"ssm:PutInventory\",\n                \"ssm:PutComplianceItems\",\n                \"ssm:PutConfigurePackageResult\",\n                \"ssm:UpdateAssociationStatus\",\n                \"ssm:UpdateInstanceAssociationStatus\",\n                \"ssm:UpdateInstanceInformation\"\n            ],\n            \"Resource\": \"*\"\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"ssmmessages:CreateControlChannel\",\n                \"ssmmessages:CreateDataChannel\",\n                \"ssmmessages:OpenControlChannel\",\n                \"ssmmessages:OpenDataChannel\"\n            ],\n            \"Resource\": \"*\"\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"ec2messages:AcknowledgeMessage\",\n                \"ec2messages:DeleteMessage\",\n                \"ec2messages:FailMessage\",\n                \"ec2messages:GetEndpoint\",\n                \"ec2messages:GetMessages\",\n                \"ec2messages:SendReply\"\n            ],\n            \"Resource\": \"*\"\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"cloudwatch:PutMetricData\"\n            ],\n            \"Resource\": \"*\"\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"ec2:DescribeInstanceStatus\"\n            ],\n            \"Resource\": \"*\"\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"ds:CreateComputer\",\n                \"ds:DescribeDirectories\"\n            ],\n            \"Resource\": \"*\"\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"logs:CreateLogGroup\",\n                \"logs:CreateLogStream\",\n                \"logs:DescribeLogGroups\",\n                \"logs:DescribeLogStreams\",\n                \"logs:PutLogEvents\"\n            ],\n            \"Resource\": \"*\"\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"s3:GetBucketLocation\",\n                \"s3:PutObject\",\n                \"s3:GetObject\",\n                \"s3:GetEncryptionConfiguration\",\n                \"s3:AbortMultipartUpload\",\n                \"s3:ListMultipartUploadParts\",\n                \"s3:ListBucket\",\n                \"s3:ListBucketMultipartUploads\"\n            ],\n            \"Resource\": \"*\"\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"ssm:UpdateInstanceInformation\",\n                \"ssmmessages:CreateControlChannel\",\n                \"ssmmessages:CreateDataChannel\",\n                \"ssmmessages:OpenControlChannel\",\n                \"ssmmessages:OpenDataChannel\"\n            ],\n            \"Resource\": \"*\"\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"s3:GetEncryptionConfiguration\"\n            ],\n            \"Resource\": \"*\"\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"kms:Decrypt\"\n            ],\n            \"Resource\": [\n                \"arn:aws:kms:us-east-1:803105940036:key/6e7e958c-c2f5-4323-b999-68292f5ba1ad\",\n                \"arn:aws:kms:us-east-1:182570719012:key/dfbb2cd9-9a15-4780-b220-d9b59bda7a5c\",\n                \"arn:aws:kms:eu-central-1:830262426339:key/15028ec1-2dd2-4a7b-9cef-f8aad0de90a8\",\n                \"arn:aws:kms:us-east-1:830262426339:key/297ea7e9-eafb-41e9-bd5f-7f3b8daf4ac7\"\n\n            ]\n        }\n  ]\n}\n"

  ~ module.iam_pingfederate.aws_iam_role.pingfederate_role
      force_detach_policies: "" => "false"

  ~ module.iam_vault.aws_iam_role.vault_role
      force_detach_policies: "" => "false"


Plan: 0 to add, 9 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
