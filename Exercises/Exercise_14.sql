/* 
   1) You are running a lottery for your customers. So, pick a list of 5 Lucky customers from 
   customer table using random function

  2) Suppose you cannot charge the customer in fraction points. So, for sales value of 1.63, 
   you will get either 1 or 2. In such a scenario, find out :- 
 a) Total sales revenue if you are charging the lower integer value of sales always
 b) Total sales revenue if you are charging the higher integer value of sales always
 c) Total sales revenue if you are rounding-off the sales always
 
*/


--- Ans 1 ---

select * from customer;

Select customer_id , random() as random_number from customer order by  random_number limit 5;

--- Ans 2 ---

select * from sales;

--- a) ---
Select sum(floor(sales)) as lower_int_sales from Sales;

--- b) ---
Select sum(ceiling(sales)) as higher_int_sales from sales;

--- c) ---
Select sum(round(sales)) as round_int_sales from sales;