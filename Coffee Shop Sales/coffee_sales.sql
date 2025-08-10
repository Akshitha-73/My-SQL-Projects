create database coffee_shope_analysis;

use coffee_shope_analysis;

CREATE TABLE coffee_sales (
 coffee_salescoffee_sales   transaction_id INT,
    transaction_date VARCHAR(20),
    transaction_time VARCHAR(20),
    transaction_qty INT,
    store_id INT,
    store_location VARCHAR(50),
    product_id INT,
    unit_price FLOAT,
    product_category VARCHAR(50),
    product_type VARCHAR(100),
    product_detail VARCHAR(255)
);


select * from coffee_sales;

select * from coffee_sales
where product_category = 'Tea' ;

select transaction_id,product_category, product_type 
from coffee_sales
where store_location='Astoria';

select * from coffee_sales
where transaction_qty > 3 ;

select distinct(product_type) 
from coffee_sales;

select product_id,product_category, product_type, product_detail
from coffee_sales
where unit_price >5 ;

select product_category, 
product_type, max(unit_price) as max_price
from coffee_sales
group by product_category, product_type
order by max_price desc
limit 10;

select * from coffee_sales
order by str_to_date(transaction_date, '%d-%m-%Y') desc
limit 5;


select product_category, 
product_type, 
sum(unit_price*transaction_qty) as total_sales
 from coffee_sales
 group by product_category, product_type
 order by total_sales desc
 limit 10;

select count(transaction_id) 
from coffee_sales;

select sum(unit_price*transaction_qty) as sales ,product_category 
 from coffee_sales;
 
 select sum(transaction_qty),store_location
 from coffee_sales
 group by store_location;

select product_category,round(avg(unit_price),3)
from coffee_sales
group by product_category;

select round(sum(unit_price*transaction_qty),3) as total_sales,
store_location
from coffee_sales
group by store_location;

select count(transaction_id) as total_transactions ,
transaction_date
from coffee_sales
group by transaction_date;

select 
  date_format(str_to_date(transaction_date, '%d-%m-%Y'), '%Y-%m') as transaction_month,
  count(transaction_id) AS total_transactions
from coffee_sales
group by transaction_month
order by transaction_month;

select round(avg(transaction_qty),3) as qty_sold,
product_category
from coffee_sales
group by product_category;

select sum(transaction_qty) as units_sold,
 product_type
from coffee_sales
group by product_type
order by units_sold desc
limit 10;

select round(sum(unit_price),3) as sales, 
product_type 
from coffee_sales
group by product_type;

select transaction_id,
str_to_date(transaction_date,'%d-%m-%Y') as full_date,
year(str_to_date(transaction_date, '%d-%m-%y')) as tr_year,
month(str_to_date(transaction_date,'%d-%m-%y')) as ty_month
from coffee_sales
limit 10;

/*/ Count transactions by month./*/ 

select 
date_format(str_to_date(transaction_date, '%d-%m-%y'), '%Y-%m') as tr_month,
count(transaction_id) as total_transactions
from coffee_sales
group by tr_month
order by tr_month;

/*/Get total revenue per day. /*/
select round(sum(unit_price*transaction_qty),3) as sales,
str_to_date(transaction_date,'%d-%m-%y') as tr_day
from coffee_sales
group by tr_day
order by tr_day;

/*/What hour of the day has the most transactions? /*/
select
  hour(str_to_date(transaction_time, '%H:%i:%s')) as tr_hour,
  count(transaction_id) as total_transactions
from coffee_sales
group by tr_hour
order by total_transactions desc
limit 1;

/*/List all unique product IDs along with their product type and category. /*/

select distinct(product_id) , product_type, product_category 
from coffee_sales;

/*/Join store_id with store_location and get number of transactions per store. /*/
select store_id, store_location,
count(transaction_id) as total_transactions
from coffee_sales
group by store_location, store_id;

/*/Find the product with the highest unit price. /*/
select  product_category,product_type,
max(unit_price) as highest_unit_price
from coffee_sales
group by  product_category,product_type
order by highest_unit_price desc
limit 1;

/*/Find the day with the highest sales revenue. /*/
select 