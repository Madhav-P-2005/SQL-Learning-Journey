-- Q :- https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=true

-- MySQL --
SELECT Name from STUDENTS where Marks > 75 ORDER By RIGHT(Name , 3) ASC , ID ASC;

-- PostgrelSQL --
SELECT Name from STUDENTS where Marks > 75 ORDER By SUBSTRING(Name , -3) ASC , ID ASC;