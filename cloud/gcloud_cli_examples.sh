#!/usr/bin/env bash
#############################################################
# Google Cloud SDK (gcloud) examples — uncomment to run
# Install: https://cloud.google.com/sdk/docs/install
# Auth: gcloud auth login  |  gcloud config set project PROJECT_ID
#############################################################

set -euo pipefail

# --- Project & account ---
# gcloud config get-value project
# gcloud auth list

# --- Compute Engine ---
# gcloud compute instances list --format='table(name,zone,machineType.basename(),status)'

# --- GCS (storage) ---
# gsutil ls
# gsutil cp ./artifact.tar.gz gs://my-bucket/releases/
# gsutil -m rsync -r ./dist gs://my-bucket/site/

# --- Cloud Run ---
# gcloud run services list --platform managed --region us-central1
# gcloud run deploy my-service --image gcr.io/PROJECT/image:tag --region us-central1 --allow-unauthenticated

# --- GKE ---
# gcloud container clusters get-credentials my-cluster --zone us-central1-a

# --- Secret Manager ---
# gcloud secrets versions access latest --secret=db-password

echo "gcloud examples are comments in: $(basename "$0")"
exit 0
