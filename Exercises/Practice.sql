--- SQL PRACTICE ---

--- CREATE TABLE & INSERT DATA ---

-- Create a table with basic customer information
CREATE TABLE Customer_Table (
    Cust_id INT,
    First_Name VARCHAR,
    Last_Name VARCHAR,
    Age INT,
    Email_Id VARCHAR
);

-- View table data
SELECT * FROM Customer_Table;

--- INSERT DATA ---

-- Single row without specifying column names
INSERT INTO Customer_Table
VALUES (1, 'Raj', 'Kapoor', 40, 'rajkapoor@gmail.com');

-- Single row with column names specified
INSERT INTO Customer_Table (Cust_id, First_Name, Last_Name, Age, Email_Id)
VALUES (2, 'Karan', 'Jha', 35, 'karanjha@gmail.com');

-- Insert multiple rows
INSERT INTO Customer_Table
VALUES
    (3, 'Pankaj', 'Tripati', 25, 'pankajtripati@gmail.com'),
    (4, 'Shruti', 'Hasan', 38, 'shrutihasan@gmail.com'),
    (5, 'Kabir', 'Das', 50, 'kabirdas@gmail.com');

--- IMPORT DATA USING COPY ---

-- Import CSV data
COPY Customer_Table
FROM 'E:\Program Files\PostgreSQL\18\data\copy.csv'
DELIMITER ','
CSV HEADER;

-- Import text data
COPY Customer_Table
FROM 'E:\Program Files\PostgreSQL\18\data\copytext.txt'
DELIMITER ',';

-- Note: '&' as a delimiter will cause an error if the file format does not match.

--- SELECT ---

-- Select one column
SELECT First_Name
FROM Customer_Table;

-- Select multiple columns
SELECT First_Name, Last_Name
FROM Customer_Table;

-- Select all columns
SELECT *
FROM Customer_Table;

--- DISTINCT ---

-- Remove duplicate values from one column
SELECT DISTINCT First_Name
FROM Customer_Table;

-- DISTINCT applies to the combination of selected columns
SELECT DISTINCT First_Name, Age
FROM Customer_Table;

-- DISTINCT * removes completely duplicate rows
SELECT DISTINCT *
FROM Customer_Table;

--- WHERE CONDITIONS ---

-- Equals to
SELECT First_Name
FROM Customer_Table
WHERE Age = 25;

-- Greater than
SELECT First_Name, Age
FROM Customer_Table
WHERE Age > 25;

-- Matching text
SELECT *
FROM Customer_Table
WHERE First_Name = 'Pankaj';

--- AND / OR / NOT ---

-- AND: both conditions must be true
SELECT First_Name, Last_Name, Age
FROM Customer_Table
WHERE Age > 20
  AND Age < 30;

-- OR: at least one condition must be true
SELECT First_Name, Last_Name, Age
FROM Customer_Table
WHERE Age < 20
   OR Age >= 30;

-- NOT: reverses the condition
SELECT First_Name, Last_Name, Age
FROM Customer_Table
WHERE NOT Age = 25;

-- Combining NOT with AND
SELECT First_Name, Last_Name, Age
FROM Customer_Table
WHERE NOT Age = 25
  AND NOT First_Name = 'Jay';

--- UPDATE ---

-- Check the row before updating
SELECT *
FROM Customer_Table
WHERE Cust_id = 2;

-- Update a single row
UPDATE Customer_Table
SET Age = 17,
    Last_Name = 'Pe'
WHERE Cust_id = 2;

-- Update multiple rows
UPDATE Customer_Table
SET Email_Id = 'gee@xyz.com'
WHERE First_Name = 'Gee'
   OR First_Name = 'gee';

--- DELETE ---

-- Delete a single row
DELETE FROM Customer_Table
WHERE Cust_Id = 6;

-- Delete multiple rows
DELETE FROM Customer_Table
WHERE Age > 25;

-- Delete all rows from the table
DELETE FROM Customer_Table;

--- ALTER TABLE ---

SELECT *
FROM Customer_Table;

--- ADD COLUMN ---

ALTER TABLE Customer_Table
ADD test VARCHAR(255);

--- DROP COLUMN ---

ALTER TABLE Customer_Table
DROP COLUMN test;

--- CHANGE DATA TYPE ---

ALTER TABLE Customer_Table
ALTER COLUMN Age TYPE VARCHAR(255);

--- RENAME COLUMN ---

ALTER TABLE Customer_Table
RENAME COLUMN Email_Id TO Customer_Email_Id;

--- CONSTRAINTS ---

--- NOT NULL ---

-- Add NOT NULL constraint
ALTER TABLE Customer_Table
ALTER COLUMN Cust_id SET NOT NULL;

-- This will fail because Cust_id is NULL
INSERT INTO Customer_Table
    (First_Name, Last_Name, Age, Customer_Email_Id)
VALUES
    ('Madhav', 'P', 20, 'madhavp@gmail.com');

-- Remove NOT NULL constraint
ALTER TABLE Customer_Table
ALTER COLUMN Cust_id DROP NOT NULL;

-- Now NULL Cust_id values are allowed
INSERT INTO Customer_Table
    (First_Name, Last_Name, Age, Customer_Email_Id)
VALUES
    ('Madhav', 'P', 20, 'madhavp@gmail.com');

--- CHECK CONSTRAINT ---

-- Add a CHECK constraint
ALTER TABLE Customer_Table
ADD CONSTRAINT chk_cust_id
CHECK (Cust_id > 0);

-- This will fail because Cust_id is not greater than 0
INSERT INTO Customer_Table
VALUES (-1, 'Madhav', 'P', 20, 'madhavp@gmail.com');

--- PRIMARY KEY ---

ALTER TABLE Customer_Table
ADD PRIMARY KEY (Cust_id);

--- FOREIGN KEY ---

-- Create a child table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    cust_id INT,
    order_date DATE
);

-- Add a foreign key referencing the parent table
ALTER TABLE Orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (cust_id)
REFERENCES Customer_Table (Cust_id);

--- SUPERMART DATABASE ---

SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Sales;

--- IN OPERATOR ---

-- IN is a shorter way to check multiple possible values
SELECT *
FROM Customer
WHERE City IN ('Philadelphia', 'Seattle');

-- Equivalent OR condition
SELECT *
FROM Customer
WHERE City = 'Philadelphia'
   OR City = 'Seattle';

--- BETWEEN OPERATOR ---

-- BETWEEN checks whether a value falls within a range
SELECT *
FROM Customer
WHERE Age BETWEEN 20 AND 30;

-- Equivalent condition
SELECT *
FROM Customer
WHERE Age >= 20
  AND Age <= 30;

-- NOT BETWEEN excludes the specified range
SELECT *
FROM Customer
WHERE Age NOT BETWEEN 20 AND 30;

--- BETWEEN WITH DATES ---

SELECT *
FROM Sales
WHERE Ship_Date BETWEEN '2015-04-01' AND '2016-04-01';

--- LIKE OPERATOR ---

-- Names starting with J
SELECT Customer_Name
FROM Customer
WHERE Customer_Name LIKE 'J%';

-- Names containing "Nelson"
SELECT Customer_Name
FROM Customer
WHERE Customer_Name LIKE '%Nelson%';

-- Names with at least four characters
SELECT Customer_Name
FROM Customer
WHERE Customer_Name LIKE '____%';

--- LIKE WITH NOT ---

-- Cities that do not start with S
SELECT DISTINCT City
FROM Customer
WHERE City NOT LIKE 'S%';

--- ESCAPING WILDCARDS ---

-- Search for a literal % character
SELECT *
FROM Customer
WHERE Customer_Name LIKE 'G\%';

--- ORDER BY ---

-- Sort customer names in ascending order
SELECT *
FROM Customer
WHERE State = 'California'
ORDER BY Customer_Name;

-- Sort customer names in descending order
SELECT *
FROM Customer
WHERE State = 'California'
ORDER BY Customer_Name DESC;

-- Multiple sorting conditions
SELECT *
FROM Customer
ORDER BY City ASC, Customer_Name DESC;

-- Sort using column position
SELECT *
FROM Customer
ORDER BY 2 DESC;

-- Filter and then sort by multiple columns
SELECT *
FROM Customer
WHERE Age >= 20
ORDER BY City ASC, Customer_Name DESC;

-- Sort by age descending
SELECT *
FROM Customer
ORDER BY Age DESC;

--- LIMIT ---

-- Get the 8 oldest customers with age >= 25
SELECT *
FROM Customer
WHERE Age >= 25
ORDER BY Age DESC
LIMIT 8;

-- Get the 10 youngest customers with age >= 25
SELECT *
FROM Customer
WHERE Age >= 25
ORDER BY Age ASC
LIMIT 10;

--- AS / ALIAS ---

-- Rename columns in the result using aliases
SELECT
    Customer_ID AS "Serial Number",
    Customer_Name AS "Name",
    Age AS "Customer Age"
FROM Customer;

--- AGGREGATE FUNCTIONS ---

--- COUNT ---

-- Count all sales records
SELECT COUNT(*) AS "Total No of Sales"
FROM Sales;

-- Count products/orders for a specific customer
SELECT
    COUNT(Order_Line) AS "Number of Products Ordered",
    COUNT(DISTINCT Order_ID) AS "Number of Orders"
FROM Sales
WHERE Customer_ID = 'CG-12520';

--- SUM ---

-- Total profit
SELECT SUM(Profit) AS "Total Profit"
FROM Sales;

-- Total quantity sold for a product
SELECT SUM(Quantity) AS "Total Quantity"
FROM Sales
WHERE Product_ID = 'FUR-TA-10000577';

--- AVG ---

-- Average customer age
SELECT AVG(Age) AS "Average Customer Age"
FROM Customer;

-- Average sales commission at 10%
SELECT AVG(Sales * 0.10) AS "Average Sales Commission"
FROM Sales;

--- MIN / MAX ---

-- Minimum sales in June 2015
SELECT MIN(Sales) AS "Minimum Sales of June 15"
FROM Sales
WHERE Order_Date BETWEEN '2015-06-01' AND '2015-06-30';

-- View June 2015 sales from lowest to highest
SELECT Sales
FROM Sales
WHERE Order_Date BETWEEN '2015-06-01' AND '2015-06-30'
ORDER BY Sales ASC;

-- Maximum sales in June 2015
SELECT MAX(Sales) AS "Maximum Sales of June 15"
FROM Sales
WHERE Order_Date BETWEEN '2015-06-01' AND '2015-06-30';

--- GROUP BY ---

-- Count customers by region and state
SELECT
    Region,
    State,
    COUNT(Customer_ID) AS "Customer Count"
FROM Customer
GROUP BY Region, State;

-- Total quantity sold for each product
SELECT
    Product_ID,
    SUM(Quantity) AS "Quantity Sold"
FROM Sales
GROUP BY Product_ID
ORDER BY "Quantity Sold" DESC;

-- Sales statistics for each customer
SELECT
    Customer_ID,
    MIN(Sales) AS "Minimum Sales",
    MAX(Sales) AS "Maximum Sales",
    AVG(Sales) AS "Average Sales",
    SUM(Sales) AS "Total Sales"
FROM Sales
GROUP BY Customer_ID
ORDER BY "Total Sales" DESC
LIMIT 5;

--- HAVING ---

-- HAVING filters groups after GROUP BY
SELECT
    Region,
    COUNT(Customer_ID) AS "Customer_Count"
FROM Customer
GROUP BY Region
HAVING COUNT(Customer_ID) > 200;

-- WHERE filters rows before grouping;
-- HAVING filters the resulting groups
SELECT
    Region,
    COUNT(Customer_ID) AS "Customer_Count"
FROM Customer
WHERE Customer_Name LIKE 'A%'
GROUP BY Region
HAVING COUNT(Customer_ID) > 15;

--- CASE EXPRESSION ---

-- CASE works like an IF / ELSE condition
SELECT
    *,
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age > 60 THEN 'Senior Citizen'
        ELSE 'Middle aged'
    END AS Age_Category
FROM Customer;

--- JOINS ---

--- Preparing the data ---

-- Create a table containing sales from 2015
CREATE TABLE sales_2015 AS
SELECT *
FROM Sales
WHERE Ship_Date BETWEEN '2015-01-01' AND '2015-12-31';

SELECT COUNT(*) FROM sales_2015;                     -- 2131
SELECT COUNT(DISTINCT Customer_ID) FROM sales_2015; -- 578

-- Create a table containing customers aged 20 to 60
CREATE TABLE customer_20_60 AS
SELECT *
FROM Customer
WHERE Age BETWEEN 20 AND 60;

SELECT COUNT(*) FROM customer_20_60;                 -- 597

-- Check customer IDs in both tables
SELECT Customer_ID
FROM sales_2015
ORDER BY Customer_ID;

SELECT Customer_ID
FROM customer_20_60
ORDER BY Customer_ID;

-- INNER JOIN :- returns only matching records from both tables

SELECT
    a.Order_Line,
    a.Product_ID,
    a.Customer_ID,
    a.Sales,
    b.Customer_Name,
    b.Age
FROM sales_2015 AS a
INNER JOIN customer_20_60 AS b
    ON a.Customer_ID = b.Customer_ID
ORDER BY a.Customer_ID;

-- LEFT JOIN :-  Returns all rows from the left table , even if there are no matches in the right table 

/* 
  AA-10315 not present in customer_20_60 table 
  AA-10375 present in both
  AA-10480 not present in sales_2015 table 
*/

SELECT
    a.Order_Line,
    a.Product_ID,
    a.Customer_ID,
    a.Sales,
    b.Customer_Name,
    b.Age
FROM sales_2015 AS a
LEFT join  customer_20_60 AS b
    ON a.Customer_ID = b.Customer_ID
ORDER BY a.Customer_ID;

-- RIGHT JOIN :-  Returns all rows from the right table , even if there are no matches in the left table.

SELECT
    a.Order_Line,
    a.Product_ID,
    a.Customer_ID,
    a.Sales,
    b.Customer_Name,
    b.Age
FROM sales_2015 AS a
right join  customer_20_60 AS b
    ON a.Customer_ID = b.Customer_ID
ORDER BY a.Customer_ID;

-- FULL OUTER JOIN :-  Combines the results of both left and right outer joins.

SELECT
    a.order_line,
    a.product_id,
    a.customer_id,
    a.sales,
    b.customer_name,
    b.age,
	b.customer_id
FROM sales_2015 AS a
full join  customer_20_60 AS b
    ON a.customer_id = b.customer_id
ORDER BY a.customer_id , b.customer_id;

-- CROSS JOIN :-  Creates a cartesian product between two sets of data.

create table month_values (MM integer);
create table year_values (YYYY integer);

insert into month_values values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);
insert into year_values values (2011),(2012),(2013),(2014),(2015),(2016),(2017),(2018),(2019);

select * from month_values;
select * from year_values;

select 
    a.YYYY,
	b.MM
from year_values as a , month_values as b order by a.YYYY , b.MM;

--- Combining Queries (intersect , except and Union):- Are used to combine the results of two SELECT queries 

--- Intersect :- Is used to find the common rows from the results of two select queries 

--- Intersect All :- Allows duplicates in the result . 

select customer_id from sales_2015 intersect select customer_id from customer_20_60;

--- Except :- Is used to return all rows in the first Select statement that are not returned by the second Select statement.

select customer_id from sales_2015
except 
select customer_id from customer_20_60
order by customer_id;

--- UNION :- Is used to combine the result sets of 2 or more select statements . It removes duplicate rows between the various select statements.

Select customer_id from sales_2015
union
select customer_id from customer_20_60
order by customer_id;

--- SUBQUERY :- Is a query within a query . These subqueries can reside in the WHERE clause , the FROM clause , or the SELECT clause .

-- Use-Case with WHERE Part --
select * from sales
where customer_id in (select customer_id from customer where age>60);

-- Use-Case with FROM Part --
Select 
      p.product_id,
	  p.product_name,
	  p.category,
	  sub_query_result.quantity
from product as p
left join (select product_id,
                  sum(quantity) as quantity
				  from sales group by product_id) as sub_query_result
on p.product_id=sub_query_result.product_id
order by sub_query_result.quantity desc;

-- Use-Case with Select Part --

Select 
      Customer_id,
	  Order_line,
	  (Select customer_name from customer where customer.customer_id=sales.customer_id)
from sales
order by customer_id;


--- VIEW :- Is not a Physical table , it is a virtual table created by a query joining one or more tables.

Create View logistics AS 
Select a.order_line,
       a.order_id,
	   c.customer_name,
	   c.city,
	   c.state,
	   c.country
FROM sales as a
LEFT JOIN customer as c
on a.customer_id = c.customer_id
order by a.order_line;

--- Display View ---
Select * from logistics;

--- Drop View ---
drop view logistics;
--- CREATE OR REPLACE VIEW can be used instead of just CREATE VIEW