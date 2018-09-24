#!/usr/bin/env bash

REGIONS=$(aws ec2 describe-regions --query 'Regions[].{Name:RegionName}' --output text | sort)

echo "Mappings:
  RegionMap:"

for region in ${REGIONS}
do
  ami_id=$(aws --region $region ec2 describe-images --owners amazon --filters 'Name=name,Values=amzn2-ami-hvm-2.0.????????-x86_64-gp2' 'Name=state,Values=available' | jq -r '.Images | sort_by(.CreationDate) | last(.[]).ImageId')
  echo "    '$region':"
  echo "      AMI: '$ami_id'"
done
