-- Q :- https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true

(Select CITY , length(CITY) from STATION order by length(CITY) ASC, CITY ASC limit 1) --- Shortest City

UNION ALL

(Select CITY, length(CITY) from STATION order by length(CITY) desc , CITY ASC limit 1); --- Longest city