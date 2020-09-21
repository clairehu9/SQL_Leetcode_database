/* Window function 

seat_id	free	free_lag	free_lead
1	1	NULL	0
2	0	1	1
3	1	0	1
4	1	1	1
5	1	1	NULL
(free=1 AND free_lag=1) can choose consecutive seats without first one
(free=1 AND free_lead=1) can choose consecutive seats without last one
Use OR to combine these two to get correct result. */

with cte as(
select 
    seat_id,
    free,
    lag(free,1)over(order by seat_id) as free_lag,
    lead(free,1)over(order by seat_id) as free_lead
from cinema
)

select seat_id
from cte
where (free=1 and free_lag=1)
or (free=1 and free_lead=1)

