-- Solution 1
SELECT 
    Name   
FROM 
    Employee e
WHERE ID IN(
    SELECT Managerid FROM Employee m
     GROUP BY m.ManagerId 
      HAVING COUNT(m.ManagerId)>=5)

-- Solution 2
SELECT   
  m.name
FROM Employee e
JOIN Employee  m
ON e.ManagerId = m.id
GROUP BY e.ManagerId
HAVING COUNT(*)>=5

