/* 
    1) Find Maximum length of characters in the Product name string from Product table
	
    2) Retrieve product name, sub-category and category from Product table  and an 
additional column named “product_details” which contains a concatenated string of 
product name, sub-category and category

    3) Analyze the product_id column and take out the three parts composing the product_id
in three different columns

    4) List down comma separated product name where sub-category is either Chairs or 
Tables

*/


--- Ans 1 ---
Select * from Product;

Select  max(length(product_name)) from Product;

--- Ans 2 ---
select * from product;

Select product_name,
       sub_category,
	   category,
	   (product_name||' , '||sub_category||' , '||category) as product_details
from product;

--- Ans 3 ---
Select * from product;

Select product_id from product;

--- Taking out First 3 characters from product_id (FUR) ---
select product_id,
       substring(product_id for 3) as first_three_data,
--- Taking out middle characters from product_id (BO) ---
       substring(product_id from 5 for 6) as middle_data,
--- Taking the last integers from the product_id ---
       substring(product_id , 8 , 15) as last_data
from product;

-- or --

select product_id,
       substring(product_id for 3) as category_short,
--- Taking out middle characters from product_id (BO) ---
       substring(product_id from 5 for 2) as sub_short,
--- Taking the last integers from the product_id ---
       substring(product_id from 8) as id
from product;


--- Ans 4 ---
select product_name , sub_category from product;

Select 
      STRING_AGG(product_name,',') 
from product where sub_category in ('Chairs' , 'Tables');