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


-- 
