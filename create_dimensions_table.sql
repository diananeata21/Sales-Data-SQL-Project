-- Create dimensions tables
create table dim_customer as 
select distinct
customer_id,
customer_name,
segment
from stg_sales;


create table dim_products as 
select distinct
product_id,
product_name,
category,
subcategory
from stg_sales;

create table dim_location as
select distinct
country,
city,
state,
postal_code,
region
from stg_sales;

