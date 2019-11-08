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
