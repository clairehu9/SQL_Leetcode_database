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
 
