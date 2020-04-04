WITH cte AS
(
SELECT match_id, guest_team as t1, host_team as t2, guest_goals as g1, host_goals as g2 FROM Matches 
UNION ALL
SELECT match_id, host_team as t1, guest_team as t2, host_goals as g1, guest_goals as g2 FROM Matches 
)

SELECT team_id, team_name,
SUM(CASE WHEN g1 > g2 THEN 3
         WHEN g1 = g2 THEN 1 ELSE 0 END) AS num_points    
FROM cte
Right join Teams t on cte.t1 = t.team_id 
GROUP BY team_id, team_name 
ORDER BY num_points DESC,team_id ASC
