-- Revising Aggregations - The Count Function
/*Query a count of the number of cities in CITY having a Population larger than 100000.*/
ANSWER :
SELECT COUNT(NAME)
FROM CITY
WHERE POPULATION>100000;


-- Revising Aggregations - The Sum Function
/*Query the total population of all cities in CITY where District is California.*/ 
ANSWER:
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT='California';


-- Revising Aggregations - Averages
/*Query the average population of all cities in CITY where District is California.*/
ANSWER:
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT='California';


-- Average Population
/*Query the average population for all cities in CITY, rounded down to the nearest integer.*/
ANSWER:
SELECT FLOOR(AVG(POPULATION))
FROM CITY;


-- Japan Population
/*Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.*/
ANSWER:
SELECT SUM(POPULATION) FROM CITY
WHERE COUNTRYCODE='JPN';


-- Population Density Difference
/*Query the difference between the maximum and minimum populations in CITY.*/
ANSWER:
SELECT MAX(POPULATION)-MIN(POPULATION)
FROM CITY;


-- The Blunder
/*Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
 * but did not realize her keyboard's  key was broken until after completing the calculation. 
 * She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), 
 * and the actual average salary. 
 * Write a query calculating the amount of error (i.e.:  average monthly salaries), 
 * and round it up to the next integer.*/
ANSWER:
select CEIL(AVG(Salary) - AVG(REPLACE(SALARY, '0', '')))
FROM EMPLOYEES;


-- Top Earners
/*We define an employee's total earnings to be their monthly  worked, 
 * and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
 * Write a query to find the maximum total earnings for all employees as well as the total number 
 * of employees who have maximum total earnings. Then print these values as  space-separated integers.*/
ANSWER:
SELECT salary * months AS earnings, COUNT(*)
FROM Employee
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1;


-- Weather Observation Station 2
/*Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of  decimal places.
The sum of all values in LONG_W rounded to a scale of  decimal places.*/
ANSWER:
SELECT 
    ROUND(SUM(LAT_N), 2),
    ROUND(SUM(LONG_W), 2)
FROM STATION;


-- Weather Observation Station 13
/*Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. 
 * Truncate your answer to 4 decimal places.*/
ANSWER:
SELECT TRUNCATE(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N BETWEEN 38.7880 AND 137.2345;


-- Weather Observation Station 14
/*Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
Truncate your answer to 4 decimal places.*/
ANSWER:
SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;


-- Weather Observation Station 15
/*Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than .
Round your answer to 4 decimal places.*/
ANSWER:
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;


-- Weather Observation Station 16
/*Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. 
Round your answer to 4 decimal places.*/
ANSWER:
SELECT ROUND(MIN(LAT_N), 4)
from STATION
where LAT_N > 38.7780;


-- Weather Observation Station 17
/*Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. 
Round your answer to 4 decimal places.*/
ANSWER:
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N
LIMIT 1;