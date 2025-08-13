use ineuron;
## Creating a Table

create table Courses (Course_Id Varchar(10), Course_Name Varchar(40), Duration_In_Months int, Students_intake int, Faculty Varchar(20));
describe Courses;
# Altering the Table

Alter table Courses Change column Course_Name Course_Title Varchar(40); 
Describe Courses;
Alter table Courses add column Mode_of_Delivery Varchar(40); 
Alter table Courses Change column Mode_of_Delivery Delivery_Mode Varchar(40); 

## Data Insertion into the Table (One by One)
Insert into Courses 
values ("DA101","Data Analytics",6,100,"Saurabh","Live Sessions");
select * from Courses;

## Data Insertion into the Table (Multiple Rows)
Insert into Courses 
values ("DA102","Data Analytics 2.0",6,100,"Saurabh","Live Sessions"),("DS101","Data Science",11,150,"Mayank","Live Sessions");

# Data Insertion for selected Columns
Insert into Courses(Course_id,Duration_in_Months, Students_intake, Delivery_Mode)
values ("DA103",6,100,"Live Sessions");

# Providing Constraints to Columns
# Unique
Alter table Courses Change Column Course_id Course_ID Varchar(10) Unique;
Insert into Courses  
values ("DA102","Data Analytics 2.0",6,100,"Saurabh","Live Sessions");

#Not Null
Alter table Courses Change Column Duration_in_Months Duration_in_Months Varchar(10) Not Null;
Insert into Courses (Course_id,Course_Title, Students_intake, Faculty, Delivery_Mode)  
values ("DA102","Data Analytics 2.0",100,"Saurabh","Live Sessions");

# Check
Alter table Courses Change Column Students_intake Students_Intake Varchar(10) Check (Students_Intake >= 50);
Insert into Courses  
values ("ML101","Machine_Learning",11,50,"Saurabh","Live Sessions");

# Default
Alter table Courses Change Column Students_Intake Students_Intake int default 50;
Insert into Courses (Course_id,Course_Title, Duration_in_Months,Faculty, Delivery_Mode)
values ("ML102","Machine_Learning 2.0",11,"Dipti","Live Sessions");
Select * from Courses;

Describe Courses;
# Primary Key
Alter table Courses Change Column Course_ID Course_ID varchar(40) Primary Key;


# Changing the data in Selected Row/s
update Courses set Course_title = "Data Analytics FS" where Course_Id = "DA103";
update Courses set Faculty = "Sunny" where Course_Id = "DA103";

# Managing Data Output
# Limit
Select * from employees
limit 10;

# Limit + Offset
Select * from employees
limit 10
Offset 5;

use world;
select * from country
limit 5;

select * from Country
limit 20 offset 150;






# Ordering the data output--------
	# One Column

select * from country
order by Population;

select * from country
order by Population desc;

    ## Multiple Columns

select Code,Name,Continent from country
order by continent;

select Code,Name,Continent from country
order by continent, Name desc;  

select Name, Population from country
order by Population limit 1 offset 76;    

select * from country
order by indepyear desc limit 1;

## DATA FILTERING ---------------------------------
# Where Operator
	
Select * from Country
where continent = "Asia";

Select * from Country 
where Region = "Middle East";

select * from Country
where IndepYear = 1971;    
    
Select * from Country 
where Region = "Middle East"
order by Name;
 

# Relational Operators (>,<,=,>=,<=,<>)
	# Numeric Values
select Name,Continent,IndepYear from Country
where IndepYear > 1971;

select Name,Continent,IndepYear from Country
where IndepYear >= 1971 order by IndepYear desc;

Select Name, Region, Population, GNP, LifeExpectancy, IndepYear from Country
where lifeexpectancy <= 60
order by lifeexpectancy
limit 10;

Select Name, Continent,Region, Population, GNP, LifeExpectancy, IndepYear from Country
where continent <> "Asia"
order by Continent;

    ## textual Values

select * from country
where Name < "India"
order by Name;


# Logical Operators
	# And
select * from Country 
where continent = "Europe" and GNP > 1000000;

   # Or
   
select * from Country 
where continent = "Europe" or GNP > 100000
order by Continent;

    # Not
    
select * from Country 
where not continent = "Europe";

select * from Country
where not continent = "Europe" or not GNP > 1000000
order by Continent;



# Like, IN and Between Operators
	# In
select Name,GNP, Population,Continent from Country 
where continent in ("North America","Asia","Europe")
order by Continent;

select Name,GNP, Population,Continent from Country 
where continent not in ("North America","Asia","Europe")
order by Continent;

	# Between
select Name, Lifeexpectancy, Population,Continent from Country 
where Lifeexpectancy between 70 and 80
order by lifeexpectancy;

select Name, Lifeexpectancy, Population,Continent from Country 
where Name between "China" and "India"
order by lifeexpectancy;

select Name,LifeExpectancy from country
where LifeExpectancy between 70 and 80
and Name between "China" and "India";


select Name,LifeExpectancy,Population Continent from Country
where Name between "China" and "India" and  LifeExpectancy between 70 and 80
order by LifeExpectancy;

    # Like
use world;
select * from Country;

# All countries where the name starts with 'A'.
select * from country
where Name like '____A';

## % ---> any number of charecters
## _ ---> fixed number of charecters
## Space ----> Individualise the phrase.
use orders;
select * from product
where product_desc like "Samsung%";

select * from product
where product_desc like "%Samsung%";

select * from Product
where product_desc like "% Tab %";

select * from product
where product_desc like "% Samsung %";

use world;
select * from country
where Name like "%_____A"; 
## A would mean ending with a.
## __ - Exactly 2 charecters
## % - any number of charecters

## "%___A" ---> Means text ending with atleast 4 chatrecters ending with A
## "__A%" ---> Means text starting with atleast 3 charecters and 3rd letter being A
## "__A__%" ---> Means text starting with at least 5 charecters and 3rd letter to be A.

select * from country
where Name like "____A%"; 

select * from country
where Name like "__A__%"; 

# Aliases
# Aliases for columns
select Name, lifeexpectancy as LE from country;

select Name, Continent, SurfaceArea as SA, LifeExpectancy as LE, IndepYear as IY from Country;

# Aliases for Expression
select Name, Continent, GNP, Population, (GNP * 1000000)/Population as GNP_Per_CAP  from Country
order by GNP_per_cap desc;

select * from country;

# Build in Functions in SQL
	## Aggregate Functions
## Sum /Average/ Max/ Min/ Count/ Count distinct

select sum(SurfaceArea)/1000000 as Total_Sur_Area from country;
## Country with highest life expectancy---

select min(lifeexpectancy) as Min_LE from country;

select avg(SurfaceArea)/1000000 as Avg_Sur_Area from country;

select count(distinct Continent) as total_continents from country;

select count(distinct Name) as total_countries from country;

	# Group by Operator
select continent, sum(Population)/1000000 as Pop_in_mn from country
group by continent;

select continent, count(distinct Region) as total_regions,sum(Population)/1000000 as Pop_country from country
group by continent;

select continent, avg(Population) as Ave_Pop from country
group by continent
order by Ave_pop desc;

select Region, Continent, Sum(Surfacearea) as TSA from Country
group by Region,Continent;

    # Having
use world;
select * from country;
select Region, Continent, sum(surfacearea) as No_of_Countries from Country
group by Region
having No_of_Countries > 10
order by No_of_countries desc;

####    set global sql_mode = (select replace(@sql_mode,'only_full_group_by',"'"));

## Write a query to find the name of the country with the highest population.

select continent, sum(Population) as Pop from country
group by continent
order by Pop desc
limit 1;

create database sakila2;
drop database sakila2;


use sakila;
select * from customer;    
## String Functions
    # Concat -  Joins two or more strings

select *, concat(first_name,last_name) as Full_Name from actor;
select *, concat(first_name," ", last_name) as Full_Name from actor;

select * from complete_add;
select address,district, concat(address," ,",district) as Full_address from complete_add;

    # Upper/Lower
select * from actor;
select * from complete_add;
select * from category;
select * from customer;
select * from film;

select Email, lower(email), upper(email) from customer;
	# Length
select film_id,title,length(title) from film;
select film_id,title,description,length(description) as Des_Length from film
where length(description) > 100
order by des_length desc;

    # Substring
select * from customer;
select first_name,last_name, substring(first_name,1,2) as first_two_cha from customer;
select first_name,last_name, substring(first_name,3,2) as last_two_char from customer;

select first_name, last_name, substring(first_name,-2,2) from customer;
select first_name, last_name, substring(first_name,length(first_name)-1,2) from customer;
    
    # Replace - 
select first_name,last_name, active, replace(active,1,"Yes") as Customer_status from customer;
select first_name,last_name, active, replace(active,0,"No") as Customer_status from customer;

    # Trim - Removes whitespaces from left and right of the text.
select * from complete_add;
update complete_add
set district = concat(" ",district," ")
where address_id = 56;
select district, length(district) from complete_add
limit 1;

select district, trim(district) from complete_add;

select * from complete_add;

set sql_safe_updates = 0;

    # Left/Right
select trim(first_name),left(first_name,2),right(first_name,2) from customer;

update complete_add
set district = trim(district)
where address_id = 56;
    
    
    ## Date and Time Functions
select * from actor;
select * from complete_add;
select * from category;
select * from customer;
select * from film;
select * from payment; 
select * from rental;   
    # Current Date
select current_date();

    # Current time
select current_time();

    # Now/Current_timestamp
select current_timestamp();

    # Date
select date(return_date) from rental;
    # Time
select time(return_date) from rental;
    # Year
select *,year(rental_date) as Rental_year from rental;
    # Month
select *,month(rental_date) as Rental_month from rental;
    # Day
select *,day(rental_date) as Rental_year from rental;
    # Dayname
select *,dayname(rental_date) as Rental_day from rental;
    
    # Dateadd
select *, date_add(rental_date, interval 1 week) as Target_return_date from rental;

    # Datesub
select *, date_sub(rental_date, interval 1 week) as Target_return_date from rental;

	# Datediff
select rental_date,return_date, datediff(return_date,rental_date) as Rent_duration,
date_add(rental_date, interval 1 week) as Target_return_date from rental;

select customer_id,rental_date,return_date, datediff(return_date,rental_date) as Rent_duration from rental
having Rent_duration > 7;

select customer_id, rental_date, return_date, datediff(return_date, rental_date) as Rent_Duration 
from rental
where datediff(return_date, rental_date) > 7;

    
    ## Numeric Functions
    # Abs
    # Round
    # Ceiling/Floor
    # Sqrt
    # Power
    # Rand
    # Mod
    # Sign
    # Truncate
    # Log 
    # exp
    
    
    ## Conditional Functions
    # If
    # Case When Operator
    # Coalesce
    # Nullif
    # ifnull
    
    ## Window Functions
    # Rownumber
    # Rank
    # Dense Rank
    # Ntile
    # Lang and Lead
    # Sum()over()
    # Avg()over()
    

# Joins in SQL
	## Inner Join
    ## Outer Join
    ## Left Outer
    ## Right Outer

# Subqueries
	## Use Cases of Subqueries
    
    
# Data base Objects

