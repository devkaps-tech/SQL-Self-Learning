# USE MyDatabase -> Select Database before writing query 
select * 
from customers
order by country ASC, score DESC;
# Nested order by helps when the first sort has duplication 


# groupby comes between where and orderby clause 
# aggregates a col by another col 
select country, sum(score) AS total_score
from customers 
group by country;
# all the columns in the select mist be either aggregated or included in groupby - only aggregation and part of groupby


# FInd total score and total number of customers for each country 
select country, sum(score) , COUNT(id) 
from customers 
group by country;

# Having filters the data after the aggregation is perfomred. it can be used only with groupby
# if u want filter the data before aggregation use where , if u want to filter after aggregation use having 

# Find avg score for each country considering only customers with score not equal to 0 and return only those country with avg score greater than 430 
select country, avg(score)
from customers 
where score != 0 
group by country 
having avg(score) > 430;

# DISTINCT - removes duplicates in the data. 
select distinct country 
from customers;
# dont use distinct unless it is necessary

# TOP (Limit) restrict no of rows returned
select *
from customers
limit 3;

# Retrieve top 3 customers with highest scores 
select * 
from customers
order by score DESC
limit 3;

# get the 2 most recent orders
select * 
from orders 
order by order_date DESC
limit 2;

select 123 as static_number;
select 'hello' as static_string;

select id, first_name, 
'New Customer' AS customer_type
from customers;
