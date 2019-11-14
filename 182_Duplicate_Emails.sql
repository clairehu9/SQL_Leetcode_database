SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*)>1

-- think of GROUP BY as "for each" 
