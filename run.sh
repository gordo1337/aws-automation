#!/bin/bash

#Generating keypair for Instances 
EC2_Keypair1=$(
aws ec2 create-key-pair --key-name MyKeyPair1)

if [ $EC2_Keypair1 -eq 0 ]; then
echo "Mykeypair1 succed"
else
echo "MyKeypair1 Failed"
fi

EC2_Keypair2=$(
aws ec2 create-key-pair --key-name MyKeyPair2)

if [ $EC2_Keypair2 -eq 0 ]; then
echo "Mykeypair2 succed"
else
echo "MyKeypair2 Failed"
fi

#Finance
EC2_instanceFinance=$(aws ec2 run-instances --image-id ami-042e8287309f5df03 --count 1  --instance-type t2.micro --key-name "MyKeyPair1" --security-group-ids "$EC2_SecuritygroupIT" --subnet-id "$EC2_subnetIT" --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cli-generated}]')

if [ $EC2_instanceFinance -eq 0 ]; then
echo "Finance instance suceed"
else
echo "Finance instance Failed"
fi

#IT
EC2_instanceIT=$(aws ec2 run-instances --image-id ami-042e8287309f5df03 --count 1  --instance-type t2.micro --key-name "MyKeyPair2"  --security-group-ids "$EC2_Securitygroup_finance" --subnet-id "$EC2_subnetFinance" --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cli-generated}]')

if [ $EC2_instanceIT -eq 0 ]; then
echo "IT instance suceed"
else
echo "IT instance Failed"
fi

#Creating a VPC 
#vpc-094ce3ff5f33f1c25

EC2_VPC_ID=$(aws ec2 create-vpc --cidr-block 10.1.0.0/16)

if [ $EC2_VPC_ID -eq 0 ]; then
echo "VPC Created"
else
echo "Failed to Create VPC"
fi

#Creating a Internet gateway 
EC2_IGW=$(aws ec2 create-internet-gateway)

if [ $EC2_IGW -eq 0 ]; then
echo "Gateway Created"
else
echo "Failed to Create Gateway"
fi

#Attaching Gateway to VPC 
EC2_ATTACH_IGW=$(aws ec2 attach-internet-gateway --internet-gateway-id "$EC2_GATEWAY"  --vpc-id "$EC2_VPC_ID" 

if [ $EC2_ATTACH_IGW -eq 0 ]; then
echo "Gateway Attached to VPC"
else
echo "Failed to Attach Internet Gateway to VPC"
fi

#CREATING ROUTE TABLE TO VPC ID 
EC2_ROUTE_TABLE=$(aws ec2 create-route-table --vpc-id "$EC2_VPC_ID" )	

EC2_ROUTE=$(aws ec2 create-route --route-table-id "$EC2_ROUTE_TABLE" --destination-cidr-block 10.1.0.0/16 --gateway-id "$EC2_IGW")


#Creating subnet

#IT
EC2_subnetIT=$(aws ec2 create-subnet --vpc-id "$EC2_VPC_ID" --cidr-block 10.1.2.0/24)

if [ $EC2_susbnetIT -eq 0 ]; then
echo "subnet Created"
else
echo "Failed to Create subnet"
fi

#Finance
EC2_subnetFinance=$(aws ec2 create-subnet --vpc-id "$EC2_VPC_ID" --cidr-block 10.1.1.0/24)

if [ $EC2_susbnetFinance -eq 0 ]; then
echo "subnet Created"
else
echo "Failed to Create subnet"
fi 

#Elastic ip allocation (Elastic IP with a private IP address that's associated with a network interface of the subnet IT.)
EC2_elasticIP_IT=$(aws ec2 associate-address --allocation-id eipalloc-64d5890a --network-interface-id eni-1a2b3c4d --private-ip-address  10.1.2.0/24)

if [ $EC2_elasticIP_IT -eq 0 ]; then
echo "Elastic IP for IT Created"
else
echo "Failed to Create Elastic for IT"
fi

# Securitygroup Finance
EC2_Securitygroup_finance=$(aws ec2 create-security-group --group-name Finance --description "Created from CLI")

if [ $EC2_Securitygroup_finance -eq 0 ]; then
echo "Securitygroup for Finance Created"
else
echo "Failed to Create Securitygroup for Finance"
fi

#Ingress security group
EC2Authorize-securityFinance=$(aws ec2 authorize-security-group-ingress --group-name Finance --cidr-block 10.1.1.0/24)

if [ $EC2_SecurityFinance -eq 0 ]; then
echo "Authorization suceed for Securitygroup Finance"
else
echo "Failed to Create Securitygroup for Finance"
fi


EC2_SecuritygroupIT=$(aws ec2 create-security-group --group-name IT --description "Created from CLI")

if [ $EC2_SecuritygroupIT -eq 0 ]; then
echo "Securitygroup for IT Created"
else
echo "Failed to Create Securitygroup for IT"
fi

EC2Authorize-securityIT=$(aws ec2 authorize-security-group-ingress --group-name IT --protocol tcp --port 80 --cidr-block 10.1.2.0/24)

if [ $EC2_SecurityFinance -eq 0 ]; then
echo "Authorization suceed for Securitygroup IT"
else
echo "Failed to create" 	
fi

exit 0