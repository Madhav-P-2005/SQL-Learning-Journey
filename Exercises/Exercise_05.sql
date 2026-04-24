/* 

1. Backup this database into a TAR file
2. Drop the 'science_class' table
3. Restore from the backup file to get back the deleted table

*/

--- Ans 1 --- 
--- Right Click on Database => Backup => Filename: E:\Program Files\PostgreSQL\18\data\Science_Class_Backupfile , Format: Tar => Click on Backup.

--- Ans 2 ---
drop table if exists science_class;
select * from science_class; -- should give error => confirms table is deleted

--- Ans 3 ---
--- Right Click on Database => Restore => 
--- General Tab: Filename: E:\Program Files\PostgreSQL\18\data\Science_Class_Backupfile , Format: Custom or tar
--- Query Options Tab: Turn ON "Clean before restore" (important! avoids duplicate table errors)
--- Click on Restore.

--- Note: pg_restore may show a warning "table does not exist" during clean step - this is normal and can be ignored.
--- Verify restore worked:
select * from science_class;