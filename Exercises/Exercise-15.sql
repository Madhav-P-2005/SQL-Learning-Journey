/* 

   1) Find out the current age of “Batman” who was born on “April 6, 1939” in Years, months and days.

   2) Analyze and find out the monthly sales of sub-category chair. Do you observe any seasonality in sales of this sub-category.

*/


--- Ans 1 ---

Select age('2026-09-13','1939-04-06');

--- Ans 2 ---

Select * from sales;
Select * from product;

Select  
		extract(month from order_date) as number_of_months,
        sum(sales) as total_sales
from sales where product_id in (Select product_id from product where sub_category='Chairs')
group by number_of_months order by number_of_months;       