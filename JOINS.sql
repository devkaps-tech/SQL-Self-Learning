# JOINS 
# If joining tables using columns we use JOINS 
# If joining tables using rows we use SET operators 

# We have 4 types of main JOINS - Inner, Full, Left and Right
# We have 3 types of main Set operators - Union, Union All, Except(minus), Intersect

# Requirement for Joins is key column 
# Requirement for Set is same columns for tables

# Reasons for Joining tables - To recombine data, for Data Enrichmenet and for checking exsisting 

# INNER JOIN - Only matching rows from both Tables , orientation of tables don't matter
# Get all customers along with their order, but only for customers who placed an order
select id, first_name, order_id,sales 
from customers
INNER JOIN orders
ON customers.id = orders.customer_id;

# INNER can be used to recombine the data or checking the data 

# LEFT Join - syntax matter - Left table will be in FROM clause
# Get all customers along with their order including those without orders. 
select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date 
from customers as c
LEFT JOIN orders as o
ON c.id = o.customer_id;

# Left JOIN can be used for recombiing data and can be used to get extra info form other table 

# RIGHT JOIN - syntax matters - Right table with the main source of the data - syntax will be same as left join
# Get all customers along with their orders incuding orders without matching customers
select o.order_id,c.first_name,o.order_date 
from customers as c
RIGHT JOIN orders as o
ON o.customer_id = c.id ;

# Perform the samw query of RIGHT JOIN using LEFT JOIN - Just reverse the tables order in syntax
select o.order_id,c.first_name,o.order_date 
from orders as o
LEFT JOIN customers as c
ON o.customer_id = c.id ;

# FULL JOIN - returns everything - order of tables are not important
# get all customers and orders, even if there's no match 
# MySQL doesn't have FULL JOIN syntax 
# Full join can be helpful for recombining data and checking existence

# LEFT ANTI Join - returns row form left table that has no match in right table -> (A)- intersection(A and B)
# Get all customers who haven't placed any order 
select * 
from customers as c 
LEFT JOIN orders as o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL;

# LEft anto can only be used for checking existence of data 

# RIGHT ANTI JOIN - returns row from right table with no match from left table -> (B) - intersection(A and B)
# Get all orders not ordered by customers 
select * 
from orders as o 
LEFT JOIN customers as c 
ON c.id = o.customer_id
WHERE c.id IS NULL;

# FULL ANTI JOIN - Only unmatching rows -> (A union B) - (A intersection B) 
# mysql doesn't have dedicated syntax for this - can be carried out by (LEFT ANTI) UNION (RIGHT ANTI)
# can be used for checking exisitence of data in another table
select * 
from customers as c 
LEFT JOIN orders as o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL
UNION 
select * 
from customers as c 
right JOIN orders as o 
ON c.id = o.customer_id
WHERE c.id IS NULL;

# Get all customers along with their orders, but only for customers who have placed an order 
select * 
from customers as c 
LEFT JOIN orders as o
ON c.id = o.customer_id 
WHERE o.customer_id IS NOT NULL;

# How to choose between JOINS 
# IF looking for matching data - INNER 
# Lokking for all rows - One side (LEFT) , both sides (FULL)
# Only unmatching data - One side(LEFT ANTI), both sides (FULL ANTI) 

# Using SalesDB, retireve a list of all orders, along with the related customer, product and employee details

select * 
from orders;

select * 
from customers;

select * 
from products;

select * 
from employees;

select o.orderid, o.sales, c.firstname, c.lastname, p.product as ProductName, p.price, e.firstname as employee_firstname , e.lastname as employee_lastname
from orders as o
LEFT JOIN customers as c
ON o.customerid = c.customerid 
LEFT JOIN products as p
ON o.productid = p.productid
LEFT JOIN employees as e 
ON o.salespersonid = e.employeeid;


