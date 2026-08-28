/* 

   1) Find the total sales done in every state for customer_20_60 and sales_2015 table
   Hint: Use Joins and Group By command
   
   2) Get data containing Product_id, product name, category, total sales 
   value of that product and total quantity sold. (Use sales and product 
table)

*/

-- Ans 1 ---

select * from customer_20_60;

select * from sales_2015;


Select c.state,
       sum(sales) as total_sales 
from sales_2015 as s 
left join customer_20_60 as c 
on s.customer_id = c.customer_id 
group by c.state;

-- Ans 2 ---

Select * from product;

Select * from Sales;

Select 
      p. * , 
	  sum(s.sales) as total_sales,
	  sum(s.quantity) as total_quantity
from product as p left join sales as s on p.product_id = s.product_id 
group by p.product_id;	  