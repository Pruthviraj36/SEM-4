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
