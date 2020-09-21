/* Window function */

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
