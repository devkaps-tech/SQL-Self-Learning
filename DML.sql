# DML 
# Modify and manipulate data 

INSERT into customers (id, first_name, country, score) 
VALUES (6, 'Anna', 'USA', NULL), (7, 'Sam' , NULL , 100);


insert into customers (id, first_name)
values (19, 'Sahra');


# Insert data from customers into persons table
Select * 
from customers; 

insert into persons(id, person_name, birth_date, phone)
select id, first_name, NULL,'Unknown'
from customers;

# Update 
# CHnage the score of customer 6 to 0 
update customers
Set score = 0 
where id=6;

# Change score of customer with ID 10 to 0 and updatecountry to UK 
update customers
set score = 0,country='UK'
where id=19;

# Delete 
# Delete all customers with id greater than 5
delete from customers
where id>5;

# Delete all data from persons table
truncate table persons