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


