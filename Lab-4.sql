--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION HELLO_WORLD()
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN 'HELLO WORLD'
END

SELECT dbo.HELLO_WORLD()

--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION ADDS(
	@NUM1 INT,
	@NUM2 INT
)
RETURNS INT
AS
BEGIN
	RETURN @NUM1 + @NUM2
END

SELECT dbo.ADDS(5, 10) AS ADDITION

--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION ODD_EVEN(
	@NUM INT
)
RETURNS NVARCHAR(10)
AS
BEGIN
	RETURN
		CASE
			WHEN @NUM % 2 = 0 THEN 'Even'
			ELSE 'Odd'
		END
END

SELECT dbo.ODD_EVEN(10)

--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FIRST_NAME(
	@NAME VARCHAR(50)
)
RETURNS TABLE
AS
RETURN (
	SELECT *
	FROM Person
	WHERE FirstName LIKE @NAME + '%'
)

SELECT * FROM dbo.FIRST_NAME('P')

--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION UNIQUE_NAME()
RETURNS TABLE
AS
RETURN (
	SELECT DISTINCT(FirstName)
	FROM Person
)

SELECT * FROM dbo.UNIQUE_NAME()

--6. Write a function to print number from 1 to N. (Using while loop)
CREATE OR ALTER PROCEDURE PRINT_NUMBERS
	@N INT
AS
BEGIN
	DECLARE @I INT = 1
	WHILE @I <= @N
	BEGIN
		PRINT @I
		SET @I += 1
	END
END

EXEC PRINT_NUMBERS 100

--7. Write a function to find the factorial of a given integer.
CREATE OR ALTER FUNCTION FACTORIAL(
	@NUM INT
)
RETURNS BIGINT
AS
BEGIN
	DECLARE @J INT = 1
	DECLARE @FACT BIGINT = 1
	WHILE @J <= @NUM
	BEGIN
		SET @FACT = @FACT * @J
		set @J += 1
		--SET @J = @J + 1
	END
	RETURN @FACT
END

SELECT dbo.FACTORIAL(10) AS FACTORIAL

--Part – B 
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
CREATE OR ALTER FUNCTION COMPARE(
	@NUM INT
)
RETURNS VARCHAR(20)
AS
BEGIN
RETURN
	CASE 
		WHEN @NUM > 0 THEN 'POSITIVE'
		ELSE
			CASE
				WHEN @NUM < 0 THEN 'NEGATIVE'
				ELSE 'ZERO'
			END
	END
END

SELECT dbo.COMPARE(0)

--9. Write a function to print the sum of even numbers between 1 to 20. 
--10. Write a function that checks if a given string is a palindrome 