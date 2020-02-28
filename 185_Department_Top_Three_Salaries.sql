# find employees who earn the top three salaries in each of the department

# MYSQL
SELECT 
    d.name as 'Department'
    ,e1.name as 'Employee'
    ,e1.Salary
FROM Employee e1
JOIN Department d
  ON e1.DepartmentId = d.id
WHERE 
    (SELECT COUNT(DISTINCT e2.Salary) 
     FROM 
       Employee e2
     WHERE 
       e2.Salary > e1.Salary
         AND e2.DepartmentId = e1.DepartmentId
          ) <3;


/* 
What does top-3 paid employees in each department have in common?

They have the same DepartmentId.
They have fewer than 3 persons who get paid higher salary (can use either < 3 or <= 2).
Department No. 1 has 0 above him.
Department No. 2 has 1 above him.
Department No. 3 has 2 above him. The conditions are set-up for correlated subquery. In subquery, we can use an equijoin (DepartmentId) and non-equijoin (Salary) to filter the outer query.
Basic MySQL solution implementing the equijoin and non-equijoin logic above.

数出来同一个department里工资比他高的人有多少

*/


#MSSQL - Window function

WITH Department_Rank AS (
SELECT
    e.name AS Employee
    ,e.Salary 
    ,e.DepartmentId
    ,DENSE_RANK()OVER(PARTITION BY e.DepartmentId ORDER BY e.Salary DESC) AS rnk
FROM Employee AS e
) 

SELECT  
    d.name AS Department
    ,r.Employee
    ,r.Salary
FROM Department_Rank AS r    
JOIN Department AS d
  ON r.DepartmentID = d.id
WHERE r.rnk <= 3
ORDER BY d.Name ASC, r.Salary DESC;


