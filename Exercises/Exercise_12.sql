/* 

1) Create a View which contains order_line, Product_id, sales and discount 
value of the first order date in the sales table and name it as 
“Daily_Billing” 

2)  Delete this View

*/

--- Ans 1 ---
Select * from sales;

-- My Way --
CREATE VIEW Daily_Billing AS
SELECT
    order_line,
    product_id,
    sales,
    discount
FROM sales
ORDER BY order_date ASC
LIMIT 1;

-- sir's way --
CREATE VIEW Daily_Billing AS
SELECT
    order_line,
    product_id,
    sales,
    discount
FROM sales
WHERE order_date IN (
    SELECT MAX(order_date)
    FROM sales
);

-- LLM Ans --- 
Create view Daily_Billing as 
Select order_line,
       product_id,
	   sales,
	   discount
from sales 
where order_date in (
       select min(order_date) 
	   from sales
);

-- or --

CREATE VIEW "Daily_Billing" AS
SELECT 
    order_line,
    product_id,
    sales,
    discount
FROM sales
WHERE order_date = (
    SELECT MIN(order_date) 
    FROM sales
);

Select * from Daily_Billing;

--- Ans 2 ---
drop view Daily_Billing;