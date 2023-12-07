--  NORMALIZATION 

/*
    
    Normalization is a process in database design that aims to organize data efficiently 
    and reduce redundancy. It involves breaking down large tables into smaller, more manageable 
    pieces and establishing relationships between them. The primary goals of normalization are to 
    eliminate data anomalies, minimize redundancy, and ensure data integrity

*/

First Normal Form (1NF):
-- Each column contains atomic (indivisible) values.
-- No repeating groups or arrays of data.

Second Normal Form (2NF):
-- Must be in 1NF.
-- All non-key attributes are fully functionally dependent on the primary key.

Third Normal Form (3NF):
-- Must be in 2NF.
-- No transitive dependencies (non-prime attributes depend on other non-prime attributes).

Boyce-Codd Normal Form (BCNF):
-- A more refined version of 3NF.
-- All non-trivial functional dependencies are a result of superkeys.




