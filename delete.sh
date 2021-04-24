#!/bin/bash

1a=$(aws ec2 delete-key-pair --key-name MyKeyPair1)

1b=$(aws ec2 delete-key-pair --key-name MyKeyPair2)

2a=$(aws ec2 delete-instances --image-id ami-042e8287309f5df03 --count 1  --instance-type t2.micro --key-name "MyKeyPair1" --security-group-ids "$EC2_SecuritygroupIT" --subnet-id "$EC2_subnetIT" --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cli-generated}]')

2b=$(aws ec2 delete-instances --image-id ami-042e8287309f5df03 --count 1  --instance-type t2.micro --key-name "MyKeyPair2"  --security-group-ids "$EC2_Securitygroup_finance" --subnet-id "$EC2_subnetFinance" --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cli-generated}]')

3a=$(aws ec2 delete-vpc --cidr-block 10.1.0.0/16)

3b=$(aws ec2 deatach-internet-gateway --internet-gateway-id "$EC2_GATEWAY"  --vpc-id "$EC2_VPC_ID")

3c=$(aws ec2 delete-internet-gateway)

3d=$(aws ec2 delete-route-table --vpc-id "$EC2_VPC_ID")

3e=$(aws ec2 delete-route --route-table-id "$EC2_ROUTE_TABLE" --destination-cidr-block 10.1.0.0/16 --gateway-id "$EC2_IGW")

4a=$(aws ec2 delete-subnet --vpc-id "$EC2_VPC_ID" --cidr-block 10.1.2.0/24)

4b=$(aws ec2 delete-subnet --vpc-id "$EC2_VPC_ID" --cidr-block 10.1.1.0/24)

4c=$(aws ec2 disassociate-address --allocation-id eipalloc-64d5890a --network-interface-id eni-1a2b3c4d --private-ip-address 10.1.2.0/24)

5a=$(aws ec2 delete-security-group --group-name Finance --description "Created from CLI")

5b=$(aws ec2 unauthorize-security-group-ingress --group-name Finance --cidr-block 10.1.1.0/24)

5c=$(aws ec2 delete-security-group --group-name IT --description "Created from CLI")

5d=$(aws ec2 unauthorize-security-group-ingress --group-name IT --protocol tcp --port 80 --cidr-block 10.1.2.0/24)

exit 0 
