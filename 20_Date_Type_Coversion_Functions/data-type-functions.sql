--- To_CHAR :- This function converts a number or date to a string 

--- Syntax :- TO_CHAR(value , format_mask)  

--- Converting a number to a String ---
Select sales , 'Total sales value for this order is $' || to_char(sales , '9,999.99') as message from sales;

--- Converting order_date to the format of DD MM YY ---
select order_date, 
       to_char(order_date , 'DD MM YY') from sales;

select order_date, 
       to_char(order_date , 'Month DAY YY') from sales;

--- Converting String to the DATE format 

--- Syntax :-  TO_DATE(string , format_mask)  

Select to_date('2019/01/15' , 'YYYY/MM/DD');

Select to_date('26122018' , 'DDMMYYYY');

--- Converting String to a Number --- 

Select to_number()