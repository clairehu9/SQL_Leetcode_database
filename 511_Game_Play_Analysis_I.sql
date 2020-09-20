/*window function */

select distinct player_id,
first_value(event_date)over(partition by player_id order by event_date asc) as first_login 
from activity

/*Note:要加distinct
如果不加distinct，出来的结果是：每一个球员id对应的都是最早日期
 ["player_id", "first_login"], 
 [[1, "2016-03-01"], 
 [1, "2016-03-01"], 
 [2, "2017-06-25"], 
 [3, "2016-03-02"], 
 [3, "2016-03-02"]]}
 */

/* MySQL */
select distinct player_id, min(event_date) as first_login 
from activity 
group by player_id
