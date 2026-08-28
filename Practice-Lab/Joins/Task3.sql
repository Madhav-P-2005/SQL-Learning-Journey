--- Business Scenario ---

/* 
   To boost conversions with a personalized offer, marketing wants to email California customers who searched for white Men’s Shoes but didn’t buy. The email should showcase the five best-selling white Men’s Shoes in California (by quantity sold), so the recommendations feel relevant and high-intent.
*/


--- Problem Statement ---

/* 
   List the top 5 products (by units sold) that are white and in Men’s Shoes, sold in California. Show: product name, brand, color, state, sub-category, and total products sold.
*/ 



--- Answer ---

Select * from sales
Select * from products;

SELECT
  p.product_name,
  MAX(p.brand_name)   AS brand_name,
  MAX(p.color)        AS color,   MAX(c.state)        AS state,
  MAX(p.sub_category) AS sub_category,
  SUM(s.quantity)     AS total_products_sold
FROM products p
JOIN sales s
  ON p.product_id = s.product_id
JOIN customer c
  ON s.customer_id = c.customer_id
WHERE p.color = 'White'
  AND c.state = 'California'
  AND p.sub_category = 'Men/Shoes'
GROUP BY p.product_name
ORDER BY total_products_sold DESC
LIMIT 5;