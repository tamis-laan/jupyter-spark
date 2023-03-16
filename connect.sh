#! /bin/bash

# Get internal API server link
kubectl get endpoints kubernetes -n default

# kubectl --namespace=jupyterhub port-forward service/proxy-public 8080:http
kubectl port-forward service/proxy-public 8080:http
