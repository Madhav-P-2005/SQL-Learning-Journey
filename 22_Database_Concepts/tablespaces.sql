/*  
    Tablespaces allow database administrators to define locations in the file system where the files representing database objects can be stored 

	1) Creation of the tablespace can only be done by database superuser
	2) Ordinary database users can be allowed to use it by granting them the create privilege on the new tablespace.

*/

--- Syntax :- CREATE TABLESPACE <tablespace name> LOCATION <location on drive>;

--- Creating New TableSpace
create tablespace NewSpace location 'E:\Program Files\PostgreSQL\18\data\Storage';

--- Creating a New Table 

create table customer_test(i int) tablespace NewSpace;