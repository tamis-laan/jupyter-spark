#! /bin/bash

					# kubectl cluster-info
          # --master k8s://https://127.0.0.1:39287 \

					# kubectl proxy
          # --master k8s://https://127.0.0.1:8001 \

# Run spark job as a test on kubernetes
spark-submit \
					--verbose \
          --master k8s://http://127.0.0.1:8001 \
          --deploy-mode cluster \
          --name spark-pi \
          --class org.apache.spark.examples.SparkPi \
          --conf spark.executor.instances=5 \
          --conf spark.kubernetes.container.image=datamechanics/spark:3.2-latest  \
					--conf spark.kubernetes.authenticate.ssl.noCertVerification=true \
					--conf spark.executor.extraJavaOptions=-Djavax.net.debug=all \
					--conf spark.driver.extraJavaOptions=-Djavax.net.debug=all \
          local:///opt/spark/examples/src/main/python/pi.py
