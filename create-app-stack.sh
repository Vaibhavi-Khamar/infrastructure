#!/bin/bash
echo "CREATING STACK"
stackName=$1
csye_const=-csye6225-
vpc_const=vpc
ig_const=InternetGateway
public_route_table_const=public-table
private_route_table_const=private-table
web_subnet_tag=web-subnet
web_subnet2_tag=web-subnet2
web_subnet3_tag=web-subnet3
db_subnet_tag=db-subnet
db_subnet2_tag=db-subnet2
ws_security_group=ws-sg
db_security_group=db-sg
vpc_cidr=10.0.0.0/16
websubnet_cidr=10.0.1.0/24
websubnet2_cidr=10.0.0.0/24
websubnet3_cidr=10.0.3.0/24
dbsubnet1_cidr=10.0.2.0/24
dbsubnet2_cidr=10.0.4.0/24
stackRegion=us-east-1
web_subnet_zone=us-east-1a
web_subnet_zone2=us-east-1b
web_subnet_zone3=us-east-1c
Bucketname=codedeploydev.vaibhavikhamar.me
ec2_ami=ami-0179209353954f1c0
instance_type=t2.micro
rds_username=root
rds_password=root1234
rds_hostname=clouddb
vpcTag=$stackName$csye_const$vpc_const
echo $vpcTag
stackId=$(aws cloudformation --profile dev create-stack --region $stackRegion   --capabilities CAPABILITY_NAMED_IAM  --stack-name $stackName  --template-body \
 file://application.json --parameters \
ParameterKey=vpcTag,ParameterValue=$vpcTag \
ParameterKey=igTag,ParameterValue=stackName$csye_const$ig_const \
ParameterKey=publicRouteTableTag,ParameterValue=$stackName$csye_const$public_route_table_const \
ParameterKey=privateRouteTableTag,ParameterValue=$stackName$csye_const$private_route_table_const \
ParameterKey=webSubnetTag,ParameterValue=$stackName$csye_const$web_subnet_tag \
ParameterKey=webSubnet2Tag,ParameterValue=$stackName$csye_const$web_subnet2_tag \
ParameterKey=webSubnet3Tag,ParameterValue=$stackName$csye_const$web_subnet3_tag \
ParameterKey=ec2AMI,ParameterValue=$ec2_ami \
ParameterKey=Bucketname,ParameterValue=$Bucketname \
ParameterKey=InstanceTypeParameter,ParameterValue=$instance_type \
ParameterKey=vpccidr,ParameterValue=$vpc_cidr \
ParameterKey=websubnetcidr,ParameterValue=$websubnet_cidr \
ParameterKey=websubnet2cidr,ParameterValue=$websubnet2_cidr \
ParameterKey=websubnet3cidr,ParameterValue=$websubnet3_cidr \
ParameterKey=dbsubnet1cidr,ParameterValue=$dbsubnet1_cidr \
ParameterKey=dbsubnet2cidr,ParameterValue=$dbsubnet2_cidr \
ParameterKey=webSubnetZone,ParameterValue=$web_subnet_zone \
ParameterKey=webSubnetZone2,ParameterValue=$web_subnet_zone2 \
ParameterKey=webSubnetZone3,ParameterValue=$web_subnet_zone3 \
ParameterKey=dbSubnetTag,ParameterValue=$stackName$csye_const$db_subnet_tag \
ParameterKey=dbSubnet2Tag,ParameterValue=$stackName$csye_const$db_subnet2_tag \
ParameterKey=webServerSecurityGroupNameTag,ParameterValue=$stackName$csye_const$ws_security_group \
ParameterKey=dbSecurityGroupNameTag,ParameterValue=$stackName$csye_const$db_security_group \
ParameterKey=RdsUserName,ParameterValue=$rds_username \
ParameterKey=RdsPassword,ParameterValue=$rds_password \
ParameterKey=RdsHostname,ParameterValue=$rds_hostname \
--query [StackId] --output text)

echo "#############################"
echo $stackId
echo "#############################"

if [ -z $stackId ]; then
    echo 'Error occurred.Dont proceed. TERMINATED'
else
    aws cloudformation --profile dev  wait stack-create-complete --stack-name $stackId
    echo "STACK CREATION COMPLETE."
fi