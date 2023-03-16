from pyspark.sql import SparkSession
spark = SparkSession.builder \
    .master("k8s://https://127.0.0.1:39287") \
    .appName("Word Count") \
    .config("spark.kubernetes.container.image", "gcr.io/spark/spark:v3.1.1") \
    .getOrCreate()
