create database SQL_Orders;
use SQL_Orders;
create table Orders
(
Order_Id int,
Order_Date date,
Ship_Mode varchar(50),
Segment varchar(50),
Country varchar(50),
City varchar(50),
State varchar(50),
Postal_Code int,
Region varchar(50),
Category varchar(50),
Sub_Category varchar(50),
Product_Id varchar(50),
cost_price double,
List_price double,
Quantity double,
Discount_Percent double,
total_cost double
);

select * from orders;

describe orders;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select distinct extract(month from order_date) as Months from orders;

select distinct  date_format(order_date, '%M') as months from orders;

select date_format(order_date, '%M') as months, count(order_id) 
from orders group by months;

select date_format(order_date, '%Y') as years, count(order_id) as total_transaction from orders group by  years;

select category,count(order_id) from
 orders group by 
 category;
 
 select category,date_format(order_date, '%Y') as years,sum(total_cost) as total_sales
from orders
 group by category,years
 order by category;
 
 select city, sum(total_cost) as total 
from orders 
where order_date<'2022-12-30' and order_date>'2022-06-01' 
group by city order by total desc limit 5;

select Sub_Category, sum(quantity) as total_items
from orders 
where order_date>'2022-01-01' and order_date<'2023-01-01'
group by sub_category
order by total_items desc
limit 5; 

SELECT `Ship_Mode`, COUNT(Order_Id) AS order_count
FROM orders
GROUP BY `Ship_Mode`
order by order_count desc;

