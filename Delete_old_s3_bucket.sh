#!/bin/bash

# Variables
BUCKET_NAME="your-bucket-name"
DAYS_OLD=30

# Calculate the cutoff date
CUTOFF_DATE=$(date -d "-$DAYS_OLD days" +%Y-%m-%d)

# List and delete old objects
aws s3api list-objects-v2 --bucket $BUCKET_NAME --query "Contents[?LastModified<'$CUTOFF_DATE'].{Key: Key}" --output text | while read -r key; do
  if [ -n "$key" ]; then
    aws s3api delete-object --bucket $BUCKET_NAME --key "$key"
    echo "Deleted $key"
  fi
done
