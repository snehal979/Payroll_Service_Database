--Uc1 Create Database
Create database PayRoll_Service_Database

--Uc2 Create table
Create Table employee_payroll
(Id int identity(1,1) not null,
Name varchar(100) not null,
Salary float,
start date not null
)