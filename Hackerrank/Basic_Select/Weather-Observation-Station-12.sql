-- Q :- https://www.hackerrank.com/challenges/weather-observation-station-12/problem?isFullScreen=true

SELECT distinct CITY from STATION where NOT(CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u') AND NOT(CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%');