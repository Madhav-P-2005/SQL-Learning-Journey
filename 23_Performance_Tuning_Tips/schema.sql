--- SCHEMAS :-  A schema is a collection of database objects associated with one particular database. You may have one or multiple schemas in a database.

--- Syntax :- CREATE SCHEMA <schema_name>;

create schema test;

--- creating new object in test ---
create table test.customer as select * from customer;