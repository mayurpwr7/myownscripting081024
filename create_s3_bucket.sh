#!/bin/bash

# Variables
BUCKET_NAME="bucket081024123456"
REGION="ap-south-1"

# Check if bucket name and region are provided
if [ -z "$BUCKET_NAME" ] || [ -z "$REGION" ]; then
  echo "Usage: $0 <bucket-name> <region>"
  exit 1
fi

# Create the S3 bucket
aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" --create-bucket-configuration LocationConstraint="$REGION"

# Check if the bucket was created successfully
if [ $? -eq 0 ]; then
  echo "Bucket '$BUCKET_NAME' created successfully in region '$REGION'."
else
  echo "Failed to create bucket '$BUCKET_NAME'."
fi
