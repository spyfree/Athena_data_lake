CREATE EXTERNAL TABLE `trip_agg_by_day_pu`(
  `trip_taxi_type` string, 
  `vendorid` bigint, 
  `pickup_date` date, 
  `trip_count` bigint, 
  `trip_duration_min` double, 
  `passenger_count` bigint, 
  `trip_distance` double, 
  `pickup_locationid` int, 
  `pickup_zone` string, 
  `pickup_borough` string, 
  `payment_type` bigint, 
  `fare_amount` double, 
  `total_amount` double, 
  `extra` double, 
  `mta_tax` double, 
  `tip_amount` double, 
  `tolls_amount` double, 
  `improvement_surcharge` double, 
  `congestion_surcharge` double, 
  `is_fog` int, 
  `is_rain` int, 
  `is_snow` int, 
  `tmax` bigint, 
  `tmin` bigint, 
  `prcp` double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://trip-ny-parquet/trip_agg_by_day_pu'
TBLPROPERTIES (
  'parquet.compress'='GZIP')
