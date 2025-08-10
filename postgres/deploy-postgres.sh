#!/bin/bash
set -euo pipefail

# Ensure the cnpg-system namespace exists
kubectl get namespace cnpg-system >/dev/null 2>&1 || kubectl create namespace cnpg-system

# Add the CloudNativePG Helm repository and update
helm repo add cnpg https://cloudnative-pg.github.io/charts --force-update
helm repo update

# Install or upgrade the CloudNativePG operator
helm upgrade --install cnpg cloudnative-pg/cloudnative-pg \
  --namespace cnpg-system

# Apply existing persistent volume and claim
kubectl apply -f postgres-pv.yaml
kubectl apply -f postgres-pvc.yaml

# Apply the PostgreSQL cluster configuration using the existing claim
kubectl apply -f postgres-cluster.yaml
