--Uc1 Create Database
Create database PayRoll_Service_Database

--Uc2 Create table
Create Table employee_payroll
(Id int identity(1,1) not null,
Name varchar(100) not null,
Salary float,
start date not null
)

--Uc3 Insert Data
Insert into employee_payroll Values('Snehal',1000000.00,'2021-01-01'),('Mayur',1500000.00,'2020-04-01'),('Vaibhav',2000000.00,'2018-05-06');

--Uc4 Display
Select * From employee_payroll
Select * From employee_payroll where Id =1;
Select Name From employee_payroll where Id =1;

--Uc5 retrieve salary data for a particular employee
Select salary from employee_payroll where Name ='Snehal';
--employees who have joined in a particular data range
Select * from employee_payroll where start between cast('2019-01-01' as date) AND GETDATE();

--Uc6 add Gender to Employee Payroll Table
Alter Table employee_payroll add Gender char
--Update Gender Data
Update employee_payroll set Gender = 'F' Where Name = 'Snehal';
Update employee_payroll set Gender ='M' Where Name = 'Mayur' or Name = 'Vaibhav';

--Uc7 SUM, AVG, MIN, MAX, COUNT
--SUM
select sum(Salary) from employee_payroll where Gender ='M' group by Gender
select sum(Salary) from employee_payroll where Gender ='F' group by Gender
--AVG
select avg(Salary) from employee_payroll where Gender ='M' group by Gender
select avg(Salary) from employee_payroll where Gender ='F' group by Gender
--MIN
select min(Salary) from employee_payroll where Gender ='M' group by Gender
select min(Salary) from employee_payroll where Gender ='F' group by Gender

--MAX
select max(Salary) from employee_payroll where Gender ='M' group by Gender
select max(Salary) from employee_payroll where Gender ='F' group by Gender

--COUNT
select count(Name) from employee_payroll where Gender ='M' group by Gender
select count(Name) from employee_payroll where Gender ='F' group by Gender

