# Spark & Jupyterhub experimental deployment

## Docs
**Getting started with Spark docs**
https://spark.apache.org/docs/latest/api/python/getting_started/quickstart_df.html

**Spark on kubernetes docs**
https://spark.apache.org/docs/latest/running-on-kubernetes.html

**Spark operator by google**
https://github.com/GoogleCloudPlatform/spark-on-k8s-operator/blob/master/docs/user-guide.md

**Jupyterhub on kubernetes operator docs**
https://z2jh.jupyter.org/en/stable/

## Install
1. Install docker
https://docs.docker.com/get-docker/
2. Install kind
https://kind.sigs.k8s.io/docs/user/quick-start/
3. Install helm
https://helm.sh/docs/intro/install/
4. Run `quickstart.sh` to install Jupyterhub

## Connect
5. Run `connect.sh` to port forward jypyterhub to https://localhost:8080
