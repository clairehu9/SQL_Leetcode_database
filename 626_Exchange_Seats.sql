-- 1. If the id is odd, switch the student with the even id.
-- 2. The last student with odd number, remind on same seat.

SELECT id,
CASE 
    WHEN s.id % 2 = 0 THEN (select student from seat where id = (s.id - 1))
    WHEN s.id % 2 <> 0 AND id < (select max(id) from seat) 
        THEN (select student from seat where id = (s.id + 1))
    ELSE student
    END AS student
FROM seat AS s


/*
+---------+---------+-----
|  s.id   | student | id
+---------+---------+-----
|    1    | Abbot   |  2
|    2    | Doris   |  1
|    3    | Emerson |  4
|    4    | Green   |  3
|    5    | Jeames  |  5
+---------+---------+-------


*/ 
                                                   
 /* get all the even numbered rows as odd numbered rows */
SELECT s1.id - 1 as id, s1.student
FROM Seat s1
WHERE s1.id MOD 2 = 0

UNION

/* get all the odd numbered rows as even numbered rows */
SELECT s2.id + 1 as id, s2.student
FROM Seat s2
WHERE s2.id MOD 2 = 1 AND s2.id != (SELECT MAX(id) FROM Seat)
/* Just don't get the last row as we will handle it in the next UNION */

UNION

/* get the last row if odd and don't change the id value */
SELECT s3.id, s3.student
FROM Seat s3
WHERE s3.id MOD 2 = 1 AND s3.id = (SELECT MAX(id) FROM Seat)

/* Order the result by id */
ORDER BY id ASC;
                                                   
                                                   
 
