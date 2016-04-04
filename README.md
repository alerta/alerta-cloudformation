Alerta on AWS EC2
=================

This [CloudFormation](http://aws.amazon.com/cloudformation/aws-cloudformation-templates/) template can be used to deploy [Alerta](http://alerta.io/) on a single instance Ubuntu AMI in an AWS VPC.

Configuration
-------------

The following table lists the Cloudformation template parameters that can be set. There are sensible defaults where possible.

| Parameter  | Description |
| ------------- | ------------- |
| KeyName  | Name of an existing EC2 KeyPair for SSH access  |
| Stack  | Stack name  |
| App | Application name (default: alerta) |
| Stage | one of `PROD`, `DEV` or `TEST` |
| InstanceType | `t2.micro`, `t2.small` or `t2.medium` (default: `t2.micro`) |
| AuthProvider | Authentication provider for user logins eg. `basic`, `google` or `github` |
| OAuthClientId | OAuth2 Client ID for Google or GitHub OAuth2 providers |
| OAuthClientSecret | OAuth2 Client Secret for Google or GitHub OAuth2 providers |
| AllowedDomain | Allowed email domain eg. gmail.com or example.com |
| AlarmTopic | Output alarm notification topic |
| OperatorEmail | email address to notify if there are operational issues |
| VpcId | ID of the VPC onto which to launch the application eg. vpc-1234abcd |
| PublicVpcSubnet | Subnet to use in VPC for public internet-facing instance eg. subnet-abcd1234 |
| SSHLocation | IP range that can be used to SSH to the EC2 instances (default: 0.0.0.0/0) |

Deployment
----------

Use the AWS console to upload and launch the stack or use the `aws cloudformation create-stack` command-line tool.

Usage
-----

The Alerta Web UI is available at the following:

    http://<public-ec2-ip-address>

And the Alerta API is available at the following:

    http://<public-ec2-ip-address>/api

License
-------

Copyright (c) 2015-2016 Nick Satterly. Available under the MIT License.
