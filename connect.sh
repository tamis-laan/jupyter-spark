#! /bin/bash

kubectl --namespace=jupyterhub port-forward service/proxy-public 8080:http
