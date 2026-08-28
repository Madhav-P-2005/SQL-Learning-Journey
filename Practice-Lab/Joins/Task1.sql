---  Business Scenario ---

/* 
    Loyal, high-frequency buyers are the backbone of revenue and word-of-mouth growth. Leadership wants to identify the 100 customers who’ve purchased the most items across all time so the CRM team can surprise-and-delight them with perks, early access, and referral incentives.
*/


--- Problem Statement ---

/* 
    Find our top 100 customers by total items purchased so we can create a high-value loyalty segment for rewards and advocacy.  
*/ 



--- Answer ---

Select * from sales;
Select * from customer;

SELECT
  s.customer_id,
  c.customer_name,
  SUM(s.quantity) AS items_bought
FROM sales AS s
INNER JOIN customer AS c
  ON s.customer_id = c.customer_id
GROUP BY s.customer_id, c.customer_name
ORDER BY items_bought DESC
LIMIT 100;