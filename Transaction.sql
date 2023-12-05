/*
    Transaction 

    transaction is a sequence of one or more SQL statements that are executed as a single unit of work.
    The primary goal of transactions is to ensure the consistency and integrity of a database.

    Atomicity : A transaction is atomic, meaning that it is treated as a single, indivisible unit.
    Either all the changes within the transaction are committed to the database, or none of them are.
    If any part of the transaction fails, the entire transaction is rolled back to its original state.

    Consistency: A transaction brings the database from one consistent state to another. 
    The database should satisfy all integrity constraints before and after the transaction.

    Isolation: The changes made by a transaction are isolated from other transactions until the changes are committed. 
    This ensures that the intermediate state of a transaction is not visible to other transactions.

    Durability: Once a transaction is committed, its changes are permanent and survive any subsequent failures. 
    The changes are stored in a way that can withstand crashes or system failures.

 */



----------------------- How to achieve transaction -------------------------------

-- Start a transaction
BEGIN TRANSACTION;

-- Your SQL statements go here
UPDATE your_table SET column1 = value1 WHERE condition;

-- If everything is successful, commit the transaction
COMMIT;

-- If there's an issue, rollback the transaction
-- ROLLBACK;
ROLLBACK;


----------------------- Implicit Transaction -------------------------------

/* 
    Implicit transaction is a transaction that is automatically started and committed by the system without 
    requiring explicit BEGIN TRANSACTION and COMMIT or ROLLBACK statements from the user.

Autocommit Mode:
    By default, SQL Server operates in autocommit mode, where each individual SQL statement is treated as a 
separate transaction. This means that each statement is automatically committed after execution.

Implicit Transaction Example:
    In autocommit mode, when you execute a statement, it is implicitly treated as a transaction, and the 
    changes are automatically committed.
*/

-- Autocommit mode (implicit transaction)
UPDATE your_table SET column1 = value1 WHERE condition;
-- The UPDATE statement is automatically committed


/*
Implicit Transactions with SET IMPLICIT_TRANSACTIONS:
    You can also enable implicit transactions explicitly using the SET IMPLICIT_TRANSACTIONS ON statement. 
    In this mode, a transaction is not automatically committed, and you need to explicitly commit or rollback the 
    transaction using COMMIT or ROLLBACK.
*/
-- Enable implicit transactions
SET IMPLICIT_TRANSACTIONS ON;

-- Implicit transaction
UPDATE your_table SET column1 = value1 WHERE condition;

-- Commit the transaction explicitly
COMMIT;

/*
Managing Implicit Transactions:
    When implicit transactions are enabled, you must manage the transactions explicitly using BEGIN TRANSACTION, 
    COMMIT, and ROLLBACK statements to control the transaction boundaries.
*/
-- Enable implicit transactions
SET IMPLICIT_TRANSACTIONS ON;

-- Begin the transaction explicitly
BEGIN TRANSACTION;

-- SQL statements within the transaction
UPDATE your_table SET column1 = value1 WHERE condition;

-- Commit or rollback explicitly
COMMIT;
-- or
ROLLBACK;




