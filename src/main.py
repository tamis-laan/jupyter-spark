# !pip install --force-reinstall 'pyspark==3.1.1'

from pyspark.sql import SparkSession

# Open spark session
spark = SparkSession.builder \
    .master("k8s://https://172.20.0.2:6443") \
    .appName("Word Count") \
    .config("spark.submit.deployMode","client") \
    .config("spark.executor.instances", 1) \
    .config("spark.kubernetes.container.image", "datamechanics/spark:3.2-latest") \
    .config("spark.kubernetes.authenticate.driver.serviceAccountName", "jupyter-notebook-sa") \
    .config("spark.kubernetes.authenticate.serviceAccountName", "jupyter-notebook-sa") \
    .config("spark.kubernetes.namespace", "default") \
    .config("spark.driver.port", "2222") \
    .config("spark.driver.blockManager.port", "7777") \
    .config("spark.driver.host", "driver-service.default.svc.cluster.local") \
    .config("spark.driver.bindAddress", "0.0.0.0") \
    .getOrCreate()


# Open spark session with default values
# spark = SparkSession.builder.appName("DERP").getOrCreate()

df = spark.sql("select 'spark' as hello")

df.show()

# Close spark session
spark.stop()
