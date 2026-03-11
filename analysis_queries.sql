-- Number of rows in raw_sales
select count(*) from raw_sales;

-- Number of rows in staging tables
select count(*) from stg_sales;

-- Number of rows in fact_sales
select count(*) from fact_sales;

-- Total sales
select sum(sales) as total_sales from fact_sales;

-- Total profit
select sum(profit) as total_profit from fact_sales;

-- The most recent sale
select c.customer_name, f.order_date, f.order_id
from fact_sales f 
join dim_customer c
on f.customer_id = c.customer_id
where f.order_date= ( select max(order_date) from fact_sales
);

-- Total sales per category

select p.category, sum(f.sales) as total_sales
from fact_sales f 
join dim_products p 
on f.product_id = p.product_id
group by p.category;

-- Top 5 customers by sales

select c.customer_name, sum(f.sales) as
total_sales
from fact_sales f
join dim_customer c
on f.customer_id = c.customer_id
group by c.customer_name
order by total_sales DESC
LIMIT 5;

-- Customers with sales higher than 5000

select c.customer_name, sum(f.sales) as
total_sales
from fact_sales f
join dim_customer c
on f.customer_id = c.customer_id
group by c.customer_name
having total_sales >5000
order by total_sales;