--- TRUNCATE :- This statement is used to remove all records from a table or set of tables in PostgreSQL . It performs the same function as a DELETE statement without a WHERE clause . 

--- Syntax :- TRUNCATE [ONLY] table_name [CASCADE | RESTRICT];

Select * from customer_20_60;

--- Clear all contents ---

TRUNCATE TABLE customer_20_60;