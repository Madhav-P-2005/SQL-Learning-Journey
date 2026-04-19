/*

1. Insert the following data into Science_class using insert into command.
 
   1 Popeye 33
   2 Olive 54
   3 Brutus 98

2. Import data from csv file ’Student.csv’ attached in resources to Science_class to insert data of next 8 students

*/


-- Ans 1 ---
insert into Science_Class values(1,'Popeye',33),(2, 'Olive', 54),(3,'Brutus',98);

-- Ans 2 ---
copy Science_Class from 'E:\Program Files\PostgreSQL\18\data\Student.csv' csv header;