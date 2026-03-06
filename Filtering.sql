# Filtering in WHERE clause

# Retrieve all customers from Germany
select * 
from customers
where country = 'Germany';

# Retrieve all customers who are not from Germany 
select * 
from customers
where country != 'Germany';

# Logical operators - AND, OR 
# AND - all conditions must be true - very restrictive
# OR - any one condition is true
# NOT - negation - only one condition required

# retrieve customers who from USA and have score greater than 500
select * 
from customers
where country = 'USA' and score > 500;

# retrieve customers who from USA or have score greater than 500
select * 
from customers
where country = 'USA' or score > 500;

# retrieve all customers with a score not less than 500 
select * 
from customers
where NOT score < 500;

# Range operator - BETWEEN - if a vlaue falls within a specific range 
# lower and upper boundary are inclusive

# retrieve all customers whose score falls in range between 100 and 500
select * 
from customers
where score BETWEEN 100 and 500;

# Membership operator - IN, NOT IN 
# IN - IF a value exists in a list
# NOT IN - Negation of IN 

# retrieve all custmers from either Germany or USA
select *
from customers
where country IN ('Germany', 'USA');
# Use IN instead of OR for multiple values in same column to simplify SQL 

# Search Operator - LIKE 
# LIKE - Searches for a pattern in text 
# % mean anything (pattern found none, once or many times)
# _ mean pattern found exactly once

# find all customers whose first name starts with M 
select * 
from customers 
where first_name LIKE 'M%'; 

# find all customers whose first name ends with N 
select * 
from customers 
where first_name LIKE '%n';

# find all customers whsoe first name contains r 
select * 
from customers 
where first_name LIKE '%r%';

# find all customers whose first name has 'r' in 3rd position 
select * 
from customers 
where first_name LIKE '__r%';