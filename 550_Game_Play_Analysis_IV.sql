

SELECT
    ROUND(SUM(CASE WHEN a.event_date = t.first_day+1 THEN 1 ELSE 0 END)
    /
    COUNT(DISTINCT t.player_id),2) AS fraction
FROM
    Activity a
JOIN
    (SELECT player_id, MIN(event_date) AS first_day
    FROM activity
    GROUP BY player_id) t
ON a.player_id = t.player_id


