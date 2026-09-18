/* 

 1) Windows function provide the ability to perform calculations across sets of rows that are related to the current query row .

 2) Window functions compute their result based on a sliding window frame, a set of rows that are somehow related to the current row.

 3) Unlike Aggregate functions a window function does not cause rows to become grouped into a single output row - the rows retain their separate identities. 

 4) Behind the scenes , the window function can access more than just the current row of the query result. 

*/

select * from customer limit 10;

Select * from sales limit 10;

Select a.*, b.order_num , b.sales_total, b.quantity_total, b.profit_total
from customer as a
left join (select customer_id , count(distinct order_id) as order_num , sum(sales) as sales_total , sum(quantity) as quantity_total, 
            sum(profit) as profit_total from sales group by customer_id) as b
on a.customer_id=b.customer_id;

Select * from sales where customer_id = 'AA-10315' order by order_id;

create table customer_order as (Select a.*, b.order_num , b.sales_total, b.quantity_total, b.profit_total
from customer as a
left join (select customer_id , count(distinct order_id) as order_num , sum(sales) as sales_total , sum(quantity) as quantity_total, 
            sum(profit) as profit_total from sales group by customer_id) as b
on a.customer_id=b.customer_id);

Select * from customer_order;

--- Top customers with highest order_num from each state ---
Select customer_id , customer_name , state , order_num , ROW_NUMBER() over (partition by state order by order_num desc) as row_number
from customer_order;

--- Top 3 customers from each state ---
Select * from (Select customer_id , customer_name , state , order_num , ROW_NUMBER() over (partition by state order by order_num desc) as row_number
from customer_order) as a where a.row_number <=3;

