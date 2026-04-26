--- Creation of the Database with Columns --- 

create table Customer_Table(Cust_id int, First_Name varchar,Last_Name varchar,Age int,Email_Id varchar);

---- Desc Database ---

Select * from Customer_Table;

-----------------------------------------------

--- Single Row (Without Columns names Specified) 
insert into Customer_Table values(1,'Raj','Kapoor',40,'rajkapoor@gmail.com');

--- Single Row (With Columns Specified)
insert into Customer_Table(Cust_id,First_Name,Last_Name,Age,Email_Id)values(2,'Karan','Jha',35,'karanjha@gmail.com');

--- Multiple Rows -------
insert into Customer_Table values(3, 'Pankaj', 'Tripati', 25,'pankajtripati@gmail.com'),(4, 'Shruti', 'Hasan', 38,'shrutihasan@gmail.com'),(5,'Kabir','Das',50,'kabirdas@gmail.com');

---  Import Data(CSV & TEXT) from File Using Copy Command  --- 

copy Customer_Table from 'E:\Program Files\PostgreSQL\18\data\copy.csv' Delimiter ',' csv header; 

---- Text Data ---

copy Customer_Table from 'E:\Program Files\PostgreSQL\18\data\copytext.txt' Delimiter ',';

--- Note :- '&' as Delimiter => Error.


--- Select one Column ---

select First_Name from Customer_Table;

--- Select multiple columns ---

select First_Name,Last_Name from Customer_Table;

--- Select all columns ---

select * from Customer_Table;


--- To Eliminate Duplicate Records --

--- Select one Column ---

select distinct First_Name from Customer_Table;

--- Select muliple Columns --

select distinct First_Name, Age from Customer_Table;

--- Fetch Based on uniqueId ---

Select distinct * from Customer_Table;


--- Equals To Condition ---

Select First_Name from Customer_Table where age = 25;

--- Less than/Greater than condition ---

Select First_Name, Age from Customer_Table where age>25;

--- Matching text condition ---

Select * from Customer_Table where First_Name='Pankaj';


--- AND , OR and NOT Operator ---

Select First_Name , Last_Name , Age from Customer_Table where Age>20 and Age<30;

Select First_Name , Last_Name , Age from Customer_Table where Age<20 or age>=30;

Select First_Name, Last_Name, Age from Customer_Table where NOT age=25;

Select First_Name, Last_Name, Age from Customer_Table where not age=25 and not First_Name='Jay';


--- UPDATE Query --- 
--- Single Row (With Column Names Specified) ---

Select * from Customer_Table where Cust_id=2;

Update Customer_Table set Age=17, Last_Name='Pe' where Cust_id=2;

--- Multiple Rows ---

update Customer_Table set email_id='gee@xyz.com' where First_Name='Gee' or First_Name='gee';


---  DELETE Query ---

--- Single Row ---

Delete from Customer_Table where Cust_Id=6;

--- Multiple Rows --- 

delete from Customer_Table where age>25;

--- All rows ---

delete from customer_Table;


--- Alter Query ---

Select * from Customer_Table;

--- Add Column ---

alter table Customer_Table add test varchar(255);

--- Delete Column ---

alter table Customer_Table drop test;

alter table Customer_table drop column test;

--- Adding a Data Type --- 

alter table Customer_Table alter column age type varchar(255);

--- Rename a Column --- 

alter table Customer_Table rename column email_id to customer_email_id;

--- Add a Constraint ---

alter table Customer_Table alter column cust_id set not null;

insert into Customer_Table(first_name,last_name,age,customer_email_id) values('Madhav','P',20,'madhavp@gmail.com');

--- Remove a Constraint ---

alter table Customer_Table alter column cust_id drop not null;

insert into Customer_Table(first_name,last_name,age,customer_email_id) values('Madhav','P',20,'madhavp@gmail.com');


-- Add a CHECK constraint ---

ALTER TABLE Customer_Table ADD CONSTRAINT chk_cust_id CHECK (cust_id > 0);  --- My Way ---

alter table Customer_Table add constraint cust_id check (cust_id>0);

insert into Customer_Table values(-1,'Madhav','P',20,'madhavp@gmail.com');

--- Add a Primary Key ---

alter table Customer_Table add primary key (cust_id);

--- Add a Foreign Key ---

-- First create a parent table to reference
create table Orders(
    order_id int primary key,
    cust_id int,
    order_date date
);

-- Now add foreign key on Orders referencing Customer_Table
alter table Orders 
add constraint fk_customer 
foreign key (cust_id)            -- column in THIS (child) table
references Customer_Table(cust_id); -- column in PARENT table



-------   SuperMart_DB (Practice) -----

Select * from Customer;

Select * from Product;

Select * from Sales;


--- IN Operator  --- 

--- IN is Basically a Replacement for Multiple OR's ---
select * from Customer where city in ('Philadelphia' , 'Seattle');

select * from Customer where city = 'Philadelphia' or city='Seattle';


--- Between Operator (for finding Range) ---

--- Between is Basically a Replacement for Multiple OR's ---
Select * from Customer where age between 20 and 30;

Select * from Customer where age>=20 and age<=30;

--- Clubbing Between and Not Statement ---

Select * from Customer where age not Between 20 and 30;

--- Using with Date ---

Select * from Sales;

Select * from Sales where ship_date between '2015-04-01' and '2016-04-01';

--- LIKE Operator (Pattern Matching using WildCards) ---

Select Customer_Name from Customer where Customer_Name LIKE 'J%';

Select Customer_Name from Customer where Customer_Name LIKE '%Nelson%';

Select Customer_Name from Customer where Customer_Name LIKE '____%';

--- Cubbing With LIKE and NOT Operator --- 
Select distinct City from Customer where City not Like 'S%';

--- Finding Out Customer Name With G% ? ---
Select * from Customer where Customer_Name LIKE 'G\%';


--- Order By Operator --- 

Select * from Customer where state='California' order by Customer_Name;

Select * from Customer where state='California' order by Customer_Name DESC;

Select * from Customer where state='California' order by Customer_Name DESC;

Select * from Customer order by city asc, customer_name desc;

Select * from Customer order by 2 desc;

Select * from Customer where age>=20 order by city asc,customer_name desc;

Select * from Customer order by age desc;

--- LIMIT Operator ---

Select * from Customer where age>=25 order by age desc limit 8;

Select * from Customer where age>=25 order by age asc limit 10;


--- AS Operator (Alias) ---

select customer_id as "Serial Number", customer_name as "Name" , age as "Customer Age" from Customer;


--- Aggregate Functions ---

--- COUNT Function ---

Select count(*) as "Total No of Sales" from Sales;

Select count(order_line) as "Number of Products Orders" , count(Distinct order_id) as "Number of Orders" from Sales where Customer_id='CG-12520';

--- SUM Function ---

Select sum(profit) as "Total Profit" from Sales;

Select SUM(quantity) as "Total Quantity" from Sales where Product_id='FUR-TA-10000577';

--- AVERAGE Function ---

Select avg(age) as "Average Customer Age" from Customer;

Select avg(sales * 0.10) as "Average Sales Commission" from Sales;

--- MIN & MAX Functions ---

Select min(sales) as "Minimum Sales of June15" from Sales where order_date between '2015-06-01' and '2015-06-30';

Select sales from Sales where order_date between '2015-06-01' and '2015-06-30' order by sales asc;

Select max(sales) as "Maximum Sales of June 15" from Sales where order_date between '2015-06-01' and '2015-06-30';


--- Group By Clause ---

Select region , state ,  count(Customer_id) as "Customer Count" from Customer group by region, state;

Select product_id , sum(quantity) as "Quantity Sold" from Sales group by product_id order by "Quantity Sold" desc; 

Select customer_id, min(sales) as "Minimum Sales" , max(sales) as "Maximum Sales" , avg(sales) as "Average Sales", sum(sales) as "Total Sales" from Sales group by customer_id order by "Total Sales" desc limit 5;