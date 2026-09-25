--- COALESCE :- This is a function that returns the first non-NULLL value in a list of values

-- Creating the Employee Table ---
create table emp_name (
 s_no int,
 first_name varchar(255),
 middle_name varchar(255),
 last_name varchar(255)
);

truncate table emp_name;

insert into emp_name (s_no , first_name , middle_name , last_name)  values(1,  'Paul' , 'Van' , 'Hugh');
insert into emp_name (s_no , first_name , middle_name , last_name)  values(2,  'David',       , 'Flashing');
insert into emp_name (s_no , first_name , middle_name , last_name)  values(3,         , 'Lena', 'Radford');
insert into emp_name (s_no , first_name , middle_name , last_name)  values(4,  'Henry',       , 'Goldwyn');
insert into emp_name (s_no , first_name , middle_name , last_name)  values(5,                 , 'Holden');
insert into emp_name (s_no , first_name , middle_name , last_name)  values(6,  'Erin' , 'T'   , 'Hull');

Select * from emp_name;