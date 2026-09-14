/* 

   1) Find out all customers who have first name and last name of 5 characters each and last 
   name starts with “a/b/c/d” .

   2) Create a table “zipcode” and insert the below data in it
       PIN/ZIP codes
         234432
         23345
         sdfe4
         123&3
         67424
         7895432
         12312
		 
   Find out the valid zipcodes from this table (5 or 6 Numeric characters)

*/

--- Ans 1 ---

Select * from customer;

Select * from customer where customer_name~* '^[a-z]{5}\s(a|b|c|d)[a-z]{4}$';

--- Ans 2 ---

Create table zipcode(zip varchar);

insert into zipcode values('234432'),('23345'),('sdfe4'),('123&3'),('67424'),('7895432'),('12312');

Select * from zipcode;

Select * from zipcode where zip~* '^[0-9]{5,6}$';