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

-- Ans 1 --
Select career_aspiration, avg(math_score) as average_math_score from Student_Scores group by career_aspiration order by average_math_score desc;

-- Q2) Find the career_aspirations that have an average english_score greater than 75. Display the career aspiration and the average score.

-- Ans 2 --
Select career_aspiration , avg(english_score) as average_english_score from Student_Scores  group by career_aspiration having avg(english_score) > 75 order by average_english_score desc;

-- Q3) Identify students who have a math_score higher than the school's average math score. List their first_name, last_name, and math_score.

-- Ans 3 --
Select first_name , last_name , math_score from Student_Scores where math_score > (Select avg(math_score) from Student_Scores);

-- Q4) Rank students within each career_aspiration category by their physics_score in descending order. Display the first_name, last_name, career_aspiration, physics_score, and the rank.

-- Ans 4 --
Select first_name, last_name , career_aspiration , physics_score , 
       rank() over (partition by career_aspiration order by physics_score desc) as rank_in_career
	   from Student_Scores;

-- Q5) For each student, create a new column full_name by concatenating first_name and last_name with a space in between. Show the full_name and email columns where the email contains the string "academy".

-- Ans 5 --
Select first_name || ' ' || last_name as full_name , email from Student_Scores where email like '%academy%';

-- Q6) Calculate the lowest (FLOOR), highest (CEIL), and average (ROUND to two decimal places) chemistry_score for each career aspirant. Display the career aspirants , lowest score, highest score, and average score.

-- Ans 6 --
Select  career_aspiration , floor(min(chemistry_score)) as lowest_score, ceil(max(chemistry_score)) as highest_score, avg(round(chemistry_score, 2)) from Student_Scores group by career_aspiration;