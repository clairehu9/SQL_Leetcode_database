-- UNION vs UNION ALL

SELECT id, COUNT(*) AS num
FROM
    (SELECT requester_id AS id FROM request_accepted
    UNION ALL 
    SELECT accepter_id  AS id FROM request_accepted) AS t
GROUP BY id
ORDER BY num DESC
LIMIT 1;

/*  1    display all id
    1
    2
    3
    2
    3
    3
    4
    
    id  count(*)
    1   2
    2   2
    3   3
    4   1
    
    */

