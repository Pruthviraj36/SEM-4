CREATE DATABASE CSE_4A_121
USE CSE_4A_121
USE DYNAMO


-- Create Department Table 

CREATE TABLE Department ( 
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

delete from Department

-- Create Designation Table 
CREATE TABLE Designation ( 
DesignationID INT PRIMARY KEY, 
DesignationName VARCHAR(100) NOT NULL UNIQUE 
); 

-- Create Person Table 
CREATE TABLE Person ( 
PersonID INT PRIMARY KEY IDENTITY(101,1), 
FirstName VARCHAR(100) NOT NULL, 
LastName VARCHAR(100) NOT NULL, 
Salary DECIMAL(8, 2) NOT NULL, 
JoiningDate DATETIME NOT NULL,   
DepartmentID INT NULL, 
DesignationID INT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID), 
FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID) 
);



--Part – A 
--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures. 
--For TABLE : 
--INSERT TABLE : 1
create or alter procedure PR_Department_insert
	@DepartmentID INT,
	@DepartmentName VARCHAR(100)
as 
begin
	insert into Department values(@DepartmentID, @DepartmentName);
end

exec PR_Department_insert 1, "Admin"
exec PR_Department_insert 2, "IT"
exec PR_Department_insert 3, "HR"
exec PR_Department_insert 4, "Account"

select * from Department
--update :

create or alter procedure PR_Department_update
	@DepartmentID INT,
	@DepartmentName VARCHAR(100)
as 
begin
	update Department
	set DepartmentName = @DepartmentName
	where DepartmentID = @DepartmentID
end

--DELETE : 
	create or alter procedure PR_Department_delete
	@DepartmentID INT
as 
begin
	delete from Department
	where DepartmentID = @DepartmentID
end




--TABLE : 2
create or alter procedure PR_Designation_insert
	@DesignationID INT,
	@DesignationName VARCHAR(100)
as 
begin
	insert into Designation values(@DesignationID, @DesignationName);
end

exec PR_Designation_insert 11, Jobber
exec PR_Designation_insert 12, Welder
exec PR_Designation_insert 13, Clerk
exec PR_Designation_insert 14, Manager
exec PR_Designation_insert 15, CEO

select * from Designation

--update :

create or alter procedure PR_Designation_update
	@DesignationID INT,
	@DesignationName VARCHAR(100)
as 
begin
	update Designation
	set DesignationName = @DesignationName
	where DesignationID = @DesignationID
end

--DELETE : 
	create or alter procedure PR_Designation_delete
	@DesignationID INT
as 
begin
	delete from Designation
	where DesignationID = @DesignationID
end



--TABLE : 3
create or alter procedure PR_Person_insert
	@FirstName VARCHAR(100),
	@LastName VARCHAR(100),
	@Salary decimal(8, 2),
	@JoiningDate DateTime,
	@DepartmentID int,
	@DesignationID int
as 
begin
	insert into Person values(@FirstName, @LastName, @Salary, @JoiningDate, @DepartmentID, @DesignationID);
end

exec PR_Person_insert 'Rahul', 'Anshu', 56000, '1990-1-1', 1, 12
exec PR_Person_insert 'Hardik ', 'Hinsu', 18000, '1990-09-25', 2, 11
exec PR_Person_insert 'Bhavin', 'Kamani', 25000, '1991-05-14', null, 11
exec PR_Person_insert 'Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13	
exec PR_Person_insert 'Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15
exec PR_Person_insert 'Priya', 'Mehta', 25000, '1990-10-18', 2, null
exec PR_Person_insert 'Neha', 'Trivedi', 18000, '2014-02-20', 3, 15

select * from Person

--update

create or alter procedure PR_Person_Update
	@PERSONID INT,
	@FirstName VARCHAR(100),
	@LastName VARCHAR(100),
	@Salary decimal(8, 2),
	@JoiningDate DateTime,
	@DepartmentID int,
	@DesignationID int
as 
begin
	update Person
	set 
		FirstName = @FirstName,
		LastName = @LastName,
		Salary = @Salary,
		JoiningDate = @JoiningDate,
		DepartmentID = @DepartmentID,
		DesignationID = @DesignationID
		WHERE PersonID=@PERSONID
	end

	SELECT * FROM Person
	EXEC PR_Person_Update 107,'Neha', 'Trivedi', 18000, '2013-02-20', 3, 15
	--delete :
		
create or alter procedure PR_Person_Delete
	@PersonID int
as 
begin
	delete from Person
	where PersonID = @PersonID
end



--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY 
--table 1 :
create or alter procedure PR_Department_SELECTBYPRIMARYKEY
	@DepartmentID int
as
begin
	select * from Department
	where DepartmentID = @DepartmentID
end

--table 2 :
create or alter procedure PR_Designation_SELECTBYPRIMARYKEY
	@DesignationID int
as
begin
	select * from Designation
	where DesignationID = @DesignationID
end

--table 3 : 
create or alter procedure PR_Person_SELECTBYPRIMARYKEY
	@PersonID int
as
begin
	select * from Person
	where PersonID = @PersonID
end

--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take 
--columns on select list) 
create or alter procedure PR_ALLJOIN
as
begin
	select * from person
	join Department
	on Person.DepartmentID = Department.DepartmentID
	join Designation
	on Person.DesignationID = Designation.DesignationID
end

exec PR_ALLJOIN
--4. Create a Procedure that shows details of the first 3 persons.
create or alter procedure PR_TOP3
as
begin
	select TOP 3 * from person
	join Department
	on Person.DepartmentID = Department.DepartmentID
	join Designation
	on Person.DesignationID = Designation.DesignationID
end

exec PR_TOP3
--Part – B 
--5.Create a Procedure that takes the department name as input and returns a table with all workers
--working in that department.
CREATE OR ALTER PROCEDURE PR_PERSON_SEARCH
	@DEPARTMENT_NAME VARCHAR(50)
AS
BEGIN
	SELECT *
	FROM Person P
	JOIN Department D
	ON P.DepartmentID = D.DepartmentID
	WHERE D.DepartmentName = @DEPARTMENT_NAME
END

EXEC PR_PERSON_SEARCH Admin
--6. Create Procedure that takes department name & designation name as input and returns a table with
--worker’s first name, salary, joining date & department name.
CREATE OR ALTER PROCEDURE PR_PERSON_DETAIL
	@DEPARTMENT_NAME VARCHAR(50),
	@DESIGNATION_NAME VARCHAR(50)
AS
BEGIN
	SELECT 
		P.FirstName,
		P.Salary,
		P.JoiningDate,
		D.DepartmentName
	FROM Person P
	JOIN Department D ON P.DepartmentID = D.DepartmentID
	JOIN Designation C ON P.DesignationID = C.DesignationID
	WHERE D.DepartmentName = @DEPARTMENT_NAME
	AND C.DesignationName = @DESIGNATION_NAME
END

EXEC PR_PERSON_DETAIL IT, Jobber
--7. Create a Procedure that takes the first name as an input parameter and display all the details of the
--worker with their department & designation name.
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_WORKER
    @FIRST_NAME VARCHAR(100)
AS
BEGIN
    SELECT
        *
    FROM Person P 
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    JOIN Designation C ON P.DesignationID = C.DesignationID
    WHERE P.FirstName = @FIRST_NAME;
END

EXEC PR_DEPARTMENT_WORKER Rohit
--8. Create Procedure which displays department wise maximum, minimum & total salaries.
CREATE OR ALTER PROCEDURE PR_PERSON_SALARY
AS
BEGIN
	SELECT
		D.DepartmentName,
		MAX(P.Salary) AS MAXSALARY,
		MIN(P.Salary) AS MINSALARY,
		SUM(P.Salary) AS TOTALSALARY
	FROM Person P
	JOIN Department D ON P.DepartmentID = D.DepartmentID 
	GROUP BY D.DepartmentName
END

EXEC PR_PERSON_SALARY
--9. Create Procedure which displays designation wise average & total salaries.
CREATE OR ALTER PROCEDURE PR_PERSON_AVG_SALARY
AS
BEGIN
	SELECT 
		D.DesignationName,
		AVG(P.Salary) AS AVERAGE_SALARY,
		SUM(P.Salary) AS TOTAL_SALARY
	FROM Person P
	JOIN Designation D ON P.DesignationID = D.DesignationID
	GROUP BY D.DesignationName
END

EXEC PR_PERSON_AVG_SALARY 
--Part – C 
--10. Create Procedure that Accepts Department Name and Returns Person Count.
CREATE OR ALTER PROCEDURE PR_PERSON_COUNT
	@DEPT_NAME VARCHAR(50)
AS
BEGIN
	SELECT COUNT(P.PersonID) AS COUNT_IN_@DEPT_NAME
	FROM Person P
	JOIN Department D 
	ON P.DepartmentID = D.DepartmentID
	WHERE DepartmentName = @DEPT_NAME
END

EXEC PR_PERSON_COUNT Admin
--11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than
--input salary value along with their department and designation details. 
CREATE OR ALTER PROCEDURE PR_PERSON_SalaryGreaterThanAverage
	@SALARY INT
AS
BEGIN
	SELECT
		D.DepartmentID,
		D.DepartmentName,
		C.DesignationID,
		C.DesignationName
	FROM Person P
	JOIN Department D ON P.DepartmentID = D.DepartmentID
	JOIN Designation C ON P.DesignationID = C.DesignationID
	WHERE P.Salary > @SALARY
END

EXEC PR_PERSON_SalaryGreaterThanAverage 50000
--12. Create a procedure to find the department(s) with the highest total salary among all departments.
CREATE OR ALTER PROCEDURE PR_DEPT_HighestSalary
AS
BEGIN
	SELECT
		D.DepartmentName,
		SUM(P.Salary) AS TOTAL_SALARY
	FROM Person P
	JOIN Department D ON P.DepartmentID = D.DepartmentID
	GROUP BY D.DepartmentName
	ORDER BY TOTAL_SALARY DESC
END

EXEC PR_DEPT_HighestSalary
--13. Create a procedure that takes a designation name as input and returns a list of all workers under that designation who joined within the last 10 years, along with their department. 
CREATE OR ALTER PROCEDURE PR_PERSON_JOINDATE
	@DES_NAME VARCHAR(50)
AS
BEGIN
	SELECT
		*
	FROM Person P
	JOIN Department D ON P.DepartmentID = D.DepartmentID
	JOIN Designation C ON P.DesignationID = C.DesignationID
	WHERE DATEDIFF(MONTH, P.JoiningDate, GETDATE()) < 120 AND C.DesignationName = @DES_NAME
END

EXEC PR_PERSON_JOINDATE CEO
--14. Create a procedure to list the number of workers in each department who do not have a designation 
--assigned. 
CREATE OR ALTER PROCEDURE PR_DES_NULL
AS
BEGIN
	SELECT
        D.DepartmentName,
        COUNT(P.PersonID) AS PersonCount
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    LEFT JOIN Designation C ON P.DesignationID = C.DesignationID
    WHERE P.DesignationID IS NULL
    GROUP BY D.DepartmentName;
END

EXEC PR_DES_NULL
--15. Create a procedure to retrieve the details of workers in departments where the average salary is above 
--12000.
CREATE OR ALTER PROCEDURE PR_ABOVE_AVG_SAL
AS
BEGIN
    SELECT 
        P.*,
        D.DepartmentName
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    WHERE D.DepartmentID IN (
            SELECT 
                D.DepartmentID
            FROM Person P
            JOIN Department D ON P.DepartmentID = D.DepartmentID
            GROUP BY D.DepartmentID
            HAVING AVG(P.Salary) > 12000
        );
END

EXEC PR_ABOVE_AVG_SAL;