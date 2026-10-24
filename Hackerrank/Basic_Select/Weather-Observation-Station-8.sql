-- Q :- https://www.hackerrank.com/challenges/weather-observation-station-8/problem?isFullScreen=true

Select distinct CITY from STATION where 
       (CITY Like 'a%' or CITY Like 'e%' or CITY Like 'i%' or CITY Like 'o%' or CITY Like 'u%')  
       and  
       (CITY Like '%a' or CITY Like '%e' or CITY Like '%i' or CITY Like '%o' or CITY Like '%u')