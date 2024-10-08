#!/bin/bash

# Specify the AWS region
REGION="us-east-2"

# Get all instance IDs in the specified region
INSTANCE_IDS=$(aws ec2 describe-instances --region $REGION --query "Reservations[*].Instances[*].InstanceId" --output text)

# Check if there are any instances to terminate
if [ -z "$INSTANCE_IDS" ]; then
  echo "No instances found in region $REGION."
else
  # Terminate all instances
  aws ec2 terminate-instances --region $REGION --instance-ids $INSTANCE_IDS
  echo "Terminating instances: $INSTANCE_IDS"
fi
