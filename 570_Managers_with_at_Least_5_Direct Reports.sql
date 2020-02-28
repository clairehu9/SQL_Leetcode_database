SELECT 
    Name   
FROM 
    Employee e
WHERE ID IN(
    SELECT Managerid FROM Employee m
     GROUP BY m.ManagerId 
      HAVING COUNT(m.ManagerId)>=5)
