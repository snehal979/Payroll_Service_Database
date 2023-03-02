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