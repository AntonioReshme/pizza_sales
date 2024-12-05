# Pizza Sales SQL and Power BI Project

## Project Overview

The Pizza Sales Project is a data analysis and visualization project aimed at analyzing and visualizing sales data from a fictional pizza restaurant chain. This project utilizes SQL for data extraction and transformation and Power BI for data visualization. The goal of this project is to provide insights and actionable information to help the pizza restaurant chain optimize its operations, improve sales, and enhance customer satisfaction.

## Objectives

- **Data Setup**: Create necessary database tables and import sample data.

- **Sales Metrics**: Calculate total orders, total revenue, and average orders per day.

- **Product Insights**: Identify the highest-priced pizzas, most common pizza sizes, and top-selling pizza types.

- **Category Analysis**: Determine the total quantity ordered for each pizza category and the distribution of pizzas by category.

- **Time-Based Analysis**: Analyze order patterns by hour and cumulative revenue over time.

- **Revenue Contribution**: Calculate the percentage contribution of each pizza type to total revenue.

- **Top Performers**: Identify the top 3 pizzas based on revenue generated.

## Project Structure

### 1. Database Setup

**Database Creation**: The project starts by creating a database named pizza_sales_db.

**Table Creation**: A table named pizza sales is created to store the sales data.

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

pizza_name varchar(50));

### 2. Data Analysis and Findings

**1. Total revenue?**

select

sum(total_price)as total_revenue

from pizza_sales

**2. Average order value?**

select

count(distinct order_id)as total_order,

round(sum(total_price)::numeric/count(distinct order_id)::numeric,2) as average_order_value

from pizza_sales

**3. Total pizzas sold?**

select

sum(quantity)

from pizza_sales

**4. Total orders?**

select

count(distinct order_id)as total_orders

from pizza_sales

**5. Average pizzas per order?**

select

round(sum(quantity)::numeric/count(distinct order_id),2)as average_pizzas_per_order

from pizza_sales

**6. Daily trend for total orders?**

select

extract(dow from order_date)as daily_trend,

count(distinct order_id)as total_orders

from pizza_sales

group by 1

**7. Monthly trend for total orders?**

select

extract(month from order_date)as monthly_trend,

count(distinct order_id)as total_orders

from pizza_sales

group by 1

**8. Percentage of sales by pizza category?**

select

pizza_category,

round(sum(total_price)::numeric,2)as total_revenue,

round((sum(total_price)*100)::numeric/(select sum(total_price)from pizza_sales)::numeric,2) as PSC

from pizza_sales

group by 1

order by 3 desc


**9. Percentage of sales by pizza size?**

select

pizza_size,

round(sum(total_price)::numeric,2)as total_revenue,

round((sum(total_price)*100)::numeric/(select sum(total_price)from pizza_sales)::numeric,2) as PSC

from pizza_sales

group by 1

order by 3 desc

**10. Total Pizzas Sold by Pizza Category?**

select

pizza_category,

sum(quantity)as total_pizza_sold

from pizza_sales

group by 1

order by 2 desc

**11. Top 5 Pizzas by Revenue?**

select

pizza_name,

round(sum(total_price)::numeric,2) as total_revenue

from pizza_sales

group by 1

order by 2 desc

limit 5

**12. Bottom 5 Pizzas by Revenue?**

select

pizza_name,

round(sum(total_price)::numeric,2) as total_revenue

from pizza_sales

group by 1

order by 2 

limit 5

**13. Top 5 Pizzas by Quantity?**

select

pizza_name,

sum(quantity)as quantity

from pizza_sales

group by 1

order by 2 desc

limit 5

**14. Bottom 5 Pizzas by Quantity?**

select

pizza_name,

sum(quantity)as quantity

from pizza_sales

group by 1

order by 2 

limit 5

**15. Top 5 Pizzas by Total Orders?**


select

pizza_name,

count(distinct order_id)as total_orders

from pizza_sales

group by 1

order by 2 desc

limit 5

**16. Bottom 5 Pizzas by Total Orders?**

select

pizza_name,

count(distinct order_id)as total_orders

from pizza_sales

group by 1

order by 2 

limit 5
