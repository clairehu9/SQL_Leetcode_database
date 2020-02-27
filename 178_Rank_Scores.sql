-- MS SQL

-- If there is a tie between two scores, both should have the same ranking. 
-- Note that after a tie, the next ranking number should be the next consecutive integer value.
-- DENSE_RANK() is a rank with no gaps 

SELECT 
    Score 
    ,DENSE_RANK()OVER(ORDER BY Score DESC) AS Rank 
FROM Scores



-- MySQL

SELECT Scores.Score, Rank
FROM Scores 
Left join (Select Score, @Rank:=@Rank+1 as Rank
  From (Select Distinct Score From Scores Order by Score DESC) S1, (Select @Rank:=0) var) S2 on Scores.Score=S2.Score
order by Scores.Score desc;
