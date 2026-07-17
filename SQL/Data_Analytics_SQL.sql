create database retail_sales;
use retail_sales;

create table sales (
row_id int,
order_id varchar(30),
order_date date,
ship_date date,
ship_mode varchar(50),
customer_id varchar(30),
customer_name varchar(100),
segment varchar(50),
country varchar(50),
city varchar(50),
state varchar(50),
postal_code int,
region varchar(30),
product_id varchar(30),
category varchar(50),
sub_category varchar(50),
product_name varchar(255),
sales decimal(10,2)
); 

# checking imported data
select * from sales limit 10;
select count(*) as Total_Rows from sales;
describe sales;

# Basic SQL 
select * from sales;
select count(*) from sales;
select round(sum(sales),2) as Total_Sales from sales;
select round(avg(sales),2) as Average_Sales from sales;
select max(sales) from sales;
select min(sales) from sales;

# Group by functions
select category, round(sum(sales),2) as Total_Sales from sales group by category order by Total_Sales desc;
select region, round(sum(sales),2) as Total_Sales from sales group by region order by Total_Sales desc;
select segment, round(sum(sales),2) as Total_Sales from sales group by segment order by Total_Sales desc;
select city, round(sum(sales),2) as Sales from sales group by city order by Sales desc limit 10;
select state, round(sum(sales),2) as Sales from sales group by state order by Sales desc limit 10;
select ship_mode, round(sum(sales),2) as Sales from sales group by ship_mode;

# Business Analysis
select customer_name, round(sum(sales),2) as Total_Sales from sales group by customer_name order by Total_Sales desc limit 10;
select product_name, round(sum(sales),2) as Sales from sales group by product_name order by Sales desc limit 10;
select sub_category, round(sum(sales),2) as Sales from sales group by sub_category order by Sales desc;

# Data Analysis
select year(order_date) as Year, month(order_date) as Month, round(sum(sales),2) as Sales from sales group by Year, Month order by Year, Month;
select year(order_date) as Year, round(sum(sales),2) as Sales from sales group by Year;

# Advanced SQL 
select customer_name, sum(sales) as TotalSales, rank() over(order by sum(sales) desc) as ranking from sales group by customer_name;
select order_date, sum(sales) as DailySales, sum(sum(sales)) over( order by order_date) as Running_Total from sales group by order_date;

select category, round(sum(sales),2) as Total_Sales from sales group by category order by Total_Sales desc;

select region, round(sum(sales),2) as Total_Sales from sales group by region order by Total_Sales desc;

select Year(order_date) as Year, Month(order_date) as Month, round(sum(sales),2) as Monthly_Sales from sales group by Year(order_date), Month(order_date) order by Year, Month;

select customer_name, round(sum(sales),2) as Total_Sales from sales group by customer_name order by Total_Sales desc limit 10;

select product_name, round(sum(sales),2) as Total_Sales from sales group by product_name order by Total_Sales desc limit 10;

select state, round(sum(sales),2) as Total_Sales from sales group by state order by Total_Sales desc limit 10;