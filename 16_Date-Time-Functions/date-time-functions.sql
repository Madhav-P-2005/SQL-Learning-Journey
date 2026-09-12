--- CURRENT_DATE :- This function returns current date as 'YYYY-MM-DD' format.

Select CURRENT_DATE;

--- CURRENT_TIME :- This function returns the current time with the time zone as 'HH:MM:SS.GMT+TZ' format. 

Select CURRENT_DATE , CURRENT_TIME(1) , CURRENT_TIME(3);

--- CURRENT_TIMESTAMP :- This function returns the current date and time with the time zone as 'YYYY-MM-DD HH:MM:SS.GMT+TZ' format

Select CURRENT_DATE , CURRENT_TIME(1) , CURRENT_TIME(3) , CURRENT_TIMESTAMP;


--- AGE :- This function returns the number of years , months , and days between two dates.

Select * from Sales;

Select age('2014-04-25' , '2014-01-01');

Select order_line, order_date, ship_date, 
       age(ship_date , order_date) as time_taken
from sales
order by time_taken desc;

--- Extract :- This function extracts parts from a date.

--- extract day ---

Select EXTRACT(day from current_date);

--- extract hour ---

Select current_timestamp, extract(hour from current_timestamp);

--- extract minute ---

Select extract(minute from current_time);

--- difference btw two dates in seconds ---
Select order_date, 
       ship_date,
       (extract(epoch from ship_date) - extract(epoch from order_date)) as seconds_taken
from sales;