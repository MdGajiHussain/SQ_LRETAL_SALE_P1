create database project;
use project;

drop database project;
select*from sale
limit 10;



select *from sale
where
transactions_id is null
or
sale_date is null
or
sale_time is null
or
gender is null
or
category is null
or
quantiy is null
or
cogs is null
or 
total_sale is null;

-- DATA CLEANING

delete from sale
where
transactions_id is null
or
sale_date is null
or
sale_time is null
or
gender is null
or
category is null
or
quantiy is null
or
cogs is null
or 
total_sale is null;

-- DATA EXPLORATION

-- how many sales we having?

select count(*) as total_sale from sale;


-- how many customer we have?

select count(distinct category) as total_sale 
from sale;

select distinct category from sale;

-- data analysis & business key problems & anseres

-- Q.1 write a sql query to retrieve all for sales made on ,2022-11-05

select*
from sale
where sale_date ='2022-11-05';

-- Q.2 write a sql query to retrieve all transaction where
-- the category is clothing and the quentity sold is more than 4 in the month of nov -2022:
select*
from sale
where
category="clothing"
and
date_fromat(sale_date, '%Y-%M')="2022-11"
and 
quanty>=4;

select date_format(sate_date,"%D-%M-%Y") 
from sale;
select sale_date from sale
where category="clothing" 
or
sale_date="2022-11-05" 
and
quantiy>=4;

-- Q.3 write a sql query to calculate the total sales (total_sale) for each category
select category,
   sum(total_sale) as net_sale,
   count(*) as total_orders
from sale
group by category;

-- Q.4 write a sql query to find the average age of customers who purchased items frome the 'beauty' category
select avg(age) from sale
where category="beauty";

-- Q.5 write a sql query to find all teansactions where the total_sale is greate then 1000
select* from sale
where total_sale>1000;

-- Q.6 write a sql query to find the total number of transaction (transactions_id) made by each gender in each category
select category, gender,count(transactions_id)  from sale
group by category,gender
order by gender asc;

-- Q.7 write a sql query to calculate the average sale for each month find out best selling  month in each year
select
extract(year from sale_date),
extract(month from sale_date),
avg(total_sale)
from sale
group by 1,2
order  by 1,2;


-- Q.8 write a sql query to find the top 5 customers (customers_id) based on the highest total sales
select 
customer_id,
sum(total_sale) from sale
group by 1
order by 2 desc
limit 5;

-- Q.9 :- write a sql query to find the number of unique customers who perchased items from each category
select category ,
count( distinct customer_id) as unique_cs
from sale
group by category;

-- Q.10:- write a sql query to create each shift and number of orders (eg:- morning <<12 Afternoon between 12& 17, Evening >17)
select*,
CASE
when extract(hour from sale_time) < 12 then "morning"
when extract(hour from sale_time) between 12 and 17 then "Afternoon"
else "Evening"
end as shift
from sale
--  end of project









