# Athena data lake solution

## Why use this solution

I spent a lot time working with the lambda MapReduce framework, finally get it
worked, found out it was quite expensive. I have several options now:
i can spin up a new EMR cluster to do the job, or use another serverless Athena to do the
job. 

I am more familiar with SQL and Athena is quite a useful tool in datalake
solution. So i give it a try.

The etl process is much same as before:

1. create a external table that reads from S3 data, this step can also be done
   using AWS glue crawler.

2. doing some transformation, mainly geo spatialjoin, using this
   [document](https://docs.aws.amazon.com/athena/latest/ug/geospatial-example-queries.html)

3. write back to S3, we can use insert into query to a pre-defined partitioned parquet table.


## the problem and fix

### read data from S3 and other source
because of Athena external table path can only point to a directory, we need
to use a script to create a folder for every csv file.  And generate a create
table DDL sql for every directory.

I use a python script to query NCCA to get the weather data of nyc as csv
files, and then use AWS glue cralwer to generate table definition.

### perform the spatial join


