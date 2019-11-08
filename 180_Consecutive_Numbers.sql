-- method 1: using window function 

SELECT DISTINCT num as ConsecutiveNums
FROM (
    SELECT 
        num
        ,LAG(num, 1) OVER(ORDER BY id) AS num2
        ,LAG(num, 2) OVER(ORDER BY id) AS num3
    FROM logs
 )AS three_day_log
WHERE num = num2 AND num2 = num3


-- Getting the previous value with LAG()
-- Getting the next value with LEAD()
-- Windowed functions can only appear in the SELECT or ORDER BY clauses.

/* num, num2, num3
   1, null, null
   1, 1, null
   1, 1, 1
   2, 1, 1
   1, 2, 1
   2, 1, 2
   2, 2, 1
*/


-- method 2: using inner join

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM logs AS l1
INNER JOIN logs AS l2
    ON l2.id = l1.id + 1
INNER JOIN logs AS l3
    ON l3.id = l2.id +1 
WHERE l1.num = l2.num AND l2.num = l3.num


/*
1 1 1
1 1 2
1 2 1
2 1 2
1 2 2
2 2 -
2 -
*/

