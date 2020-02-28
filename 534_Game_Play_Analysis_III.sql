# 534_Game_Play_Analysis_III

-- MSSQL 
-- SUM()OVER() for running total 

SELECT 
  player_id
  ,event_date
  ,SUM(games_played)OVER(PARTITION BY player_id ORDER BY event_date) AS games_played_so_far 
FROM Activity 
