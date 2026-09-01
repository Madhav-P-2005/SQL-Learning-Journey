---  Business Scenario ---

/* 
   Merchandising wants to highlight over-performing products within Men/Shoes in California—i.e., products whose units sold are above the subcategory’s average (in California).
*/


--- Problem Statement ---

/* 
   For California and Men/Shoes, list products whose total quantity sold is greater than the average product’s quantity in that same segment. Return the top results by units
*/ 



--- Answer --- (need to work on this again)
SELECT
    p.product_id,
    p.product_name,
    SUM(s.quantity) AS total_qty
FROM sales AS s
JOIN products AS p
    ON p.product_id = s.product_id
JOIN customer AS c
    ON c.customer_id = s.customer_id
WHERE p.sub_category = 'Men/Shoes'
  AND c.state = 'California'
GROUP BY
    p.product_id,
    p.product_name
HAVING SUM(s.quantity) > (
    SELECT AVG(prod_qty)
    FROM (
        SELECT
            SUM(s2.quantity) AS prod_qty
        FROM sales AS s2
        JOIN products AS p2
            ON p2.product_id = s2.product_id
        JOIN customer AS c2
            ON c2.customer_id = s2.customer_id
        WHERE p2.sub_category = 'Men/Shoes'
          AND c2.state = 'California'
        GROUP BY p2.product_id
    ) AS avg_table
)
ORDER BY total_qty DESC
LIMIT 10;