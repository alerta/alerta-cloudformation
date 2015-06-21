#!/bin/sh

aws --profile personal cloudformation create-stack \
    --stack-name alerta-cli2 \
    --template-body file://../Alerta_Single_Instance.template \
    --capabilities CAPABILITY_IAM \
    --parameters \
        ParameterKey=AlarmTopic,ParameterValue=alarm-topic1 \
        ParameterKey=App,ParameterValue=alerta \
        ParameterKey=AuthProvider,ParameterValue=google \
        ParameterKey=InstanceType,ParameterValue=t2.small\
        ParameterKey=KeyName,ParameterValue=bootstrap \
        ParameterKey=OAuthClientId,ParameterValue=379647311730-sj130ru952o3o7ig8u0ts8np2ojivr8d.apps.googleusercontent.com \
        ParameterKey=OAuthClientSecret,ParameterValue=8HrqJhbrYn9oDtaJqlIBacaW \
        ParameterKey=OperatorEmail,ParameterValue=nfsatterly@gmail.com \
        ParameterKey=PublicVpcSubnet,ParameterValue=subnet-0fa00c78 \
        ParameterKey=SSHLocation,ParameterValue=0.0.0.0/0 \
        ParameterKey=Stack,ParameterValue=monitoring \
        ParameterKey=Stage,ParameterValue=PROD \
        ParameterKey=VpcId,ParameterValue=vpc-fffd0f9a \
    --tags Key=Team,Value=DevOps