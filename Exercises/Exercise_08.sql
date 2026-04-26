/*

1. Find the sum of all ‘sales’ values.

2. Find count of the number of customers in north region with age 
between 20 and 30.

3. Find the average age of East region customers.

4. Find the Minimum and Maximum aged customer from Philadelphia.

*/


--- Ans 1 ---

Select sum(sales) from Sales;

--- Ans 2 ---

Select count(Customer_id) from Customer where region='North' and age between 20 and 30;

--- Ans 3 ---

select avg(age) from customer where region = 'East';

--- Ans 4 ---

select min (age) as "Mininum Age of Customer" , max(age) as max_age from customer where city = 'Philadelphia';