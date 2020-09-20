/* Wrong

select player_id, device_id
from activity 
group by player_id
having min(event_date)

why is wrong?
Unless the activity table is order by player_id and event_date, this code will get the wrong answer.
If the table is with this sort, the result should be correct with or without 'having min()'

For example,
{"headers":{"Activity":["player_id","device_id","event_date","games_played"]},
"rows":{"Activity":[[1,2,"2016-03-01",5],[1,2,"2016-05-02",6],[1,3,"2015-06-25",1],[3,1,"2016-03-02",0],[3,4,"2016-02-03",5]]}}

MySQL executes 'from' clause firstly, so the result will be all records of activity table.
[1,2,"2016-03-01",5],[1,2,"2016-05-02",6],[1,3,"2015-06-25",1],[3,1,"2016-03-02",0],[3,4,"2016-02-03",5]

Next step is running 'group by'. The result of this step is the first record of each player_id.
[1,2,"2016-03-01",5], [3,1,"2016-03-02",0]

Last, when select player_id and device_id, the result will be [1,2], [3,1]

but the expect answer is [1,3],[3,4]

having clause is useless. Take our the having clause, you will still find your code pass the trail test because of the way they structure the test case.
When you use group by and have multiple things in one group, if you didn't say use any sum(), max() and etc, 
it automatically selects the first one in the group for you. That's where you got lucky. 
All the min date in the test case just happens to be the first one when that player_id appears.

*/

select player_id, device_id
from activity 
where (player_id, event_date) in (select player_id, min(event_date) from activity group by player_id)





with cte as
(select player_id,
        device_id,
        rank()over(partition by player_id order by event_date) as rnk
from activity)

select player_id, device_id from cte where rnk = 1
