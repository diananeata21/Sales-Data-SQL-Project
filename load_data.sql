-- Load raw CSV from path
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Superstore.csv'
into table raw_sales
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

-- Copy raw data to staging 
create table stg_sales as select * from raw_sales;