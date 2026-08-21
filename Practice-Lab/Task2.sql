---  Business Scenario ---

/* 
   Finance and Growth want to see which payment methods are most used and whether they drive revenue and profit.
*/


--- Problem Statement ---

/* 
   Summarize orders, total sales, and total profit by payment method.
*/ 


--- Answer ---

select * from sales;
Select payment_mode , count(*) as "order_count" , sum(sales) as "total_sales" , sum(profit)  as 
"total_profit" from sales group by payment_mode order by order_count desc;