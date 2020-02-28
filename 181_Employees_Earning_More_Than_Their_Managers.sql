
SELECT 
    e.name as Employee
FROM 
    Employee e
INNER JOIN 
    Employee m
    ON e.managerid = m.id 
WHERE 
    e.salary > m.salary

--  e.ID  e.Name e.Salary e.ManagerId  m.ID  m.ManagerSalary
--    1      Joe   70000       3        3        6000
