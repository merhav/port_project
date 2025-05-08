#!/bin/bash

# Input file
DEPLOYMENT_FILE="K8s-deploy.json"

# Check if file exists
if [[ ! -f "$DEPLOYMENT_FILE" ]]; then
  echo "Error: $DEPLOYMENT_FILE not found."
  exit 1
fi

# 1. Current replica count
replicas=$(./jq.exe '.spec.replicas' "$DEPLOYMENT_FILE")

# 2. Deployment strategy type
strategy=$(./jq.exe -r '.spec.strategy.type' "$DEPLOYMENT_FILE")

# 3. Concatenated "service" and "environment" labels
service_env=$(./jq.exe -r '.metadata.labels | "\(.service)-\(.environment)"' "$DEPLOYMENT_FILE")

# Output the results
echo "Replica Count: $replicas"
echo "Deployment Strategy: $strategy"
echo "Service-Environment: $service_env"
