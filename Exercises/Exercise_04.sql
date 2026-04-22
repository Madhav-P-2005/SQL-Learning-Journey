/* 

1. Update the marks of Popeye to 45.
2. Delete the row containing details of student named ‘Robb’.
3. Rename column ‘Name’ to ‘student_name’.

*/ 


--- Ans 1 --- 

Select * from Science_Class;

update Science_Class set Science_Class=45 where Name='Popeye';

alter table Science_Class rename column Science_Class to Science_Marks;

--- Ans 2 --- 

delete from Science_Class where Name='Robb';

--- Ans 3 ---

alter table Science_Class rename column Name to Student_Name;