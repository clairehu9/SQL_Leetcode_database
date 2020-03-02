/*
join before aggreateing:
NO need to handle null if tables are joined before aggregating.
NULL columns are simply not counted (return 0 if departmend has no student)
aggreate before join:
If studnets are counted before joining, only existing department
with at least 1 student are aggregated over with count. 
Left joining full dept tables (including empty dept) will result in NULL */

-- WRONG solution: not display LAW department has 0 student
 
 SELECT 
    d.dept_name
    ,t.student_number 
FROM department d
LEFT JOIN
 (SELECT dept_id, count(student_id) as student_number    --count before joining, display only department with at least 1 student
 FROM student 
 GROUP BY dept_id) as t
ON d.dept_id  = t.dept_id 
 
