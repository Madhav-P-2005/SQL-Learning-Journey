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

-- Q6) Calculate the lowest (FLOOR), highest (CEIL), and average (ROUND to two decimal places) chemistry_s core for each career aspirant. Display the career aspirants , lowest score, highest score, and average score.

-- Ans 6 --
Select  career_aspiration , floor(min(chemistry_score)) as lowest_score, ceil(max(chemistry_score)) as highest_score, avg(round(chemistry_score, 2)) from Student_Scores group by career_aspiration;

-- Q7) Find career aspirations where the average history_score is above 85 and at least 5 students aspire to that career. List the career_aspiration and the average score.

-- Ans 7 --
Select career_aspiration , avg(history_score) as average_history_score from Student_Scores group by career_aspiration having avg(history_score) > 85 and count(id)>=5;

-- Q8) Identify students who score above average in both biology and chemistry, compared to the school's average for those subjects. Display their id, first_name, last_name, biology_score, and chemistry_score.

-- Ans 8 --
Select id,first_name, last_name, biology_score, chemistry_score from Student_Scores where biology_score > (select avg(biology_score) from Student_Scores) and chemistry_score > (select avg(chemistry_score) from Student_Scores);

-- Q9) Calculate the percentage of absence days for each student relative to the total absence days recorded for all students. Display the id, first_name, last_name, and the calculated percentage, rounded to two decimal places. Order the results by the percentage in descending ord.

-- Ans 9 --
Select id, first_name, last_name , 
       round(absence_days::decimal / sum(absence_days) over() * 100 , 2) as calculated_absence_percentage 
from Student_Scores 
order by calculated_absence_percentage desc;

-- Q10) Identify students who have scores above 80 in at least three out of the six subjects: math, history, physics, chemistry, biology, and English. Display their id, first_name, last_name, and the count of subjects where they scored above 80.

-- Ans 10 --
Select id, first_name, last_name, 
    (CASE when math_score > 80 then 1 else 0 end + 
	 CASE when history_score > 80 then 1 else 0 end + 
	 CASE when physics_score > 80 then 1 else 0 end +
	 CASE when chemistry_score > 80 then 1 else 0 end +
	 CASE when biology_score > 80 then 1 else 0 end +
	 CASE when english_score > 80 then 1 else 0 end) as subjects_above_80
from Student_Scores
where (CASE when math_score > 80 then 1 else 0 end + 
	 CASE when history_score > 80 then 1 else 0 end + 
	 CASE when physics_score > 80 then 1 else 0 end +
	 CASE when chemistry_score > 80 then 1 else 0 end +
	 CASE when biology_score > 80 then 1 else 0 end +
	 CASE when english_score > 80 then 1 else 0 end)>=3;