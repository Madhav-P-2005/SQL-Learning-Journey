/* 

1. Retrieve all data from the table ‘Science_Class’.

2. Retrieve the name of students who have scored more than 60 marks.

3. Retrieve all data of students who have scored more than 35 but less 
than 60 marks.

4. Retrieve all other students i.e. who have scored less than or equal to 
35 or more than or equal to 60.

*/


--- Ans 1 ---

Select * from Science_Class;

--- Ans 2 ---

Select Name, Science_Marks from Science_Class where Science_Marks > 60;

--- Ans 3 ---

Select * from Science_Class where Science_Marks>35 and Science_Marks<60; -- My Way --

Select * from Science_Class where Science_Class between 35 and 60;

--- Ans 4 ---

Select Name from Science_Class where Science_Class<=35 or Science_Class>=60;  -- My Way --

Select * from Science_Class where Science_Class not between 35 and 60;