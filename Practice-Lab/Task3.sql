---  Business Scenario ---

/* 
   Ops wants a leaderboard of sales agents specifically for Two-day Delivery orders paid by card in 2021. Only agents with enough volume and positive total profit should appear.
*/


--- Problem Statement ---

/* 
   Show agents handling Two-day + card orders in 2021, but only those with ≥ 2 orders and positive total profit, sorted by profit.
*/ 


--- Answer ---

Select * from sales;

Select sales_agent , count(*) as order_count , sum(profit) as total_profit , sum(sales) as total_sales , avg(percent_discount) as "avg_discount" , avg(delivery_rating) as "avg_rating" from sales where order_date >= date '2021-01-01' and order_date < date '2022-01-01' and delivery_mode='Two-day Delivery' and payment_mode in ('Debit Card' , 'Credit Card') group by sales_agent having count(*)>2 and sum(profit) > 0 order by total_profit desc , order_count desc;