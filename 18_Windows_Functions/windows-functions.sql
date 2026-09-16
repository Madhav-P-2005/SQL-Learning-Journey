/* 

 1) Windows function provide the ability to perform calculations across sets of rows that are related to the current query row .

 2) Window functions compute their result based on a sliding window frame, a set of rows that are somehow related to the current row.

 3) Unlike Aggregate functions a window function does not cause rows to become grouped into a single output row - the rows retain their separate identities. 

 4) Behind the scenes , the window function can access more than just the current row of the query result. 

*/

select * from customer limit 10;

Select * from sales limit 10;

Select a.*