WITH tmp AS
(
SELECT log_id
    ,log_id - ROW_NUMBER() OVER(ORDER BY log_id) AS difference
FROM Logs
)

SELECT MIN(log_id) AS start_id
,MAX(log_id) AS end_id
FROM tmp
GROUP BY difference
ORDER BY start_id


/*

SELECT log_id
    ,ROW_NUMBER() OVER(ORDER BY log_id) AS rnk
    ,(log_id - ROW_NUMBER() OVER(ORDER BY log_id)) AS difference 
FROM Logs

["log_id", "rnk", "difference"]
[1, 1, 0], [2, 2, 0], [3, 3, 0], [7, 4, 3], [8, 5, 3], [10, 6, 4]]}

*/
