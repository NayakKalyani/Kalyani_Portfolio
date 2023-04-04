CREATE DATABASE Report;
use Report;
CREATE TABLE patients(
date DATE NOT NULL,
p_id varchar(45) NOT NULL,
P_name varchar (45) NOT NULL,
age INT NOT NULL,
weight INT NOT NULL,
gender varchar(45) NOT NULL,
location varchar(45) NOT NULL,
p_no INT NOT NULL,
disease varchar(45) NOT NULL,
doctor_name varchar(45) NOT NULL,
doctor_id INT NOT NULL,
PRIMARY KEY (p_id));
INSERT INTO patients(date, p_id, P_name, age, weight, gender, location, p_no, disease, doctor_name, doctor_id)
VALUES
    ('2019-06-15','AP2021','Sarath','67','76', 'Male','Chennai','5462829','Cardiac','Dr. Mohan','21'),
    ('2019-02-13','AP2022','John','62','80','Male','Bangalore','1234731','Cancer','Dr.Suraj','22'),
    ('2018-01-08','AP2023','Henry','43','65','Male','Kerala','9028320','Asthma','Dr.Karthik','24'),
    ('2020-02-04','AP2024','Carl','56','72','Female','Mumbai','9293829','Asthma','Dr.Karthik','24'),
    ('2017-09-15','AP2025','Shikar','55','71','Male','Delhi','7821281','Cardiac','Dr. Mohan','21'),
    ('2018-07-22','AP2026','Piysuh','47','59','Male','Haryana','8912819','Cancer','Dr. Suraj','22'),
    ('2017-03-25','AP2027','Stephen','69','55','Male','Gujarat','8888211','Liver','Dr. Mehta','23'),
    ('2019-04-22','AP2028','Aaron','75','53','Male','Banglore','9012192','Asthma','Karthik','24');
SELECT COUNT(*) AS total_patients FROM patients;
SELECT p_id, p_name, gender, disease, MAX(age) AS MAX_AGE  FROM patients GROUP BY p_id, p_name, gender, disease;
SELECT p_id,p_name,NOW() as CurrentDate FROM patients;
SELECT doctor_name,UCASE(doctor_name) AS UpperCase_name FROM patients;
SELECT p_name, length(p_name) as Lengthof_p_name FROM patients;
SELECT p_name,MID(gender,1,1) AS GENDER FROM patients;
SELECT p_name,doctor_name,CONCAT(p_name,doctor_name) AS patient_doctor_name FROM patients;
SELECT age,LOG10(age) as LOG_AGE FROM patients;
SELECT *,YEAR(date) AS Year FROM patients;
SELECT NULLIF(p_name,doctor_name) FROM patients;
SELECT age,IF(age>40,'Yes','No') AS Agegreater40 FROM patients;
SELECT doctor_name,COUNT(*) occurences FROM patients GROUP BY doctor_name HAVING COUNT(*)>1;












    
