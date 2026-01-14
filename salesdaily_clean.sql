COPY sales_daily
FROM PROGRAM '"C:\temp\salesdaily_clean.csv"'
DELIMITER ','
CSV HEAD

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'sales_daily';

ALTER TABLE sales_daily RENAME COLUMN n02b TO m01ab;
ALTER TABLE sales_daily RENAME COLUMN n03c TO m01ae;
ALTER TABLE sales_daily RENAME COLUMN n04a TO n02ba;
ALTER TABLE sales_daily RENAME COLUMN n05c TO n02be;
ALTER TABLE sales_daily RENAME COLUMN n06a TO n05b;
ALTER TABLE sales_daily RENAME COLUMN n07a TO n05c;
ALTER TABLE sales_daily RENAME COLUMN n08b TO r03;
ALTER TABLE sales_daily RENAME COLUMN n09a TO r06;



select*from sales_daily limit 5;
--how many total records in dataset
SELECT COUNT(*) FROM sales_daily;

--what is overall date range of the data?
select min(date) as earliest_date,
max(date) as latest_date
from sales_daily

--Which product has the highest total sales?
select product_code,total
from (select product_code,sum(qty) as total
from sales_daily 
cross join lateral (
values
('n02b',n02b),
('n03c',n03c),
('n04a',n04a),
('n05c',n05c),
('n06a',n06a),
('n07a',n07a),
('n08b',n08b),
('n09a',n09a)
)v(product_code,qty)
group by product_code)t
order by total desc
limit 1;

--Which product has the lowest total sales?
select product_code,total
from (select product_code,sum(qty) as total
from sales_daily 
cross join lateral (
values
('n02b',n02b),
('n03c',n03c),
('n04a',n04a),
('n05c',n05c),
('n06a',n06a),
('n07a',n07a),
('n08b',n08b),
('n09a',n09a)
)v(product_code,qty)
group by product_code)t
order by total
limit 1;

--On which weekday is total sales highest?
select weekday, sum(n02b+n03c+n04a+n05c+n06a+n07a+n08b+n09a) as total_sale
from sales_daily
group by weekday
order by total_sale desc
limit 1

--On which weekday is total sales lowest?
select weekday, sum(n02b+n03c+n04a+n05c+n06a+n07a+n08b+n09a) as total_sale
from sales_daily
group by weekday
order by total_sale
limit 1

--How does total sales change month by month?
select month,  sum(n02b+n03c+n04a+n05c+n06a+n07a+n08b+n09a) as total_sale
from sales_daily
group by month
order by month 

--Are sales evenly distributed across weekdays?
select weekday, round(sum(n02b+n03c+n04a+n05c+n06a+n07a+n08b+n09a)) as total_sale
from sales_daily
group by weekday
order by total_sale desc;

--Which product contributes the most to overall sales percentage?
select product_code,
round(100.0*total_sales/sum(total_sales) over ()) as percentage_contribution
from (select product_code,
sum(qty) as total_sales
from sales_daily 
cross join lateral (
values
('n02b',n02b),
('n03c',n03c),
('n04a',n04a),
('n05c',n05c),
('n06a',n06a),
('n07a',n07a),
('n08b',n08b),
('n09a',n09a)
)v(product_code,qty)
group by product_code)t
order by percentage_contribution desc;

--What is the average daily sales per product?
select product_code,avarage_sales
from (select product_code,avg(value) as avarage_sales
from sales_daily 
cross join lateral (
values
('n02b',n02b),
('n03c',n03c),
('n04a',n04a),
('n05c',n05c),
('n06a',n06a),
('n07a',n07a),
('n08b',n08b),
('n09a',n09a)
)v(product_code,value)
group by product_code)t
order by avarage_sales desc

