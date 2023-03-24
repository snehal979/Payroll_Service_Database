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
--Display
Select * From employee_payroll

--Uc10 Terissa Sale and Marketing Deperment 
INSERT INTO employee_payroll(Name,Basic_Pay,Start,Gender,AddressOfEmp,PhoneNumber,Depertment, Deductions,Taxable_pay,IncomE_tax, Net_pay)VALUES('Terisa',2200000.00,'2021-01-21','F','Plot 23','1234567890','Sale',10000,10000,0,200000);
INSERT INTO employee_payroll(Name,Basic_Pay,Start,Gender,AddressOfEmp,PhoneNumber,Depertment, Deductions,Taxable_pay,IncomE_tax, Net_pay)VALUES('Terisa',2200000.00,'2021-01-21','F','Plot 23','1234567890','Marketing',10000,10000,0,200000);
--Display
Select * From employee_payroll

-----Delect The Table----------------
drop Table employee_payroll



------------ER DAIGRAM--------------------

--UC 11 Create many the corresponding tables with attributes ,Entity,And relationship(join)
/*Key attribute – Uniquely Identified the Entity e.g. employee id
• Composite attribute – is a combination of other attributes e.g. employee address
• Multivalued attribute – hold multiple values like the phone number
• Derived attribute – value is dynamic and derived from another attribute e.g. net pay
COMPANY a.EMPLOYEE DEAILS(personal information) b.DEPERTAMENT DETAILS(id,depertmentid,section) c.SATARY DETAILS(basic pay, Deduction,Taxable pay,Income tax,Net pay)
*/
--1.Employee Table,
-- 2.Company Table, 
--3.Salary Table, 
--4.Department Table 

--1.EMPLOYEE TABLE
CREATE TABLE EmployeeDetail(
EmpId INT PRIMARY KEY IDENTITY(1,1),
EmpName VARCHAR(150) NOT NULL,
Address VARCHAR(100)NOT NULL,
Gender VARCHAR(10) NOT NULL,
Mobile VARCHAR(10) DEFAULT('1234567890')
);
------------Data insert----------------
INSERT INTO EmployeeDetail(EmpName,Address,Gender,Mobile)VALUES('Snehal','plotNo9','Female','9593573967');
INSERT INTO EmployeeDetail(EmpName,Address,Gender,Mobile)VALUES('Mayur','plotNo93','Male','9593573968');
INSERT INTO EmployeeDetail(EmpName,Address,Gender,Mobile)VALUES('Raju','plotNo6','Male','9593553967');
INSERT INTO EmployeeDetail(EmpName,Address,Gender,Mobile)VALUES('Lata','plotNo3','Female','8593573967');
INSERT INTO EmployeeDetail(EmpName,Address,Gender,Mobile)VALUES('Vaibhav','plotNo1','Male','7593573967');
---Display---
SELECT *FROM EmployeeDetail;

--Deperatment TABLE
CREATE TABLE DepertamentDetail(
DeptId INT PRIMARY KEY IDENTITY(10001,1),
DeptName VARCHAR(150) NOT NULL,
EmpId INT FOREIGN KEY REFERENCES EmployeeDetail(EmpId)
);
------------Data insert----------------
INSERT INTO DepertamentDetail VALUES('Manager', 1),('HR', 2),('Sale', 3),('Marketing', 4),('software',5);

-- Salary Table
CREATE TABLE Salary(
BasicPay BIGINT DEFAULT(000),
Deduction BIGINT DEFAULT(000),
Tax BIGINT DEFAULT(000),
EmpId INT FOREIGN KEY REFERENCES EmployeeDetail(EmpId),
NetPay Bigint 
);
INSERT INTO Salary (BasicPay,Deduction,Tax,EmpId) VALUES(10000000,2000,34333,1);
INSERT INTO Salary(BasicPay,Deduction,Tax,EmpId) VALUES(20000000,5000,3435,2);

INSERT INTO Salary(BasicPay,Deduction,Tax,EmpId) VALUES(1000000,4000,31333,3);

INSERT INTO Salary(BasicPay,Deduction,Tax,EmpId) VALUES(10000000,2000,34333,4);
UPDATE Salary SET NetPay = (BasicPay-Tax-Deduction);
SELECT *FROM Salary;
--MAIN COMPANY TABLE
CREATE TABLE CompanyTable(
CompId INT PRIMARY KEY IDENTITY(1,1),
EmpId INT FOREIGN KEY REFERENCES EmployeeDetail(EmpId),
DeptId INT FOREIGN KEY REFERENCES DepertamentDetail(DeptId),
Start DATE NOT NULL,
);
INSERT INTO CompanyTable VALUES(1,10001,'2020-03-01'),(2,10002,'2011-01-01'),(3,10003,'2015-01-01'),(4,10004,'2011-01-01'),(5,10005,'2018-01-01');
SELECT *FROM CompanyTable;
--DROP TABLE CompanyTable; --Delect table
--Join
SELECT * FROM CompanyTable AS A 
FULL OUTER JOIN EmployeeDetail AS B ON A.EmpId=B.EmpId; 
SELECT * FROM EmployeeDetail AS C
FULL OUTER JOIN DepertamentDetail AS D ON C.EmpId=D.EmpId; 

SELECT * FROM EmployeeDetail AS C
FULL OUTER JOIN Salary AS D ON C.EmpId=D.EmpId; 
