/* 

1) Get data with all columns of sales table, and customer name, customer 
age, product name and category are in the same result set. (use JOIN in 
subquery)

*/


--- Ans 1 ---

select * from sales;
select * from customer;
select * from product;

SELECT 
    c.customer_id,
    c.customer_name,
    c.age,
    sp.*
FROM customer AS c 
RIGHT JOIN ( 
    SELECT 
        s.*,
        p.product_name,
        p.category
    FROM sales AS s 
    LEFT JOIN product AS p
        ON s.product_id = p.product_id
) AS sp
ON c.customer_id = sp.customer_id;