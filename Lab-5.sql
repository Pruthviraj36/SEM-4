-- Part – A

-- 1. Create a trigger that fires on INSERT, UPDATE, and DELETE operations on the PersonInfo table to display a message “Record is Affected.”
DROP TRIGGER IF EXISTS TR_PERSONINFO_INSERT;

CREATE OR ALTER TRIGGER TR_PERSONINFO_INSERT
ON PersonInfo
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    PRINT 'Record is Affected.'
END;

-- 2. Create a trigger that logs all operations (INSERT, UPDATE, DELETE) on PersonInfo into the PersonLog table.
DROP TRIGGER IF EXISTS TR_PERSONINFO_LOG_INSERT;
DROP TRIGGER IF EXISTS TR_PERSONINFO_LOG_UPDATE;
DROP TRIGGER IF EXISTS TR_PERSONINFO_LOG_DELETE;

-- INSERT trigger
CREATE OR ALTER TRIGGER TR_PERSONINFO_LOG_INSERT
ON PERSONINFO
AFTER INSERT
AS
BEGIN
    DECLARE @PID INT, @PNAME VARCHAR(100);
    SELECT @PID = PersonID, @PNAME = PersonName FROM inserted;
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
    VALUES (@PID, @PNAME, 'INSERTED', GETDATE());
END;

-- UPDATE trigger
CREATE OR ALTER TRIGGER TR_PERSONINFO_LOG_UPDATE
ON PERSONINFO
AFTER UPDATE
AS
BEGIN
    DECLARE @PID INT, @PNAME VARCHAR(100);
    SELECT @PID = PersonID, @PNAME = PersonName FROM inserted;
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
    VALUES (@PID, @PNAME, 'UPDATED', GETDATE());
END;

-- DELETE trigger
CREATE TRIGGER TR_PERSONINFO_LOG_DELETE
ON PERSONINFO
AFTER DELETE
AS
BEGIN
    DECLARE @PID INT, @PNAME VARCHAR(100);
    SELECT @PID = PersonID, @PNAME = PersonName FROM deleted;
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
    VALUES (@PID, @PNAME, 'DELETED', GETDATE());
END;

-- 3. INSTEAD OF triggers that log operations to PersonLog table.
DROP TRIGGER IF EXISTS TR_PERSONINFO_LOG_INSERT_1;
DROP TRIGGER IF EXISTS TR_PERSONINFO_LOG_UPDATE_1;
DROP TRIGGER IF EXISTS TR_PERSONINFO_LOG_DELETE_1;

-- INSERT trigger with INSTEAD OF
CREATE OR ALTER TRIGGER TR_PERSONINFO_LOG_INSERT_1
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @PID INT, @PNAME VARCHAR(100);
    SELECT @PID = PersonID, @PNAME = PersonName FROM inserted;
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
    VALUES (@PID, @PNAME, 'INSERTED', GETDATE());
END;

-- UPDATE trigger with INSTEAD OF
CREATE OR ALTER TRIGGER TR_PERSONINFO_LOG_UPDATE_1
ON PERSONINFO
INSTEAD OF UPDATE
AS
BEGIN
    DECLARE @PID INT, @PNAME VARCHAR(100);
    SELECT @PID = PersonID, @PNAME = PersonName FROM inserted;
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
    VALUES (@PID, @PNAME, 'UPDATED', GETDATE());
END;

-- DELETE trigger with INSTEAD OF
CREATE OR ALTER TRIGGER TR_PERSONINFO_LOG_DELETE_1
ON PERSONINFO
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @PID INT, @PNAME VARCHAR(100);
    SELECT @PID = PersonID, @PNAME = PersonName FROM deleted;
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
    VALUES (@PID, @PNAME, 'DELETED', GETDATE());
END;

-- 4. Create a trigger that converts the PersonName to uppercase after an insert operation.
CREATE OR ALTER TRIGGER TR_PERSONINFO_UPPER
ON PERSONINFO
AFTER INSERT
AS
BEGIN
    UPDATE PersonInfo
    SET PersonName = UPPER(PersonName)
    WHERE PersonID IN (SELECT PersonID FROM inserted);
END;

-- 5. Create a trigger to prevent duplicate entries of person name in the PersonInfo table.
CREATE OR ALTER TRIGGER TR_PERSONINFO_DUPLICATE
ON PERSONINFO
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM PersonInfo WHERE PersonName IN (SELECT PersonName FROM inserted))
    BEGIN
        PRINT 'Duplicate person name is not allowed.';
        ROLLBACK; -- Rollback the transaction
    END
END;

-- 6. Create a trigger to prevent Age below 18 years.
CREATE OR ALTER TRIGGER TR_PERSONINFO_18
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO PersonInfo (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
    SELECT PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate
    FROM inserted
    WHERE Age >= 18;
END;

INSERT INTO PersonInfo VALUES (5, 'VIRAJ', 100000, '2020-08-18', 'PORBANDER', 17, '2007-08-18'); -- This will fail due to trigger

INSERT INTO PersonInfo VALUES (6, 'PRUTHVIRAJ', 100000, '2020-08-18', 'WANKANER', 19, '2005-12-24');

SELECT * FROM PersonInfo;

--Part – B
--7. Create a trigger that fires on INSERT operation on person table, which calculates the age and update
--that age in Person table.
CREATE OR ALTER TRIGGER TR_CalculateAgeOnInsert
ON PersonInfo
AFTER INSERT
AS
BEGIN
    DECLARE @PersonID INT, @BirthDate DATETIME, @Age INT;

    SELECT @PersonID = PersonID, @BirthDate = BirthDate
    FROM inserted;

    SET @Age = DATEDIFF(YEAR, @BirthDate, GETDATE()) 
    - CASE 
        WHEN MONTH(@BirthDate) > MONTH(GETDATE()) 
             OR (MONTH(@BirthDate) = MONTH(GETDATE()) AND DAY(@BirthDate) > DAY(GETDATE())) 
        THEN 1 
        ELSE 0 
    END;

    UPDATE PersonInfo
    SET Age = @Age
    WHERE PersonID = @PersonID;
END;


--8. Create a Trigger to Limit Salary Decrease by a 10%.
CREATE OR ALTER TRIGGER TR_LimitSalaryDecrease
ON PersonInfo
AFTER UPDATE
AS
BEGIN
    UPDATE p
    SET p.Salary = d.Salary
    FROM PersonInfo p
    INNER JOIN deleted d ON p.PersonID = d.PersonID
    INNER JOIN inserted i ON p.PersonID = i.PersonID
    WHERE i.Salary < d.Salary * 0.90
    AND p.Salary != d.Salary;
END;

UPDATE PersonInfo
SET Salary = 90000
WHERE PersonID = 6

SELECT * FROM PersonInfo

--Part – C
--9. Create Trigger to Automatically Update JoiningDate to Current Date on INSERT if JoiningDate is NULL
--during an INSERT.
CREATE OR ALTER TRIGGER TR_SetJoiningDateOnInsert
ON PersonInfo
AFTER INSERT
AS
BEGIN
    UPDATE PersonInfo
    SET JoiningDate = GETDATE()
    WHERE PersonID IN (SELECT PersonID FROM inserted WHERE JoiningDate IS NULL);
END;

--10. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints
--‘Record deleted successfully from PersonLog’.
CREATE OR ALTER TRIGGER TR_LogDeletionOnPersonLog
ON PersonLog
AFTER DELETE
AS
BEGIN
    PRINT 'Record deleted successfully from PersonLog';
END;
