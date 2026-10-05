-- Create The Table Structure --
CREATE TABLE Coffee_Shop_Sales (
   transaction_id integer,
   transaction_date date,
   transaction_time time,
   transaction_qty int,
   store_id int,
   store_location varchar,
   product_id int,
   unit_price decimal(10,2),
   product_category varchar,
   product_type varchar,
   product_detail varchar
)

--- Import CSV Data ---
copy Coffee_Shop_Sales
from 'E:\Program Files\PostgreSQL\18\data\Coffee Shop Sales.csv'
delimiter ','
csv header;

/*

1) Product Sales Analysis :-   
   
Top 5 Most Frequently Sold Products by Product Category :- 

a) Retrieve the top 5 products with the highest sales frequency within each product category.

Purpose :-  Identify the most popular products to inform inventory management and marketing strategies.

*/

-- Ans a ---