#!/usr/bin/env bash
#############################################################
# Azure CLI (az) examples — uncomment to run
# Install: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
# Auth: az login  |  az account set --subscription SUBSCRIPTION_ID
#############################################################

set -euo pipefail

# --- Subscription ---
# az account show --query '{name:name, id:id, tenant:tenantId}' -o table
# az group list -o table

# --- Storage ---
# az storage account list -o table
# az storage blob upload --account-name MYACCOUNT --container-name logs --name app.log --file ./app.log

# --- VMs ---
# az vm list -d --query "[?powerState=='VM running'].{Name:name, RG:resourceGroup, IP:publicIps}" -o table

# --- AKS ---
# az aks get-credentials --resource-group my-rg --name my-cluster

# --- Key Vault secret ---
# az keyvault secret show --vault-name my-vault --name db-password --query value -o tsv

# --- JSON output piped to jq ---
# az resource list --query "[?type=='Microsoft.Storage/storageAccounts'].{name:name, location:location}" -o json | jq .

echo "Azure CLI examples are comments in: $(basename "$0")"
exit 0
