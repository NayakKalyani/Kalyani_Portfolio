CREATE DATABASE analysis;
USE analysis;
CREATE TABLE students(
s_id INT NOT NULL,
s_fname varchar(45) NOT NULL,
s_lname varchar(45) NOT NULL,
class varchar(45) NULL,
age INT NOT NULL,
PRIMARY KEY(s_id));
CREATE TABLE marksheet(
score INT NOT NULL,
year INT NOT NULL,
class varchar(45) NULL,
ranking varchar(45) NULL,
s_id INT NOT NULL);
INSERT INTO students(s_id, s_fname, s_lname, class, age)
VALUES
    ('01', 'Krishna', 'Gee', '10', '18'),
    ('02', 'Stephen', 'Christ', '10', '17'),
    ('03', 'Kailash', 'Kumar', '10', '18'),
    ('04', 'Ashish', 'Jain', '10', '16'),
    ('05', 'Khusbu', 'Jain', '10', '17'),
    ('06', 'Madhan', 'Lal', '10', '16'),
    ('07', 'Saurab', 'Kothari', '10', '15'),
    ('08', 'Vinesh', 'Roy', '10', '14'),
    ('09', 'Rishika', 'R', '10', '15'),
    ('10', 'Sara', 'Rayan', '10', '16'),
    ('11', 'Rosy', 'Kumar', '10', '16');
INSERT INTO marksheet(score, year, class, ranking, s_id)
VALUES
     ('989','2014','10','1','01'),
     ('454','2014','10','10','02'),
     ('880','2014','10','4','03'),
     ('870','2014','10','5','04'),
     ('720','2014','10','7','05'),
     ('670','2014','10','8','06'),
     ('900','2014','10','3','07'),
     ('540','2014','10','9','08'),
     ('801','2014','10','6','09'),
     ('420','2014','10','11','10'),
     ('970','2014','10','2','11'),
     ('720','2014','10','12','12');
SELECT s_id,s_fname FROM students WHERE s_lname='Kumar'AND age>=16;
SELECT* FROM marksheet WHERE score BETWEEN 800 AND 1000;
SELECT*, score+5 as new_score FROM marksheet;
SELECT* FROM marksheet ORDER BY score DESC;
SELECT* FROM students WHERE s_fname LIKE 'a%';

     
     


