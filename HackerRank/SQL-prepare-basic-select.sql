-- Revising the Select Query I
/*Query all columns for all American cities in the CITY table with populations larger than 100000. 
The CountryCode for America is USA. The CITY table is described as follows:*/
ANSWER: 
SELECT * FROM CITY WHERE POPULATION > 100000 AND COUNTRYCODE = "USA";


-- Revising the Select Query II
/*Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
The CountryCode for America is USA. The CITY table is described as follows:*/
ANSWER:  
select NAME from CITY where POPULATION > 120000 and COUNTRYCODE = 'USA';


-- Select All
/*Query all columns (attributes) for every row in the CITY table. The CITY table is described as follows:)*/
ANSWER: 
SELECT * FROM CITY;


-- Select by ID
/* Query all columns for a city in CITY with the ID 1661. The CITY table is described as follows:*/
ANSWER: 
select * from CITY where ID=1661;


-- Select by ID
/*Query all columns for a city in CITY with the ID 1661. The CITY table is described as follows:*/
ANSWER: 
select * from CITY where ID=1661;


-- Japanese cities attributes
/*Query all attributes of every Japanese city in the CITY table. 
The COUNTRYCODE for Japan is JPN. The CITY table is described as follows:*/
ANSWER: 
select * from CITY where COUNTRYCODE = 'JPN';


-- Weather Observation Station 1
/*Query a list of CITY and STATE from the STATION table. The STATION table is described as follows:*/
ANSWER: 
select CITY , STATE from STATION;


-- Weather Observation Station 3
/* Query a list of CITY names from STATION for cities that have an even ID number. 
Print the results in any order, but exclude duplicates from the answer The STATION table is described as follows:*/
ANSWER: 
select distinct CITY from STATION where mod(ID,2)=0 order by CITY asc;


-- Weather Observation Station 4
/*Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
The STATION table is described as follows:*/
ANSWER:
SELECT COUNT(CITY) - COUNT(DISTINCT City)
FROM STATION;


-- Weather Observation Station 5
/*Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically. 
The STATION table is described as follows:*/
ANSWER: 
select CITY, length(CITY) from STATION where length(CITY) = (select min(length(CITY)) from STATION ) order by CITY ASC LIMIT 1;
select CITY, length(CITY) from STATION where length(CITY) = (select max(length(CITY)) from STATION ) order by CITY ASC LIMIT 1;


-- Weather Observation Station 6
/*	Submissions	Leaderboard	Discussions
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
Your result cannot contain duplicates.*/
ANSWER: 
SELECT CITY
FROM STATION
WHERE CITY Like '[AEIOU]%';


-- Weather Observation Station 7
/*Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.*/
ANSWER: 
SELECT DISTINCT CITY 
FROM STATION 
WHERE RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u');


-- Weather Observation Station 8
/*Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.*/
ANSWER: 
SELECT DISTINCT CITY FROM STATION 
WHERE REGEXP_LIKE (UPPER(city),'^[AEIOU].*[AEIOU]$');


-- Weather Observation Station 9
/*Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.*/
ANSWER:
select distinct city from station 
where NOT REGEXP_LIKE (UPPER(city),'^[AEIOU].*$');


-- Weather Observation Station 10
/*Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.*/
ANSWER:
SELECT DISTINCT CITY 
FROM STATION 
WHERE NOT (CITY LIKE '%a' OR  CITY  LIKE '%e' OR CITY  LIKE '%i' OR CITY  LIKE '%o' OR CITY  LIKE '%u')
ORDER BY CITY;


-- Weather Observation Station 11
/*Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
Your result cannot contain duplicates.*/
ANSWER:
SELECT DISTINCT CITY
FROM STATION
WHERE (NOT(CITY  Like 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'O%' OR CITY LIKE 'I%' OR CITY LIKE 'U%'))
		OR 
	  (NOT (CITY LIKE '%a' OR CITY  LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u'))
ORDER BY CITY;


-- Weather Observation Station 12
/*Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
Your result cannot contain duplicates.*/
ANSWER:
select distinct city from station 
where regexp_like(city, '^[^aeiouAEIOU].*[^aeiouAEIOU]$');


-- Higher Than 75 Marks
/*Query the Name of any student in STUDENTS who scored higher than  Marks. 
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
secondary sort them by ascending ID.*/
ANSWER:
SELECT Name FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID;


-- Employee Names
/*Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.*/
ANSWER:
SELECT Name FROM Employee
ORDER BY Name ASC;


-- Employee Salaries
/*Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee 
 * having a salary greater than per month who have been employees for less than  months. 
 * Sort your result by ascending employee_id.*/
ANSWER:
SELECT name FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;