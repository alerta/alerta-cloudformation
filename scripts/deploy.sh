#!/bin/sh

aws --profile personal cloudformation create-stack \
    --stack-name alerta \
    --template-body file://../Alerta_Single_Instance.template \
    --capabilities CAPABILITY_IAM \
    --parameters \
        ParameterKey=AlarmTopic,ParameterValue=alarm-topic \
        ParameterKey=App,ParameterValue=alerta \
        ParameterKey=AuthProvider,ParameterValue=basic \
        ParameterKey=InstanceType,ParameterValue=t2.micro \
        ParameterKey=KeyName,ParameterValue=bootstrap \
        ParameterKey=OAuthClientId,ParameterValue= \
        ParameterKey=OAuthClientSecret,ParameterValue= \
        ParameterKey=OperatorEmail,ParameterValue=foo@example.com \
        ParameterKey=PublicVpcSubnet,ParameterValue=subnet-abcd1234 \
        ParameterKey=SSHLocation,ParameterValue=0.0.0.0/0 \
        ParameterKey=Stack,ParameterValue=monitoring \
        ParameterKey=Stage,ParameterValue=PROD \
        ParameterKey=VpcId,ParameterValue=vpc-1234abcd \
    --tags Key=Team,Value=DevOps