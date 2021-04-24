#!/bin/bash
cd ~/
mkdir .aws
touch credentials
cd .aws
echo "Insert key here" | sudo tee ~/.aws/credentials
exit 0 
