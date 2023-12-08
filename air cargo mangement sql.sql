create database aircargo;
use aircargo;
show tables;
-- create table ticket details
Create table ticket_detail(
p_date DATE,
customer_id int not null,
class_id varchar(100) not null,
no_of_ticket int not null,
aircraft_id varchar(100) not null,
a_code varchar (25) not null,
price_per_ticket int not null,
brand varchar(100) not null);
 -- create table customer_id
 create table passenger_on_flights(
 customer_id int not null primary key,
 aircraft_id varchar(100) not null,
 depart varchar(100) not null,
 route_id int not null,
 arrival varchar(100) not null,
 seat_num varchar(100) not null,
 class_id varchar(100) not null,
 travel_date DATE,
 flight_num int not null);
 
 create table customer(
 customer_id int not null,
 first_name varchar(50) not null,
 last_name varchar(50) not null,
 date_of_birth Date,
 gender varchar(25));
 
 
-- create table route details
Create table routes_details(
route_id int not null primary key,
flight_num int not null,
origin_airport varchar(3) not null,
detination_airport varchar(100) not null,
aircraft_id varchar(100) not null,
distance_miles int not null,
constraint flight_number_check check((substr(flight_num,1,2) = 11)),
constraint routes_chk_1 check ((distance_miles > 0)) );
select * from ticket_detail;
 -- query to display all the passengers who have travelled on routes 01 to 25
 Select * from passenger_on_flights WHERE route_id between 1 and 25;
 select * from passenger_on_flights;
 
 -- identify the total numbers of passengers and total revenue in business class from the ticket detail
Select Count(customer) AS 'NO. OF PASSENGER' , sum(price_per_ticket) AS REVENUE from ticket_detail Where class_id='Bussiness' ;

-- display the full name of the customer by extracting the first name and last name from the customer table
Select customer_id, concat (first_name,last_name) AS "Full Name", date_of_birth, gender from customer;

-- extract the customer who have registered and booked a ticket 
   SELECT 
    customer_id,
    CONCAT(first_name, ' ', last_name) AS Name,
    COUNT(customer) AS total_tickets_booked
FROM
    customer
        JOIN
    ticket_detail ON customer_id = customer
GROUP BY customer_id , Name;

-- identify the customer's first name and last name based on their customer_id and brand = Emirates
select first_name, last_name,customer_id, brand from customer
join ticket_detail on  customer_id = customer_id where brand ="Emirates" 
Group by customer_id, first_name,last_name,brand;

-- identify whether the customers who have traveled by Economy Plus Class using Group by and Having clause
Select * from passenger_on_flights group by customer_id
having class_id = "Economy Plus";

-- identify whether the revenue has crossed 1000 using the IF Clause on the ticket detail table
select * from ticket_detail;
select if(sum(no_of_ticket*price_per_ticket) > 1000,'Revenue Crossed 1000', 'Revenue less than 1000') as Revenue_Status from ticket_detail;

-- create and grant access to a new user to perform operations on a database 
create user 'NEW' @'localhost' Identified by 'password';
Grant all privileges on *.* to 'NEW'@'localhost' with GRANT option;

-- find the maximum ticket price for each class using window functions on the ticket detail table
select distinct class_id , max(price_per_ticket) over (partition by class_id) as max_class_price
from ticket_detail; 

-- calculate the total price of all tickets booked by a customer across different aircraft IDs using
select customer, aircraft_id, 
sum(price_per_ticket) as total_price from ticket_detail
group by  customer, aircraft_id ;

-- with rollup function
select customer, aircraft_id, 
sum(price_per_ticket) as total_price from ticket_detail
group by  customer, aircraft_id with rollup ;

-- query to create a view with only business class customers along with brand name
select first_name, last_name, class_id,brand from customer
join ticket_detail on  customer_id = customer_id  where class_id = "Bussiness"
Group by first_name,last_name,class_id, brand; 

select * from routes_details;
-- details from the routes_details table where the travelled distance is more than 2000 miles
select * from routes_details where distance_miles > 2000;

-- a query to create a stored procedure that groups the distance traveled by each flight into three categories. The categories are, short distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for >6500.
SELECT
    aircraft_id,
    CASE
        WHEN distance_miles >= 0 AND distance_miles <= 2000 THEN 'SDT'
        WHEN distance_miles > 2000 AND distance_miles <= 6500 THEN 'IDT'
        WHEN distance_miles > 6500 THEN 'LDT'
    END AS DistanceCategory,
    distance_miles
FROM
    routes_details;

-- query to extract ticket purchase date, customer id, and class id and specify if the complimentary services are provided on the ticket_details table
SELECT 
    p_date, customer, class_id
FROM
    ticket_detail
GROUP BY p_date , customer , class_id;







 
 
 
 
 
 