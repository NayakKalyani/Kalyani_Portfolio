CREATE DATABASE sqlbasic;
USE sqlbasic;
CREATE TABLE product(
p_code varchar(45) NOT NULL,
p_name varchar(45) NOT NULL,
stock varchar(45) NOT NULL,
price INT NOT NULL,
category varchar(45) NOT NULL,
PRIMARY KEY(p_code)); 
CREATE TABLE customer(
c_id varchar(45) NOT NULL,
c_name varchar(45) NOT NULL,
c_location varchar(45) NOT NULL,
c_phoneno int NOT NULL,
PRIMARY KEY(c_id));
CREATE TABLE sales(
order_date DATE NOT NULL,
order_no varchar(45) NOT NULL,
c_id varchar(45) NOT NULL,
c_name varchar(45) NOT NULL,
p_code varchar(45) NOT NULL,
p_name varchar(45) NOT NULL,
qty INT NOT NULL,
price INT NOT NULL,
primary key(order_date));
INSERT INTO product(p_code,p_name,stock,price,category)VALUES('07','shampoo','90','5','hair product');
INSERT INTO customer(c_id,c_name,c_location,c_phoneno)VALUES('9212','Jessica','banglore','1233435');
INSERT INTO sales(order_date,order_no,c_id,c_name,p_code,p_name,qty,price)VALUES('2021-02-12','HM02','2123','Biyush','03','Pen','2','20');
ALTER TABLE sales ADD (sl_no INT,categories varchar(45));
ALTER TABLE product MODIFY stock varchar(45);
ALTER TABLE customer RENAME customerdetails;
ALTER TABLE sales DROP COLUMN sl_no;
ALTER TABLE sales DROP COLUMN categories;
SELECT order_date,order_no,c_id,qty,price FROM sales;
SELECT* FROM product WHERE category-"hair product";
SELECT DISTINCT (category) FROM product;
SELECT * FROM sales WHERE qty>2 AND price < 500;
SELECT c_name FROM customerdetails WHERE c_name LIKE '/%a';
SELECT * FROM product ORDER BY price DESC ;
SELECT p_code,category FROM product GROUP BY category HAVING COUNT(category)>=2;
SELECT order_no,c_name FROM sales LEFT JOIN product ON 
sales.s_code = product.p_code
UNION ALL 
SELECT order_no,c_name FROM sales RIGHT JOIN product ON 
sales.s_code = product.p_code









 

