---  Business Scenario ---

/* 
   The company is exploring a co-branded launch in Men’s Shoes. Marketing needs to know which two brands sell the most units in that sub-category to prioritize partnership outreach and negotiate placement
*/


--- Problem Statement ---

/* 
   Within Men’s Shoes, tell us the top two brands by quantity sold so we can target them for a co-branded product.
*/ 



--- Answer ---

Select * from sales;
Select * from products;

SELECT
  p.brand_name,
  SUM(s.quantity) AS total_items_sold
FROM products AS p
INNER JOIN sales AS s
  ON p.product_id = s.product_id
WHERE p.sub_category = 'Men/Shoes' 
GROUP BY p.brand_name
ORDER BY total_items_sold DESC 
LIMIT 2;