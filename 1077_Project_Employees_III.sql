/* ASC sorts from the lowest value to highest value. DESC sorts from highest value to lowest value. 
ASC is the default sort order. Null values are treated as the lowest possible values. */


SELECT t.project_id, t.employee_id
FROM   
    (SELECT project_id
        ,p.employee_id
        ,RANK()OVER(PARTITION BY project_id ORDER BY experience_years desc) as rnk
     FROM Project p
     JOIN Employee e
     ON e.employee_id = p.employee_id   
    )t
where t.rnk = 1;


-- Answer 2: 
select top 1 with ties project_id, a.employee_id
from Project a
join Employee b
on a.employee_id = b.employee_id
order by dense_rank() over 
        (partition by project_id order by experience_years desc);
        
-- Answer 3:        

with employee_experience as (
    select p.project_id, p.employee_id,
    rank() over(partition by p.project_id order by experience_years desc) as rank
    from Project p join Employee e
    on p.employee_id = e.employee_id)

select project_id, employee_id
from employee_experience
where rank = 1;
