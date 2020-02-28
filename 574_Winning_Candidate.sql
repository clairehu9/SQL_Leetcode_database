# 574_Winning_Candidate
# find the name of the winning candidate



SELECT Name
FROM Candidate c
JOIN
    (SELECT CandidateId, COUNT(CandidateId) AS num_votes 
    FROM Vote 
    GROUP BY CandidateId) t
ON c.id = t.CandidateId  
HAVING MAX(t.num_votes)
;

Tricky point: you don't need id from VOTE table


