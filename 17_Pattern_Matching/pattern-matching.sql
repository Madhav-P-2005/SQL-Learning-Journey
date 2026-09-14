/* 
   Methods :- 

   1) LIKE statements :- They perform pattern matching on the whole string.

   2) SIMILAR TO statements :- Same as Regular Expressions so no need
   
   3) ~ (Regular Expressions) :- They perform pattern matching also on the part of string.(for complex tasks)
*/

---  Using _ in LIKE ---

Select * from customer;

Select first_name , last_name from customer_table where first_name LIKE 'Jas_n';

--- Using regular expressions --- 

Select * from customer;

Select * from customer where customer_name~* '^a+[a-z\s]+$';

Select * from customer where customer_name~* '^(a|b|c|d)+[a-z\$$]+';

Select * from customer where customer_name~* '^(a|b|c|d)[a-z]{3}\s[a-z]{4}$';

create table users(id serial primary key, name character varying);

insert into users (name) VALUES ('Alex'), ('Jon Snow'), ('Christopher'), ('Arya'),('Sandip Debnath'), ('Lakshmi'),('alex@gmail.com'),('@sandip5004'), ('lakshmi@gmail.com');

Select * from users;

Select * from users where name~*'[a-z0-9\.\-\_]+@[a-z0-9\-]+\.[a-z]{2,5}';