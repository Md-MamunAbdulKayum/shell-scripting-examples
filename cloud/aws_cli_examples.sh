#!/usr/bin/env bash
#############################################################
# AWS CLI examples (commands commented — uncomment to run)
# Install: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
# Auth: aws configure  |  or IAM role on EC2/Lambda/ECS
#############################################################

set -euo pipefail

# --- Identity & region ---
# aws sts get-caller-identity
# aws configure get region

# --- S3 ---
# List buckets
# aws s3 ls
# Copy file to bucket
# aws s3 cp ./local.txt s3://my-bucket/path/local.txt
# Sync directory (dry-run first)
# aws s3 sync ./build s3://my-bucket/app/ --dryrun
# aws s3 sync ./build s3://my-bucket/app/

# --- EC2 ---
# List running instances (query reduces output)
# aws ec2 describe-instances \
#   --filters "Name=instance-state-name,Values=running" \
#   --query 'Reservations[].Instances[].{Id:InstanceId,Name:Tags[?Key==`Name`]|[0].Value,Type:InstanceType}' \
#   --output table

# --- CloudWatch Logs (tail) ---
# aws logs tail /aws/lambda/my-function --since 1h --follow

# --- Secrets Manager (value is JSON string often) ---
# SECRET=$(aws secretsmanager get-secret-value --secret-id my/app/db --query SecretString --output text)
# echo "$SECRET" | jq -r '.password'

# --- EKS kubeconfig ---
# aws eks update-kubeconfig --name my-cluster --region us-east-1

echo "AWS examples are comments in: $(basename "$0")"
exit 0
