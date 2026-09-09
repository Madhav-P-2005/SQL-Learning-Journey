--- String Functions ---

-- Length :- This function returns the length of the specified string, expressed as the number of characters .

select * from customer;

select customer_name , length(customer_name) as characters from customer where age>30;

select customer_name , length(customer_name) as characters from customer where length(customer_name)>15;

--- Upper & Lower :- These functions converts all characters in specified string to uppercase/lowercase.

select upper('Start-Tech-Academy');

select lower('Start-Tech-Academy');

--- Replace :- This function replaces all occurrences of a specified string 

select * from customer;

select customer_name,
       country,
	   replace(country , 'United States' , 'US') as country_new 
from customer;

--- TRIM :- This function removes all specified characters either from the begining or the end of a string 
Select trim(leading from '        Start-Tech Academy   ')  -- acts as ltrim
Select trim(trailing ' ' from '   Start-Tech Academy   ') -- acts as rtrim
Select trim(both ' ' from '    Start-Tech Academy    ') -- acts as ltrim and rtrim 
Select trim('    Start-Tech Academy    ') -- acts as ltrim and rtrim 

--- RTRIM :- This function removes all specified characters from the right-hand side of a string.
Select rtrim('    Start-Tech Academy   ');

--- LTRIM :- This function removes all specified characters from the left-hand side of string.
Select ltrim('    Start-Tech Academy   ');

--- Concat :- || operator allows you to concatenate 2 or more strings together 

select * from customer;
Select customer_name , city||' ,  '||state||'  ,  '||country as address from customer;

--- Substring :- It is a function allows you to extract a substring from a string

--- To Get AB ---
Select * from customer;
Select customer_id,
       customer_name,
	   substring(customer_id for 2) as cust_group
from customer
where  substring(customer_id for 2) = 'AB';

--- To Get remaining 5 characters ---
Select customer_id,
       customer_name,
	   substring(customer_id from 4 for 5) as cust_group
from customer
where substring(customer_id for 2) = 'AB';


--- String_AGG :- It concatenates input values into a string, seperated by delimiter

select * from sales order by order_id;
-- ex :- CA-2014-100090  attach :- OFF-BI-10001597 , FUR-TA-10003715
Select order_id,
       string_agg(product_id, ', ')
from sales
group by order_id;