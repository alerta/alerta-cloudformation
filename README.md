Alerta on AWS EC2
=================

This [CloudFormation](http://aws.amazon.com/cloudformation/aws-cloudformation-templates/)
template can be used to easily deploy [Alerta](http://alerta.io/) as a single
instance Auto-Scaling Group behind a Elastic Load Balancer in an AWS VPC using
RDS Postgres as the backend database.

[![Launch Stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?#/stacks/new?stackName=AlertaStack&templateURL=https://s3-eu-west-1.amazonaws.com/alerta/public/cloudformation/alerta.yaml)

For help, join [![Gitter chat](https://badges.gitter.im/alerta/chat.png)](https://gitter.im/alerta/chat)

Requirements
------------

 * VPC with at least two public subnets
 * Google Tracking ID (optional)

Configuration
-------------

The following table lists the Cloudformation template parameters that can be set. There are sensible defaults where possible.

| Parameter  | Description |
| ------------- | ------------- |
| VpcId | ID of the VPC into which to launch the application eg. vpc-1234abcd |
| Subnets | Public subnets to use in VPC for internet-facing ELB, instances and RDS eg. subnet-abcd1234 |
| InstanceType | EC2 Instance type eg. `t2.micro`, `t2.small` or `t2.medium` (default: `t2.micro`) |
| KeyName  | Name of an existing EC2 KeyPair for SSH access |
| SSHLocation | IP range that can be used to SSH to the EC2 instances (default: 0.0.0.0/0) |
| SecretKey | Application secret key eg. any random string |
| AllowedDomain | Allowed email domain eg. gmail.com or example.com (default: '*') |
| TrackingId | Google analytics tracking Id (optional) |
| DBName | Postgres database name (default: monitoring) |
| DBUser | Username for database access |
| DBPassword | Password for database access |
| DBInstanceClass | The database instance type (default: db.t2.micro) |
| DBAllocatedStorage | The size of the database (Gb) |
| MultiAZ | Multi-AZ master database (true/false) |

Deployment
----------

### AWS Management Console

Use the [AWS management console](https://console.aws.amazon.com/console/home) to
launch the stack using the Amazon S3 template URL https://s3-eu-west-1.amazonaws.com/alerta/public/cloudformation/alerta.yaml

### AWS Command-line

To launch the stack from the command-line use the `aws` command. The following
command shows the minimum stack parameters that must be defined to launch the
stack:

    $ aws cloudformation create-stack \
      --stack-name AlertaStack \
      --template-body file://alerta.yaml \
      --parameters \
      ParameterKey=VpcId,ParameterValue=vpcfffd0f9a \
      ParameterKey=Subnets,ParameterValue=\"subnet-0fa00c78,subnet-2ee56c4b\" \
      ParameterKey=SecretKey,ParameterValue=supersecret \
      ParameterKey=DBUser,ParameterValue=alerta \
      ParameterKey=DBPassword,ParameterValue=mypassword \
      --tags Key=Role,Value=monitoring Key=Owner,Value=DevOps

Note: The `Subnets` parameter value must be a comma-delimited string surrounded
by escaped quotes otherwise it will be interpreted as a string and the command
will fail with an `Invalid type for parameter` error.

### Quick Launch

[![Launch Stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?#/stacks/new?stackName=AlertaStack&templateURL=https://s3-eu-west-1.amazonaws.com/alerta/public/cloudformation/alerta.yaml)

Usage
-----

The Alerta Web UI is available at the following:

    http://<elb-ip-address>

And the Alerta API is available at the following:

    http://<elb-ip-address>/api

The exact values are dependent on the actual deployment and can be
found in the CloudFormation "Outputs" tab of the AWS console once
the Alerta stack has been successfully created.

Enhancements
-------------

There are many improvements that should be made to this template before
it is used in a production environment. These include, but are not
limited to:

 * using private VPC subnets for the web servers and database instances
 * copying the web console static assets to S3 and serving them from Cloudfront
 * creating an SSL certificate and using HTTPS instead of HTTP

These and other enhancements are specific to every deployment environment so
this is left as an exercise for the reader.

License
-------

Copyright (c) 2015-2016,2018 Nick Satterly. Available under the MIT License.
