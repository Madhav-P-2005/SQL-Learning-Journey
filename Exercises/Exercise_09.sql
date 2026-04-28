/* 

 1. Make a dashboard showing the following figures for each product ID

   a) Total sales (in $) order by this column in descending
   b) Total sales quantity
   c) Number of orders
   d) Max Sales value
   e) Min Sales value
   f) Average sales value

 2. Get the list of product ID’s where the quantity of product sold is greater than 10

*/


--- Ans 1 ---

Select Product_id , sum(sales) as "Total Sales" , sum(quantity) as "Total Sales Quantity" , count(order_id) as "Number of Orders" , max(sales) as "Maximum Sales Value" , min(sales) as "Minimum Sales Value" , avg(sales) as "Average Sales Value" from Sales group by Product_id order by "Total Sales" desc;  --- My Way --- 

select product_id,sum(sales) as Total_sales, sum(quantity) as total_quantity, 
count(order_id) as total_order, min(sales) as min_sales , max(sales) as max_sales, 
avg(sales) as avg_sales from sales group by product_id order by total_sales desc;


--- Ans 2 ---
Select * from Product;
Select Product_id , sum(quantity) as "Sum of Quantity of Product" from Sales group by Product_id having sum(quantity) > 10;