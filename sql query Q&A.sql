--create database pizza_sales

create table pizza_sales(
pizza_id int,
order_id int,
pizza_name_id varchar(20),
quantity int,
order_date date,
order_time time,
unit_price float,	
total_price float,
pizza_size varchar(10),
pizza_category varchar(25),
pizza_ingredients varchar(100),
pizza_name varchar(50)
);

select*from pizza_sales

--Data Analysis
--(1)total revenue

select
sum(total_price)as total_revenue
from pizza_sales

--(2)average order value

select
count(distinct order_id)as total_order,
round(sum(total_price)::numeric/count(distinct order_id)::numeric,2) as average_order_value
from pizza_sales

--(3)total pizzas sold

select
sum(quantity)
from pizza_sales

--(4)total orders

select
count(distinct order_id)as total_orders
from pizza_sales

--(5)average pizzas per order

select
round(sum(quantity)::numeric/count(distinct order_id),2)as average_pizzas_per_order
from pizza_sales

--(6)daily trend for total orders

select
extract(dow from order_date)as daily_trend,
count(distinct order_id)as total_orders
from pizza_sales
group by 1

--(7)monthly trend for total orders

select
extract(month from order_date)as monthly_trend,
count(distinct order_id)as total_orders
from pizza_sales
group by 1

--(8)percentage of sales by pizza category?

select
pizza_category,
round(sum(total_price)::numeric,2)as total_revenue,
round((sum(total_price)*100)::numeric/(select sum(total_price)from pizza_sales)::numeric,2) as PSC
from pizza_sales
group by 1
order by 3 desc

--(9)percentage of sales by pizza size?

select
pizza_size,
round(sum(total_price)::numeric,2)as total_revenue,
round((sum(total_price)*100)::numeric/(select sum(total_price)from pizza_sales)::numeric,2) as PSC
from pizza_sales
group by 1
order by 3 desc

--(10)Total Pizzas Sold by Pizza Category?

select
pizza_category,
sum(quantity)as total_pizza_sold
from pizza_sales
group by 1
order by 2 desc

--(11)Top 5 Pizzas by Revenue?

select
pizza_name,
round(sum(total_price)::numeric,2) as total_revenue
from pizza_sales
group by 1
order by 2 desc
limit 5

--(12)Bottom 5 Pizzas by Revenue?

select
pizza_name,
round(sum(total_price)::numeric,2) as total_revenue
from pizza_sales
group by 1
order by 2 
limit 5

--(13)Top 5 Pizzas by Quantity?

select
pizza_name,
sum(quantity)as quantity
from pizza_sales
group by 1
order by 2 desc
limit 5

--(14)Bottom 5 Pizzas by Quantity?

select
pizza_name,
sum(quantity)as quantity
from pizza_sales
group by 1
order by 2 
limit 5

--(15)Top 5 Pizzas by Total Orders?


select
pizza_name,
count(distinct order_id)as total_orders
from pizza_sales
group by 1
order by 2 desc
limit 5

--(16)Bottom 5 Pizzas by Total Orders?

select
pizza_name,
count(distinct order_id)as total_orders
from pizza_sales
group by 1
order by 2 
limit 5
