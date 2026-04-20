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