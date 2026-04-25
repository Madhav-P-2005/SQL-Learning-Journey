/*

1. Retrieve all orders where ‘discount’ value is greater than zero ordered in descending order basis ‘discount’ value.

2. Limit the number of results in above query to top 10

*/


--- Ans 1 ---

select * from sales where discount > 0 order by discount desc;

--- Ans 2 ---

select * from sales where discount > 0 order by discount desc limit 10;