-- MS SQL

-- If there is a tie between two scores, both should have the same ranking. 
-- Note that after a tie, the next ranking number should be the next consecutive integer value.
-- DENSE_RANK() is a rank with no gaps 

SELECT 
  Score
  ,DENSE_RANK() over (ORDER BY Score DESC) AS Rank
FROM scores
ORDER BY Score DESC;


-- MySQL
SELECT
  Score,
  @rank := @rank + (@prev <> (@prev := Score)) Rank
FROM
  Scores,
  (SELECT @rank := 0, @prev := -1) init
ORDER BY Score desc

-- https://leetcode.com/problems/rank-scores/discuss/53094/Simple-Short-Fast
