-- sql

SELECT business_id
FROM Events e
LEFT JOIN
    (SELECT event_type, avg(occurences) AS avg_occ
    FROM Events 
    GROUP BY event_type) AS sub
ON e.event_type = sub.event_type 
WHERE e.occurences > sub.avg_occ 
GROUP BY business_id 
HAVING COUNT(*)>1
   
   
   
-- window function

with tmp as (
select business_id, occurences, avg(occurences)over(partition by event_type) as average
from events
)

select business_id
from tmp
where occurences > average
group by business_id  
having count(*)>1


/*
select *
from tmp
where occurences > average from events

output:
{"headers": ["business_id", "occurences", "average"], "values": [
[1, 11, 8], 
[2, 12, 7], 
[1, 7, 5]]}
*/




