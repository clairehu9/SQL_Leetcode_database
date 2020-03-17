-- SQL 

SELECT student_id, MIN(course_id) AS course_id, grade
FROM Enrollments
WHERE (student_id, grade) IN
    (SELECT student_id, MAX(grade)
     FROM Enrollments
     GROUP BY student_id)
GROUP BY student_id, grade
ORDER BY student_id


/*
SELECT student_id, MAX(grade)
     FROM Enrollments
     GROUP BY student_id

{"headers": ["student_id", "MAX(grade)"], "values": [
[1, 99], [2, 95], [3, 82]]}


SQL: from -> where -> group by -> aggregate function -> having

WHERE IN
SELECT * FROM table1 WHERE (col_a,col_b) IN (SELECT col_x,col_y FROM table2)

*/


-- MSSQL

with unordered as (
select top 1 with ties student_id, course_id, grade
from Enrollments
order by rank() over (partition by student_id order by grade desc, course_id)
)
select * from unordered order by student_id


SELECT t.student_id, t.course_id, t.grade
FROM 
	(SELECT student_id, course_id, grade, 
	rank() over (partition by student_id order by grade desc, course_id asc) as r 
	FROM Enrollments) t
WHERE t.r=1
ORDER BY t.student_id asc
