/*
Title:
Exploratory Analysis of Used Cars Dataset
*/

/*
Objective: 
Analyze the used cars data to gain insights into various aspects such as pricing trends, popular car models, fuel types, Ownership Patterns etc.
*/

/*
Tools:
SQL database (e.g., MySQL) for data storage and querying.
*/ 

/*
Tasks:
Data Import: Load the provided dataset into the SQL database.
Data Exploration: Examine the structure and contents of the dataset.
Data Analysis: Perform various SQL queries to answer specific questions and derive insights.
*/

-- Data Import:
create database Cars;
use Cars;

-- Data Exploration:
select * from car_dekho;
describe car_dekho;

-- Data Analysis:
-- 1) Total Cars to get a count of total record
 select count(*) as Total_CARS from car_dekho;
 
 -- 2) The manager asked the employee How many cars is available in respected year
select year, count(*) as Avaliable_Cars from car_dekho where year in (2020,2021,2022,2019)group by year;
select year,count(*) as Total from car_dekho group by year;

-- 3) Top-selling car models:
select Name, COUNT(*) as Total_Sales from car_dekho
group by Name
order by Total_Sales desc
limit 10;

-- 4) To identify the top 5 most common cars names and models:
select Name, COUNT(*) as Count from car_dekho
group by Name order by Count desc
limit 5;

-- 5) What is the average selling price of cars by fuel type?
select fuel, avg(selling_price) as Avg_Price
from car_dekho
group by fuel;

-- 6) How does mileage affect the selling price?
select mileage, selling_price as Avg_Price
from car_dekho
group by mileage,selling_price;

-- 7) Which seller type has the highest average selling price?
 select seller_type, avg(selling_price) as Avg_Price from car_dekho
group by seller_type;

-- 8) What is the distribution of cars based on transmission type?
select transmission, COUNT(*) as Total_Cars from car_dekho
group by transmission;

-- 9) Average Kilometers Driven by Fuel Type:
select fuel, avg(km_driven) as Avg_Kilometers_Driven from car_dekho
group by fuel;

-- 10) Most Common Owner Type:
select owner, COUNT(*) as Total_Cars from car_dekho
group by owner
order by Total_Cars desc
limit 1;

-- 11) Price Distribution by Car Year:
select year, min(selling_price) as Min_Price, max(selling_price) as Max_Price, avg(selling_price) as Avg_Price
from car_dekho
group by year;

-- 12) Top-selling Car Models by Year:
select year, Name, COUNT(*) as Total_Sales
from car_dekho
group by year, Name
order by Total_Sales desc
limit 10;

-- 13) Average Power by Car Transmission Type:
select transmission, avg(max_power) as Avg_Power from car_dekho
group by transmission;

-- 14) Price Range for Cars with Different Numbers of Seats:
select seats, min(selling_price) as Min_Price, max(selling_price) as Max_Price
from car_dekho
group by seats;

-- 15) To compare the selling prices based on fuel type:
select fuel, 
avg(selling_price) as avg_selling_price,
min(selling_price) as min_selling_price,
max(selling_price) as max_selling_price
from car_dekho
group by fuel;

-- 16) Top 5 car models with the highest horsepower:
select Name, max(max_power) as max_horsepower from car_dekho
group by Name
order by max_horsepower desc
limit 5;