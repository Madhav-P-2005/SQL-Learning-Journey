---  Business Scenario ---

/* 
   CRM wants a short list of customers who buy more than the average customer so they can test a loyalty perk that rewards higher engagement.
*/


--- Problem Statement ---

/* 
   Find all customers whose total items purchased are greater than the overall average items purchased per customer. Sort by items purchased, highest first.
*/ 



--- Answer ---  (need to work on this again)

select * from customer;
Select * from sales;
Select * from products;


SELECT
  t.customer_id, c.customer_name, t.items_bought
FROM (
  SELECT s.customer_id, SUM(s.quantity) AS items_bought FROM sales s
  GROUP BY s.customer_id
) AS t
JOIN customer c
  ON c.customer_id = t.customer_id
WHERE t.items_bought > (
  SELECT AVG(total_items)
  FROM (
    SELECT SUM(quantity) AS total_items
    FROM sales
    GROUP BY customer_id
  ) AS per_customer
)
ORDER BY t.items_bought DESC;