#! /bin/bash

# Add the repos
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
# helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator

# Make sure we are up to date
helm repo update

# Create the cluster
kind create cluster --name jupyter

# Set the context
# kubectl config set-context --namespace=jupyterhub jupyter
kubectl config set-context jupyter

# Add permissions for notebooks to talk to the API server
kubectl apply -f rbac.yaml

# Print RBAC
kubectl get sa jupyter-notebook-sa
kubectl describe role jupyter-notebook-role
kubectl describe rolebinding jupyter-notebook-binding

# Start the driver service
kubectl apply -f ./spark-driver.yaml

# Install Jupyter hub
helm upgrade --cleanup-on-fail \
  --install my-jupyterhub jupyterhub/jupyterhub \
  --version=2.0.1-0.dev.git.5962.hb6d48a78 \
  --values jupyter.values.yaml \

# helm upgrade --cleanup-on-fail \
#   --install my-jupyterhub jupyterhub/jupyterhub \
#   --create-namespace \
#   --version=2.0.1-0.dev.git.5962.hb6d48a78 \
#   --values jupyter.values.yaml \
#   --namespace jupyterhub

# helm upgrade --cleanup-on-fail \
# 	--install my-park spark-operator/spark-operator \
# 	--namespace spark-operator \
# 	--create-namespace

# Set the default namespace
# kubectl config set-context $(kubectl config current-context) --namespace jupyterhub
