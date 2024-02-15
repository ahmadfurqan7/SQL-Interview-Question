-- The Report
/*You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
 * Grades contains three columns Grade, Min_Mark and Max_Marks.

Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, 
order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, 
order those particular students by their marks in ascending order.

Write a query to help Eve.*/

ANSWER:
SELECT IF(GRADES.GRADE>=8, STUDENTS.NAME, NULL),GRADES.GRADE, STUDENTS.MARKS
FROM GRADES, STUDENTS
WHERE STUDENTS.MARKS BETWEEN GRADES.MIN_MARK AND GRADES.MAX_MARK
ORDER BY GRADES.GRADE DESC, STUDENTS.NAME;


-- Top Competitors
/*Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
Write a query to print the respective hacker_id and name of hackers 
who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, 
then sort them by ascending hacker_id.*/

ANSWER:
SELECT H.HACKER_ID, H.NAME
FROM HACKERS H
INNER JOIN SUBMISSIONS S
ON H.HACKER_ID = S.HACKER_ID
INNER JOIN CHALLENGES C
ON S.CHALLENGE_ID = C.CHALLENGE_ID
INNER JOIN DIFFICULTY D
ON C.DIFFICULTY_LEVEL = D.DIFFICULTY_LEVEL

WHERE S.SCORE = D.SCORE AND C.DIFFICULTY_LEVEL = D.DIFFICULTY_LEVEL
GROUP BY H.HACKER_ID, H.NAME
HAVING COUNT(S.HACKER_ID) > 1
ORDER BY COUNT(S.HACKER_ID) DESC, S.HACKER_ID ASC;


-- Ollivander's Inventory
/*Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons 
needed to buy each non-evil wand of high power and age. 
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, 
sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age.*/

ANSWER:
SELECT W.ID, P.AGE, W.COINS_NEEDED, W.POWER 
FROM WANDS AS W
JOIN WANDS_PROPERTY AS P
ON (W.CODE = P.CODE) 
WHERE P.IS_EVIL = 0 AND W.COINS_NEEDED = (SELECT MIN(COINS_NEEDED) 
                                          FROM WANDS AS X
                                          JOIN WANDS_PROPERTY AS Y 
                                          ON (X.CODE = Y.CODE) 
                                          WHERE X.POWER = W.POWER AND Y.AGE = P.AGE) 
ORDER BY W.POWER DESC, P.AGE DESC;


-- Challenges
/*Julia asked her students to create some coding challenges. 
Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum 
number of challenges created, then exclude those students from the result.*/

ANSWER:
SELECT H.HACKER_ID, H.NAME, COUNT(C.CHALLENGE_ID) AS C_COUNT
FROM HACKERS H
JOIN CHALLENGES C 
ON C.HACKER_ID = H.HACKER_ID
GROUP BY H.HACKER_ID, H.NAME
HAVING C_COUNT = 
    (SELECT COUNT(C2.CHALLENGE_ID) AS C_MAX
     FROM CHALLENGES AS C2
     GROUP BY C2.HACKER_ID 
     ORDER BY C_MAX DESC LIMIT 1)
OR C_COUNT IN 
    (SELECT DISTINCT C_COMPARE AS C_UNIQUE
     FROM (SELECT H2.HACKER_ID, 
                  H2.NAME, 
                  COUNT(CHALLENGE_ID) AS C_COMPARE
           FROM HACKERS H2
           JOIN CHALLENGES C ON C.HACKER_ID = H2.HACKER_ID
           GROUP BY H2.HACKER_ID, H2.NAME) COUNTS
     GROUP BY C_COMPARE
     HAVING COUNT(C_COMPARE) = 1)
ORDER BY C_COUNT DESC, H.HACKER_ID;


-- Contest Leaderboard
/*The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of  from your result.*/

ANSWER:
SELECT X.hacker_id, 
(SELECT H.NAME FROM HACKERS H
                      WHERE H.HACKER_ID = X.HACKER_ID) NAME, 
SUM(X.SCORE) TOTAL_SCORE FROM 
  (SELECT HACKER_ID, MAX(SCORE) SCORE FROM SUBMISSIONS S
   GROUP BY 1, S.CHALLENGE_ID) X 
GROUP BY 1
HAVING TOTAL_SCORE > 0
ORDER BY TOTAL_SCORE DESC, HACKER_ID;


--