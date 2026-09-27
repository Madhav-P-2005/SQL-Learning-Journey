--- CREATE USER :- This statement creates a database account that allows you to log into the database

/*  Syntax :- CREATE USER user_name [WITH PASSWORD 'password_value' | VALID UNTIL 'expiration']; */

create user starttech 
with password 'academy';

---  Privileges to tables can controlled using GRANT & REVOKE . These permissions can be any combination of SELECT,INSERT,UPDATE,DELETE,INDEX,CREATE,ALTER,DROP,GRANT OPTION or ALL */

--- GRANT :- It is used to give specific privileges or permissions on a database object to a user.

--- Syntax :- GRANT privileges ON object TO user;

GRANT SELECT, UPDATE, INSERT, DELETE on product to starttech;

--- REVOKE :- REVOKE is used to remove previously granted privileges or permissions from a user.

--- Syntax :- REVOKE privileges ON object FROM user;

REVOKE delete on product from starttech;

-- DROP USER :- This statement is used to remove a user from the database.

--- Syntax :- DROP USER user_name;

DROP user starttech;

REVOKE all on product from starttech;

--- ALTER USER :- This statement is used to rename a user in the database

---  Syntax :- ALTER USER user_name

ALTER user starttech;

--- RENAME USER :- This statement is used to rename a user in the database

--- Syntax :-  RENAME to new_name;

ALTER user starttech RENAME TO ST;

DROP user ST;

--- Find all users :- Run a query against pg_user table to retrieve information about Users 

--- Syntax :- SELECT usename FROM <pg user name>;

Select usename from pg_user;

--- Find logged-in users :- Run a query against pg_stat_activity table to retrieve information about logged-in Users

--- Syntax :- SELECT Distinct usename from <pg stat activity>;

Select distinct usename from pg_stat_activity;

Select distinct * from pg_stat_activity;