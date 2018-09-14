Alerta on AWS EC2
=================

This [CloudFormation](http://aws.amazon.com/cloudformation/aws-cloudformation-templates/)
template can be used to deploy [Alerta](http://alerta.io/) in a small
Auto-Scaling Group behind a Elastic Load Balancer in an AWS VPC using
RDS Postgres as the backend database.

For help, join [![Gitter chat](https://badges.gitter.im/alerta/chat.png)](https://gitter.im/alerta/chat)

Reqirements
-----------

 * VPC with at least two public subnets
 * Google Tracking ID (optional)

Configuration
-------------

The following table lists the Cloudformation template parameters that can be set. There are sensible defaults where possible.

| Parameter  | Description |
| ------------- | ------------- |
| VpcId | ID of the VPC onto which to launch the application eg. vpc-1234abcd |
| Subnets | Public subnets to use in VPC for internet-facing ELB, instances and RDS eg. subnet-abcd1234 |
| InstanceType | `t2.micro`, `t2.small` or `t2.medium` (default: `t2.micro`) |
| KeyName  | Name of an existing EC2 KeyPair for SSH access  |
| SSHLocation | IP range that can be used to SSH to the EC2 instances (default: 0.0.0.0/0) |
| SecretKey |  |
| AllowedDomain | Allowed email domain eg. gmail.com or example.com |
| TrackingId |  |
| DBName |  |
| DBUser |  |
| DBPassword |  |
| DBInstanceClass |  |
| DBAllocatedStorage |  |
| MultiAZ |  |

Deployment
----------

Use the AWS console to upload and launch the stack or use the
`aws cloudformation create-stack` command-line tool.

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
