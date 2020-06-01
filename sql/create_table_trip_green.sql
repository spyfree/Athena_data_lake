CREATE EXTERNAL TABLE `trip_green`(
  `vendorid` bigint, 
  `pickup_datetime` string, 
  `dropoff_datetime` string, 
  `passenger_count` bigint, 
  `trip_distance` double, 
  `ratecodeid` bigint, 
  `store_and_fwd_flag` string, 
  `pickup_longitude` double, 
  `pickup_latitude` double, 
  `pickup_locationid` int, 
  `dropoff_longitude` double, 
  `dropoff_latitude` double, 
  `dropoff_locationid` int, 
  `payment_type` bigint, 
  `fare_amount` double, 
  `extra` double, 
  `mta_tax` double, 
  `tip_amount` double, 
  `tolls_amount` double, 
  `improvement_surcharge` double, 
  `total_amount` double, 
  `congestion_surcharge` double)
PARTITIONED BY ( 
  `month` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://trip-ny-parquet/green'
TBLPROPERTIES (
  'parquet.compress'='GZIP')
