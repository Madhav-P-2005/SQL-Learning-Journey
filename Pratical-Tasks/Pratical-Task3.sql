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
Select count(vin) as total_number_of_electric_vehicles from electric_vehicle_population group by state;