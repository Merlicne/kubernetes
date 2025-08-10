#!/bin/bash
set -euo pipefail

# Ensure the cert-manager namespace exists
kubectl get namespace cert-manager >/dev/null 2>&1 || kubectl create namespace cert-manager

# Add the jetstack repo and update repositories
helm repo add jetstack https://charts.jetstack.io --force-update
helm repo update

# Install or upgrade cert-manager
helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --set installCRDs=true

