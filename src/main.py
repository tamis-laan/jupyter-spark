# !pip install --force-reinstall 'pyspark==3.1.1'

from pyspark.sql import SparkSession

# LOCAL RUN
spark = SparkSession.builder \
    .master('local') \
    .appName("Word Count") \
    .config("spark.submit.deployMode", "client") \
    .getOrCreate()

df = spark.sql("select 'spark' as hello")

df.show()

# CLUSTER RUN
spark = SparkSession.builder \
    .master("k8s://https://127.0.0.1:38475") \
    .appName("Word Count") \
    .config("spark.submit.deployMode","client") \
    .config("spark.executor.instances", 5) \
    .config("spark.kubernetes.container.image", "gcr.io/spark/spark:v3.1.1") \
    .getOrCreate()

df = spark.sql("select 'spark' as hello")

df.show()
