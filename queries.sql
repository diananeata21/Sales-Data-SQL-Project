-- select * from raw_sales;
-- select count(*) from raw_sales;

-- the most recent sale

select c.customer_name, f.order_date, f.order_id
from fact_sales f 
join dim_customer c
on f.customer_id = c.customer_id
where f.order_date= ( select max(order_date) from fact_sales
);

-- total sales per category

select p.category, sum(f.sales) as total_sales
from fact_sales f 
join dim_products p 
on f.product_id = p.product_id
group by p.category;