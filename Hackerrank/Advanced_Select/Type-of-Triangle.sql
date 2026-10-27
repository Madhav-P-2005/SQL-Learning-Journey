-- Q :- https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true

SELECT 
     CASE 
         WHEN (A+B) <= C OR (A+C) <= B OR (B+C) <=A then 'Not A Triangle'
         WHEN (A = B) AND (B = C) then 'Equilateral'
         WHEN (A != B) AND (B != C) AND (A != C) then 'Scalene'
         WHEN (A = B) OR (A = C) OR (B = C) then 'Isosceles'
     END
FROM TRIANGLES;