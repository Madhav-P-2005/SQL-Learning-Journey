--- COPY the CSV Data ---

--- Create Table Structure ---
CREATE TABLE Student_Scores (
    id int,
	first_name varchar,
	last_name varchar,
	email varchar,
	gender varchar,
	part_time_job boolean,
	absence_days int,
	extracurricular_activities boolean,
	weekly_self_study_hours int,
	career_aspiration varchar,
	math_score int,
	history_score int,
	physics_score int,
	chemistry_score int,
	biology_score int,
	english_score int,
	geography_score int
);

--- Import the CSV ---

COPY Student_Scores
FROM 'E:\Program Files\PostgreSQL\18\data\student-scores.csv'
DELIMITER ','
CSV HEADER;

Select * from Student_Scores;

-- Q1) Calculate the average math_score for each career_aspiration. Order the results by the average score in descending order.