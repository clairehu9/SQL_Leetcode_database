SELECT IFNULL(
    (SELECT DISTINCT
        salary 
    FROM 
        Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1), null) AS SecondHighestSalary;
    
  
/* 
If there is no second highest salary, then the query should return null
-- check if NULL (only one row in table)
-- check if distinct is necessary (disallow duplicate)

This inner query will return the value as empty string'' (it is still a value though empty).
  SELECT DISTINCT
        salary 
    FROM 
        Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1), null
    
The outer layer select from an empty table throws NULL
*/




