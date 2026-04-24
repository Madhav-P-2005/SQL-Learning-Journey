/* 

1. In the database Supermart_DB, find the following :- 

a. Get the list of all cities where the region is South or east without any 
duplicates using IN statement.

b. Get the list of all orders where the ‘sales’ value is between 100 and 
500 using the BETWEEN operator.

c. Get the list of customers whose last name contains only 4 characters 
using LIKE

*/

select * from Sales;

select * from Customer;

select * from Product;


--- Ans 1 ---

Select distinct city from Customer where region in ('North','East');

--- Ans 2 ---

Select * from Sales where Sales between 100 and 500;

--- Ans 3 ---

Select Customer_Name from Customer where Customer_Name LIKE '%____';