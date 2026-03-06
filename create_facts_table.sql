-- Create fact table and add constraints
create table fact_sales as
select
order_id,
order_date,
ship_date,
customer_id,
product_id,
sales,
quantity,
discount,
profit
from stg_sales;

alter table dim_customer
add primary key(customer_id);

alter table dim_products
add primary key (product_id);

alter table fact_sales
add constraint fk_customer
foreign key (customer_id)
references dim_customer(customer_id);
