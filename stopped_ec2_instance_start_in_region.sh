#!/bin/bash

# Specify the AWS region
REGION="ap-south-1"

# Get all stopped instances in the specified region
INSTANCE_IDS=$(aws ec2 describe-instances --region $REGION --filters "Name=instance-state-name,Values=stopped" --query "Reservations[*].Instances[*].InstanceId" --output text)

# Start each stopped instance
for INSTANCE_ID in $INSTANCE_IDS; 
do
  echo "Starting instance $INSTANCE_ID"
  aws ec2 start-instances --region $REGION --instance-ids $INSTANCE_ID
done
