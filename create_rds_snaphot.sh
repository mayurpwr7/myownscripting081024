#!/bin/bash

# Variables
REGION="ap-south-1a"  # e.g., us-west-2
DB_INSTANCE_IDENTIFIER="database-1"
SNAPSHOT_IDENTIFIER="snapshotmyown-$(date +%Y-%m-%d-%H-%M-%S)"

# Create RDS snapshot
aws rds create-db-snapshot \
    --region $REGION \
    --db-instance-identifier $DB_INSTANCE_IDENTIFIER \
    --db-snapshot-identifier $SNAPSHOT_IDENTIFIER

# Check if the snapshot was created successfully
if [ $? -eq 0 ]; then
    echo "Snapshot $SNAPSHOT_IDENTIFIER created successfully."
else
    echo "Failed to create snapshot."
fi
