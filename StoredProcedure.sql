-- Stored Procedure 

-- Stored procedures in SQL are precompiled and stored in the database. 
-- They contain one or more SQL statements and can be executed as a single unit.

-- in simple form

/*
    A stored procedure is like a mini-program or a set of instructions that you save 
    and can reuse whenever you need it. Imagine you have a task you do often—instead of 
    writing out the steps every time, you create a little script, and whenever you want 
    to perform that task, you just run the script.
*/

--  How to create

-- SQL Server example
CREATE PROCEDURE sp_GetEmployeeCount
AS
BEGIN
    SELECT COUNT(*) AS TotalEmployees FROM Employees;
END;

-- Employees : table name.
-- Stored Procedure name : sp_GetEmployeeCount

-- Execute the stored procedure
EXEC sp_GetEmployeeCount;


-- Stored procedures can also accept parameters:

-- SQL Server example
CREATE PROCEDURE sp_GetEmployeeByName
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50)
AS
BEGIN
    SELECT * FROM Employees
    WHERE FirstName = @FirstName AND LastName = @LastName;
END;


-- Execute the stored procedure with parameters
EXEC sp_GetEmployeeByName @FirstName = 'John', @LastName = 'Doe';


-- Advantages 

/*
    Modularity and reusability
    Improved Performance
    Security
    Encapsulation of Buisness Logic
    Reduced Network Traffic
    Transaction Control
    Compatibility and Portability
    Centralized Management
*/

-- How we can use in ORM

-- Modularity and Reusabilty

from django.db import models

class MyModel(models.Model):
    column1 = models.CharField(max_length=255)
    column2 = models.IntegerField()

    @classmethod
    def get_total_count(cls):
        return cls.objects.count()

-- you can call where ever you want

total_count = MyModel.get_total_count()



