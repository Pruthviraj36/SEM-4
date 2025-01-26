-- AFTER

CREATE TABLE EMPLOYEEDETAILS(
	EmployeeID Int Primary Key,
	EmployeeName Varchar(100) Not Null,
	ContactNo Varchar(100) Not Null,
	Department Varchar(100) Not Null,
	Salary Decimal(10,2) Not Null,
	JoiningDate DateTime Null
)

CREATE TABLE EmployeeLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    ActionPerformed VARCHAR(100) NOT NULL,
    ActionDate DATETIME NOT NULL
)

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Duration INT NOT NULL
)

CREATE TABLE MoviesLog(
	LogID INT PRIMARY KEY IDENTITY(1,1),
	MovieID INT NOT NULL,
	MovieTitle VARCHAR(255) NOT NULL,
	ActionPerformed VARCHAR(100) NOT NULL,
	ActionDate	DATETIME  NOT NULL
)

--1)Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table
--to display the message "Employee record inserted", "Employee record updated", "Employee record deleted
PRINT 'ALREADY DONE'

--2)Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table
--to log all operations into the EmployeeLog table.
PRINT 'ALREADY DONE'

--3)Create a trigger that fires AFTER INSERT to automatically calculate the joining bonus (10% of the salary)
--for new employees and update a bonus column in the EmployeeDetails table.
CREATE OR ALTER TRIGGER TR_BONUS
ON EMPLOYEEDETAILS
AFTER INSERT
AS
BEGIN
	DECLARE @SAL INT, @EMPID INT

	SELECT
		@SAL = Salary,
		@EMPID = EmployeeID
	FROM inserted

	UPDATE EMPLOYEEDETAILS
	SET Salary = @SAL + @SAL * 0.1
	WHERE EmployeeID = @EMPID
END

INSERT INTO EMPLOYEEDETAILS (EmployeeID, EmployeeName, ContactNo, Department, Salary, JoiningDate)
VALUES (1, 'John Doe', '123-456-7890', 'HR', 60000.00, '2023-01-15');

SELECT * FROM EMPLOYEEDETAILS

--4)Create a trigger to ensure that the JoiningDate is automatically set to the current date if it is NULL
--during an INSERT operation.
CREATE OR ALTER TRIGGER TR_DATE_VERIFICATION
ON EMPLOYEEDETAILS
AFTER INSERT
AS
BEGIN
	DECLARE @EMPID INT
	SELECT
		@EMPID = EmployeeID
	FROM inserted
	WHERE JoiningDate IS NULL

	UPDATE EMPLOYEEDETAILS
	SET JoiningDate = GETDATE()
	WHERE EmployeeID = @EMPID
END

INSERT INTO EMPLOYEEDETAILS (EmployeeID, EmployeeName, ContactNo, Department, Salary, JoiningDate)
VALUES (2, 'John Doe', '123-456-7890', 'HR', 60000.00, '');

SELECT * FROM EMPLOYEEDETAILS

--5)Create a trigger that ensure that ContactNo is valid during insert(Like ContactNo length is 10)
CREATE OR ALTER TRIGGER TR_CONTACT_VALIDATION
ON EMPLOYEEDETAILS
AFTER INSERT
AS
BEGIN
    DECLARE @CONTACT VARCHAR(100), @EMPID INT;

    SELECT
        @CONTACT = ContactNo,
        @EMPID = EmployeeID
    FROM inserted;

    IF LEN(@CONTACT) <> 10
    BEGIN
		PRINT 'ENTER CORRECT NUMBER AGAIN'
        ROLLBACK TRANSACTION;
    END
END

INSERT INTO EMPLOYEEDETAILS (EmployeeID, EmployeeName, ContactNo, Department, Salary, JoiningDate)
VALUES (3, 'John Doe', '1234567890', 'HR', 60000.00, '')

SELECT * FROM EMPLOYEEDETAILS

--------------------------------------------------------------INSTEAD-OF--------------------------------------------------------------------------

--1.Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Movies table.
--For that, log all operations performed on the Movies table into MoviesLog.
CREATE OR ALTER TRIGGER TR_MoviesLog
ON Movies
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @OperationType VARCHAR(100);

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SET @OperationType = 'INSERT';
        INSERT INTO MoviesLog (MovieID, MovieTitle, ActionPerformed, ActionDate)
        SELECT MovieID, MovieTitle, @OperationType, GETDATE() FROM inserted;
        INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
        SELECT MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration FROM inserted;
    END

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        SET @OperationType = 'UPDATE';
        INSERT INTO MoviesLog (MovieID, MovieTitle, ActionPerformed, ActionDate)
        SELECT MovieID, MovieTitle, @OperationType, GETDATE() FROM inserted;
        UPDATE Movies
        SET MovieTitle = i.MovieTitle, ReleaseYear = i.ReleaseYear, Genre = i.Genre, Rating = i.Rating, Duration = i.Duration
        FROM Movies m
        JOIN inserted i ON m.MovieID = i.MovieID;
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SET @OperationType = 'DELETE';
        INSERT INTO MoviesLog (MovieID, MovieTitle, ActionPerformed, ActionDate)
        SELECT MovieID, MovieTitle, @OperationType, GETDATE() FROM deleted;
        DELETE FROM Movies WHERE MovieID IN (SELECT MovieID FROM deleted);
    END
END
	
--2.Create a trigger that only allows to insert movies for which Rating is greater than 5.5.

DROP TRIGGER TR_RatingValidation

CREATE OR ALTER TRIGGER TR_RatingValidation
ON Movies
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Rating <= 5.5)
    BEGIN
        PRINT 'Error: Movie rating must be greater than 5.5.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
        SELECT MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration FROM inserted;
    END
END

--3.Create trigger that prevent duplicate 'MovieTitle' of Movies table and log details of it in MoviesLog table.

DROP TRIGGER TR_PreventDuplicateMovieTitle

CREATE OR ALTER TRIGGER TR_PreventDuplicateMovieTitle
ON Movies
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted i JOIN Movies m ON i.MovieTitle = m.MovieTitle WHERE i.MovieID != m.MovieID)
    BEGIN
        INSERT INTO MoviesLog (MovieID, MovieTitle, ActionPerformed, ActionDate)
        SELECT MovieID, MovieTitle, 'DUPLICATE', GETDATE() FROM inserted;
        PRINT 'Error: Duplicate movie title detected.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
        SELECT MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration FROM inserted;
    END
END

--4.Create trigger that prevents to insert pre-release movies.

DROP TRIGGER TR_PreventPreReleaseMovies

CREATE OR ALTER TRIGGER TR_PreventPreReleaseMovies
ON Movies
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE ReleaseYear > YEAR(GETDATE()))
    BEGIN
        PRINT 'Error: Movie cannot be inserted with a pre-release date.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
        SELECT MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration FROM inserted;
    END
END

--5.Develop a trigger to ensure that the Duration of a movie cannot be updated to a value greater than
--120 minutes (2 hours) to prevent unrealistic entries.

DROP TRIGGER TR_PreventDurationUpdate

CREATE OR ALTER TRIGGER TR_PreventDurationUpdate
ON Movies
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted i JOIN deleted d ON i.MovieID = d.MovieID WHERE i.Duration > 120 AND i.Duration != d.Duration)
    BEGIN
        PRINT 'Error: Movie duration cannot be more than 120 minutes.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        UPDATE Movies
        SET MovieTitle = i.MovieTitle, ReleaseYear = i.ReleaseYear, Genre = i.Genre, Rating = i.Rating, Duration = i.Duration
        FROM Movies m
        JOIN inserted i ON m.MovieID = i.MovieID;
    END
END

INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
VALUES (1, 'Inception', 2010, 'Sci-Fi', 8.8, 148)

UPDATE Movies
SET Duration = 150
WHERE MovieID = 1

select * from movies