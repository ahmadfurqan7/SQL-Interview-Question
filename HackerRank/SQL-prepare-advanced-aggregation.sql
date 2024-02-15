-- Weather Observation Station 18
/*Consider p1(a,c) and p2(b,d) to be two points on a 2D plane.
a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points p1 and p2 and round it to a scale of 4 decimal places.*/

ANSWER:
SELECT ROUND(ABS(MIN(LAT_N)-MAX(LAT_N))+ABS(MIN(LONG_W)-MAX(LONG_W)),4)
FROM STATION;


-- Weather Observation Station 19
/*Consider p1(a,c) and p2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum 
values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of 
Western Longitude (LONG_W) in STATION. 
Query the Euclidean Distance between points p1 and p2 and format your answer to display 4 decimal digits.*/

ANSWER:
SELECT ROUND(SQRT(POWER(MIN(LAT_N)-MAX(LAT_N),2)+POWER(MIN(LONG_W)-MAX(LONG_W),2)),4)
FROM STATION;


-- Weather Observation Station 20
/*A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.*/

ANSWER:
SELECT ROUND(S.LAT_N, 4) FROM STATION S 
WHERE (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N > S.LAT_N) 
	= (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N < S.LAT_N);