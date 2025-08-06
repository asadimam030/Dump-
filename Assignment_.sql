/*1. Create a table called employees with the following structure?
: emp_id (integer, should not be NULL and should be a primary key)Q
: emp_name (text, should not be NULL)Q
: age (integer, should have a check constraint to ensure the age is at least 18)Q
: email (text, should be unique for each employee)Q
: salary (decimal, with a default value of 30,000).

Write the SQL query to create the above table with all constraints.
*/

create table employees
	(
    emp_id int not null primary key,
    emp_name varchar (25) not null,
    age int check (age >= 18),
    email varchar (50) unique,
    salary decimal(10, 2) default 30000
    );


/*
2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
examples of common types of constraints.
*/

-- Ans 
/* constrain are rulews applied in database table to ensure accuracy, validity, and consistency of the data
they help maintain data integrity by prevwnting invalid data from being stored.

# Why constrain matters 
	1. prevent from invalid entries
    2. ensure uniqness
    3. maintain relationship b/w tables
    4. avoid missing required data
    
# common type of constrains 
	1. Primary key -  uniquely identifies each row, cant be null
		eg - emp_id int primary key 
        
    2. not null - ensure a column can't have null values or missing values
    eg - emp_name varchar(50) not null 
    
    3. unique - ensure all the values are diffrent
	eg - email varchar(50) unique
	
    4. check - ensure value meet a specific condition 
    eg - age check(age .= 18)
    
    5. default - sets a default value if no value is inserted
    alter
    price int default 30
    
    6. foreign key - link to primary key in another table to maintain refrential integrity
    dept_id int refrences 
    deparments(dept_id)
    
    
 create table employees
	(
    emp_id int not null primary key,
    emp_name varchar (25) not null,
    age int check (age >= 18),
    email varchar (50) unique,
    salary decimal(10, 2) default 30000
    );   
    */
    
    /*
3. Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
your answer.

-- Ans
not null is used to ensure that data in the column must not be null or empty 
No, primary key dosent cointain null values it uniquely identifies each row in the table 

    */
    
	/*
4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
example for both adding and removing a constraint.

-- Ans
# Adding constrain 
alter table employees
add constrain check_age check(age >= 18);


# removing constrain 
alter table emloyees
drop check check_age;   
    */
    
	/*
 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.   
    
-- Ans
    
    */
    
    /*
6. You created a products table without constraints as follows:

CREATE TABLE products (

product_id INT,

product_name VARCHAR(50),

price DECIMAL(10, 2));
Now, you realise that?
: The product_id should be a primary keyQ
: The price should have a default value of 50.00

-- Ans
alter table products 
add constrain pk_product_id primary key (product_id);

alter table products
modify price decimal(10,2) default 50.00;
    */
    
    /*
 7. Write a query to fetch the student_name and class_name for each student using an INNER JOIN
 
 -- Ans 
 select 
	students.student_name, 
    classes.class_name
from students
inner join calsses 
	on students.classes_id from classes.class_id = classes.classes.id
    
    */
    
    /*
8. Consider the following three tables:
Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
listed even if they are not associated with an order
Hint: (use INNER JOIN and LEFT JOIN)

select 
	orders.order_id,
    customers.customer_name,
    products.product_name
from products
	left join orders
		on products.order_id = orders.order_id
	and 
	left join customers
		on orders.cusutomer_id = customers.customer_id
    */
    
    /*
9.  Given the following tables:
Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

-- Ans


*/

/*
10.  You are given three tables:
Write a query to display the order_id, customer_name, and the quantity of products ordered by each
customer using an INNER JOIN between all three tables.


Note - The above-mentioned questions don't require any dataset.
    */