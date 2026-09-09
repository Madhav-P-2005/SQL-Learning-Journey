--- CEIL :-  This function returns the smallest integer value that is greater than or equal to a number

--- FLOOR :- This function returns the largest value that is equal to or less than a number.

Select * from sales;

Select order_line,  sales, ceil(sales), floor(sales) from sales;


--- RANDOM :- The random function will return a value between 0(inclusive) and 1(exclusive), so value>=0 and value<=1

/* 
    a = 10 
	b = 50 
*/ 

--- Finding Decimal Part ---

select random(), random()*40+10;

--- Finding Integer Value ---

Select random(), floor(random()*40)+10;

/*
   SETSEED :- If we set the seed by calling the setseed function , then the random function will return a repeatable sequence of random numbers that is derived from the seed.
   Seed can have a value between 1.0 and -1.0 , inclusive.
*/

Select setseed(0.5);

Select random(); -- 0.98

select random(); -- 0.82

--- ROUND :- This function returns a number rounded to a certain number of decimal places

Select * from sales;

Select order_line, sales , round(sales) from sales order by sales desc;

--- POWER :- This funtion returns m raised to the nth power 

Select * from customer;

Select power(age, 2) , age from Customer; 