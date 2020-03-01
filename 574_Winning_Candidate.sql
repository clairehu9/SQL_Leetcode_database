-- Wrong Answer: 

SELECT Name
FROM Candidate c
JOIN
    (SELECT CandidateId, COUNT(CandidateId) AS num_votes 
    FROM Vote 
    GROUP BY CandidateId) t
ON c.id = t.CandidateId  
HAVING MAX(t.num_votes)
;

-- 1. HAVING MAX(t.num_votes) is WRONG!!
--    MAX() function with Having: having max() >1000, having max() <1000

-- 2. COUNT(CandidateId) is WRONG! Should COUNT(ID)


-- Solution 1: using JOIN
SELECT Name
FROM Candidate c
JOIN
    (SELECT CandidateId
    FROM Vote 
    GROUP BY CandidateId
    ORDER BY COUNT(ID) DESC
    LIMIT 1) t
ON c.id = t.CandidateId  

-- Solution 2: using IN

SELECT C.Name FROM Candidate C
WHERE id = (SELECT CandidateId FROM Vote GROUP BY CandidateId ORDER BY COUNT(id) DESC LIMIT 1); 








