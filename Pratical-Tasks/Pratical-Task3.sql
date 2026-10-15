-- Create The Table Structure --
CREATE TABLE electric_vehicle_population (
    vin VARCHAR(10),
    county VARCHAR(50),
    city VARCHAR(100),
    state CHAR(2),
    postal_code VARCHAR(10),
    model_year INT,
    make VARCHAR(50),
    model VARCHAR(100),
    electric_vehicle_type VARCHAR(100),
    cafv_eligibility VARCHAR(100),
    electric_range FLOAT,
    base_msrp FLOAT,
    electric_utility VARCHAR(255)
);

--- Import CSV Data ---
copy electric_vehicle_population from 'E:\Program Files\PostgreSQL\18\data\Electric_Vehicle_Population_Data.csv'
delimiter ',' 
csv header;

Select * from electric_vehicle_population;

/*

I) EV Distribution by State :-

1) Write a query to list the total number of electric vehicles for each state ?

*/

-- Ans 1 --
Select state, count(vin) as total_number_of_electric_vehicles from electric_vehicle_population group by state order by total_number_of_electric_vehicles desc;  -- my way 

/*

II) EVs in Seattle :-

2) Write a query to extract all electric vehicles located in the city of Seattle ?

*/

-- Ans 2 --
Select *  from electric_vehicle_population where city='Seattle';

/*

III) EVs by County :-

3) Write a query to display the total number of electric vehicles for each county ?

*/

-- Ans 3 --
Select county , count(*) as total_number_of_electric_vehicles from electric_vehicle_population group by county order by total_number_of_electric_vehicles desc;

/*
  
IV) MSRP Comparison :- 

4) Write a query to find all electric vehicles with a Base MSRP greater than the average MSRP of all vehicles in the dataset ?
   
*/

-- Ans 4 --
Select * from electric_vehicle_population where base_msrp > (Select avg(base_msrp) from electric_vehicle_population);

/*

V) Plug-in Hybrid Analysis :-

5) Write a query to list all Plug-in Hybrid Electric Vehicles (PHEV) from King County with an electric range greater than 50 miles ?
   
*/

-- Ans 5 --
Select * from electric_vehicle_population;
Select * from electric_vehicle_population where electric_vehicle_type='Plug-in Hybrid Electric Vehicle (PHEV)' and electric_range>50 and county='King';

/*

VI) High-Concentration Cities :-

6) Write a query to count the number of electric vehicles in each city, but only include cities with more than 100 vehicles ?
   
*/

-- Ans 6 --
Select city , count(vin) as number_of_electric_vehicles from electric_vehicle_population  group by city having count(vin) > 100;

/*

VII) Long-Range Vehicles by County :-

7) Write a query to list the Make and Model of electric vehicles located in counties where the average electric range exceeds 150 miles ?
   
*/

-- Ans 7 --
Select * from electric_vehicle_population;

SELECT make , model FROM electric_vehicle_population where county in (Select county from electric_vehicle_population group by county having avg(electric_range)>150);

/*

VIII) Vehicle Categorization :- 

 Write a query to :- 

 8.1) Categorize vehicles as either "Affordable" (Base MSRP ≤ $40,000) or "Expensive" (Base MSRP > $40,000) ? 

 8.2) Find the total number of vehicles in each category ? 

*/

-- Ans 8.1 & 8.2 --
Select 
       CASE 
	          When base_msrp <= 40000 then 'Affordable' 
			  ELSE 'Expensive'
	   END as vehicle_category,
count(*) as total_number_of_vehicles
from electric_vehicle_population 
group by vehicle_category;

/* 

IX) Electric Range Ranking :-

9) Write a query to display the Make, Model, and Electric Range of each vehicle along with its rank based on the electric range within its county (highest range first) ? 

*/

-- Ans 9 --
Select make, model , electric_range,
rank() over(partition by county order by electric_range desc) as highest_range_rank
from electric_vehicle_population;

/*

X) Clean Alternative Fuel Vehicle (CAFV) Analysis with CTEs :-

 Write a query using a Common Table Expression (CTE) to :- 

  10.1) Calculate the total number of electric vehicles and CAFV-eligible vehicles for each state. 

  10.2) Compute the percentage of CAFV-eligible vehicles for each state.

*/

-- Ans 10.1 & 10.2 --
Select * from electric_vehicle_population;

With Total_Number_Of_Electric_and_CAFV_eligible_Vehicles as (
     Select count(*) from electric_vehicle_population where cafv_eligibility='Clean Alternative Fuel Vehicle Eligible')
, Select 