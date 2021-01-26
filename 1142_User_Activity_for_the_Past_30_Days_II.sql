select round(coalesce(avg(sess), 0), 2) as average_sessions_per_user from (
select user_id, count(distinct session_id) as sess
from Activity
where activity_date between '2019-06-28' and '2019-07-27'
group by user_id 
) a;


-- 2 

select ifnull(round(avg(sess_count), 2) ,0) as average_sessions_per_user
from (
select user_id
        ,count(distinct session_id) as sess_count
from activity
where activity_date between date_sub('2019-07-27',interval 29 day) 
and '2019-07-27'
group by user_id) as t


