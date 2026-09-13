/* 
   Methods :- 

   1) LIKE statements :- They perform pattern matching on the whole string.

   2) SIMILAR TO statements :- Same as Regular Expressions so no need
   
   3) ~ (Regular Expressions) :- They perform pattern matching also on the part of string.(for complex tasks)
*/

---  Using _ in LIKE ---

Select * from customer;

Select first_name , last_name from customer_table where first_name LIKE 'Jas_n';

