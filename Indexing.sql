--  INDEXING --

/*
     index is a database object that provides a fast way to look up data in a table based on 
     the values in one or more columns. It's like an organized reference that helps the 
     database engine find and retrieve rows quickly
*/

-- Syntax for creating an index on a single column
CREATE INDEX index_name ON table_name (column_name);

-- Example: Creating an index on the "username" column of the "users" table
CREATE INDEX idx_username ON users (username);


-- Composite Index
CREATE INDEX idx_columns ON table_name (column1, column2);


-- How can we use an Index 

-- Using an index in a SELECT query
SELECT * FROM table_name WHERE indexed_column = 'some_value';

-- example
CREATE INDEX idx_username ON users (username);

SELECT * FROM users WHERE username = 'john';



-- Syntax for removing an index
DROP INDEX index_name ON table_name;

-- Example: Removing the previously created index on the "username" column
DROP INDEX idx_username ON users;
