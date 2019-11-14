  
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  DECLARE M INT DEFAULT N - 1;
  RETURN (
    SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 1 OFFSET M
  );
END


方法二: scalar subquery,只返回一个数字
SELECT * 
FROM Employee Emp1
WHERE (N-1) = (
  SELECT COUNT(DISTINCTEmp2.Salary)
  FROM Employee Emp2
  WHERE Emp2.Salary > Emp1.Salary)
