WITH tmp AS
(
SELECT log_id
    ,log_id - ROW_NUMBER() OVER(ORDER BY log_id) AS rnk
FROM Logs
)

SELECT MIN(log_id) AS start_id
,MAX(log_id) AS end_id
FROM tmp
GROUP BY rnk
ORDER BY start_id


