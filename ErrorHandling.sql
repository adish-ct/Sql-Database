-- ERROR HANDLING

/*

    Error handling in SQL involves mechanisms to gracefully handle and manage errors that may 
    occur during the execution of SQL statements. Common error scenarios include violations of constraints, 
    data type mismatches, and other unexpected issues. SQL provides the TRY...CATCH construct in 
    Transact-SQL (T-SQL) for handling errors in a structured way

*/

BEGIN TRY
    -- SQL statements that might cause an error
    SELECT 1 / 0; -- Division by zero error

END TRY
BEGIN CATCH
    -- Error handling code
    PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;


-- Handling Specific Error Numbers:

BEGIN TRY
    -- SQL statements that might cause a specific error
    RAISEERROR('Custom error message', 16, 1);

END TRY
BEGIN CATCH
    -- Check for a specific error number
    IF ERROR_NUMBER() = 50000
        PRINT 'Custom error occurred: ' + ERROR_MESSAGE();
    ELSE
        PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;


-- Nested TRY...CATCH Blocks:

BEGIN TRY
    -- Outer TRY block
    BEGIN TRY
        -- Inner TRY block
        SELECT 1 / 0; -- Division by zero error

    END TRY
    BEGIN CATCH
        -- Inner CATCH block
        PRINT 'Inner error: ' + ERROR_MESSAGE();
    END CATCH;

    -- Other statements

END TRY
BEGIN CATCH
    -- Outer CATCH block
    PRINT 'Outer error: ' + ERROR_MESSAGE();
END CATCH;


-- Rethrowing Errors:

BEGIN TRY
    -- SQL statements that might cause an error
    RAISEERROR('Original error', 16, 1);

END TRY
BEGIN CATCH
    -- Catch and rethrow the error
    PRINT 'Caught error: ' + ERROR_MESSAGE();
    THROW; -- Rethrow the original error
END CATCH;

