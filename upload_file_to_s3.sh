#!/bin/bash

# Variables
FILE_PATH="/d/newscript/name.txt"
BUCKET_NAME="mybucket091024bash"
#S3_KEY="your/s3/key"

# Upload the file
aws s3 cp "$FILE_PATH" "s3://$BUCKET_NAME/$S3_KEY"

# Check if the upload was successful
if [ $? -eq 0 ]; then
  echo "File uploaded successfully."
else
  echo "File upload failed."
fi
