/* 

 1) Windows function provide the ability to perform calculations across sets of rows that are related to the current query row .

 2) Window functions compute their result based on a sliding window frame, a set of rows that are somehow related to the current row.

 3) Unlike Aggregate functions a window function does not cause rows to become grouped into a single output row - the rows retain their separate identities. 

 4) Behind the scenes , the window function can access more than just the current row of the query result. 

*/

select * from customer limit 10;

Select * from sales limit 10;

--- Row Number :- Unique number for each row within partition, with different numbers for tied values 

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

--- Row Number :- It assigns a unique sequential number to each row based on the ordering specified in the over() clause.

--- Rank :- When using Rank, it will escape some Ranking within parition as it gives tied rows the same rank and skips the subsequent rank.

--- Dense Rank :- When using Dense Rank , it will never skip any Rank . 

Select customer_id , customer_name , state , order_num ,
row_number() over (partition by state order by order_num desc) as row_number,
rank() over (partition by state order by order_num desc) as rank_number,
dense_rank() over (partition by state order by order_num desc) as dense_rank_number
from customer_order;

--- CTE(Common Table Expressions) :- A CTE is a temporary named result set created using WITH, which you can use like a table within the same SQL query.

-- Example (Coding Exercise 44):- 
with RankedEmployees as (Select FirstName, 
       LastName, 
       Salary, 
Rank() over (order by Salary desc) as Rank,
DENSE_RANK() over (order by Salary desc) as DenseRank
from Employees
)  Select FirstName, 
          LastName, 
          Salary, 
          Rank, 
          DenseRank
   from RankedEmployees 
   where Rank<=3; 


--- NTILE :- This function divide rows within a partition as equally as possible into n groups, and assign each row its group number. Used to deal with percentages

Select customer_id , customer_name , state , order_num ,
row_number() over (partition by state order by order_num desc) as row_number,
rank() over (partition by state order by order_num desc) as rank_number,
dense_rank() over (partition by state order by order_num desc) as dense_rank_number,
--- divide by data into 5 groups (100/20%)
ntile(5) over (partition by state order by order_num desc) as tile_n
from customer_order;

--- Filter to get Top 20% of the customers from each set which has most orders ---
Select * from (Select customer_id , customer_name , state , order_num ,
row_number() over (partition by state order by order_num desc) as row_number,
rank() over (partition by state order by order_num desc) as rank_number,
dense_rank() over (partition by state order by order_num desc) as dense_rank_number,
--- divide by data into 5 groups (100/20%)
ntile(5) over (partition by state order by order_num desc) as tile_n
from customer_order) as a  where a.tile_n=1;

--- Average :- This function is used to find average value for rows within the window frame

Select * from customer_order;

Select customer_id , customer_name , state , sales_total as revenue,
avg(sales_total) over (partition by state) as average_revenue 
from customer_order;

--- Customers whose revenue is less than the average revenue of their state ---
Select * from (Select customer_id , customer_name , state , sales_total as revenue,
avg(sales_total) over (partition by state) as average_revenue 
from customer_order) as a where a.revenue<a.average_revenue;

--- Count :- This function is used to count of values for rows within the window frame.

Select customer_id , customer_name, state , 
count(customer_id) over (partition by state) as count_customers
from customer_order;

-- Total :- This function is used to sum of values within the window frame

Select * from sales;

create table order_rollup as (Select order_id, max(order_date) as order_date, max(customer_id) as customer_id , sum(sales) as Total_Sales
from sales group by order_id);

--- To get the state column ---

Select * from customer;

create table order_rollup_state as Select a.* , b.state
from order_rollup as a 
left join customer as b
on a.customer_id = b.customer_id;

Select * from order_rollup;

Select * from order_rollup_state;

--- Total sales value of the State ---

Select *, sum(total_sales) over (partition by state) as sales_state_total 
from order_rollup_state;

--- Running Total :- This function is used to sum of values within the window frame

Select *, 
sum(total_sales) over (partition by state) as sales_state_total,
sum(total_sales) over (partition by state order by order_date) as running_total
from order_rollup_state;

--- LAG :- This function is used to give you the value of previous rows 

Select customer_id , order_date , order_id , total_sales,
lag(total_sales,1) over (partition by customer_id order by order_date) as previous_sales,
lag(order_id,1) over (partition by customer_id order by  order_date) as previous_order_id
from order_rollup_state;

--- Lead :- This function is used to give you the next rows value

Select customer_id , order_date , order_id , total_sales,
lead(total_sales,1) over (partition by customer_id order by order_date) as previous_sales,
lead(order_id,1) over (partition by customer_id order by  order_date) as previous_order_id
from order_rollup_state;