#184_Department_Highest_Salary

#  find employees who have the highest salary in each of the departments

SELECT d.name as Department 
       ,e.name as Employee
       ,e.Salary      
FROM Employee e
JOIN Department d
ON e.DepartmentId = d.id
WHERE e.Salary = 
        (SELECT max(salary) FROM Employee e2
         WHERE e2.DepartmentId = d.id )
