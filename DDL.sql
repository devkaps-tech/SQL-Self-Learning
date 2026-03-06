# DDL 

# create new table called persons with columns: id, person_name, birth_date and phone

create table persons (
id int NOT NULL, 
person_name VARCHAR(50) NOT NULL, 
birth_date DATE,
phone VARCHAR(15) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY(id)
)

select * 
from persons;

# Add a ew column email 
ALTER TABLE persons 
ADD email VARCHAR(50) NOT NULL; 
# adding cols will always be appended at the end 

# Remove phone from table
ALTER TABLE persons
DROP COLUMN phone;

# Delete the table persons
DROP TABLE persons;

