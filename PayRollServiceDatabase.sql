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
Insert into employee_payroll Values('Snehu',1000000.00,'2021-05-20','F'),('Lata',150000.00,'2021-04-01','M'),('Raju',2000000.00,'2018-05-06','M');

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

select Name,Gender ,Salary from employee_payroll where Salary =(select max(salary)As maxsalary from employee_payroll where gender ='M')
select Name,Gender ,Salary from employee_payroll where Salary In(select max(salary)As maxsalary from employee_payroll where gender ='M')

--Display
Select * From employee_payroll
-------------------------------------------------------------------------------------------------------

--Uc8 Extent table add Employee phone number, address,and depertment and add data
ALTER TABLE employee_payroll ADD AddressOfEmp VARCHAR(50);
ALTER TABLE employee_payroll ADD PhoneNumber VARCHAR(10);
ALTER TABLE employee_payroll ADD Depertment VARCHAR(10) NOT NULL Default 'HR';

INSERT INTO employee_payroll(Name,Salary,Start,Gender,AddressOfEmp,PhoneNumber,Depertment)VALUES('Rahul',1200000.00,'2021-01-01','M','Plot 23','1234567890','HR'),
('Sonali',200000.00,'2021-05-01','F','Plot 3','1237567890','Mechanical');
UPDATE employee_payroll SET Depertment='Manager' WHERE Name = 'Snehal';
UPDATE employee_payroll SET  Depertment ='Software' WHERE Name = 'Mayur' or Name = 'Vaibhav';
UPDATE employee_payroll set AddressOfEmp ='plot no12',PhoneNumber = '43534545' where Name='Snehal';
--Display
Select * From employee_payroll

--Uc9 Extend table to have basic pay, Deduction,Taxable pay,Income tax,Net pay
--ALTER TABLE employee_payroll CHANGE COLUMN Salary TO Basic_Pay;(USE IN MYSQL)
SP_RENAME 'employee_payroll.Salary' ,'Basic_Pay','COLUMN';
ALTER TABLE employee_payroll ADD Deductions BIGINT;
ALTER TABLE employee_payroll ADD Taxable_pay BIGINT;
ALTER TABLE employee_payroll ADD IncomE_tax BIGINT ;
ALTER TABLE employee_payroll ADD Net_pay BIGINT ;
UPDATE employee_payroll SET  Deductions = 0 WHERE Name = 'Mayur' or Name = 'Vaibhav' or Name ='Sonali' or Name = 'Rahul'or Name = 'Snehal';
UPDATE employee_payroll SET  Taxable_pay = 0 WHERE Name = 'Mayur' or Name = 'Vaibhav' or Name ='Sonali' or Name = 'Rahul'or Name = 'Snehal';
UPDATE employee_payroll SET  IncomE_tax = 0 WHERE Name = 'Mayur' or Name = 'Vaibhav' or Name ='Sonali' or Name = 'Rahul'or Name = 'Snehal';
UPDATE employee_payroll SET   Net_pay = 0 WHERE Name = 'Mayur' or Name = 'Vaibhav' or Name ='Sonali' or Name = 'Rahul'or Name = 'Snehal';

