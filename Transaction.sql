----------------------- How to achieve transaction -------------------------------

-- Start a transaction
BEGIN TRANSACTION;

-- Your SQL statements go here
UPDATE your_table SET column1 = value1 WHERE condition;

-- If everything is successful, commit the transaction
COMMIT;

-- If there's an issue, rollback the transaction
-- ROLLBACK;
