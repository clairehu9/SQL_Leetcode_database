select 
    activity_date as day
    ,count(distinct user_id) as active_users
from Activity
where datediff('2019-07-27',activity_date) < 30
group by activity_date

 
/*1. DATEDIFF(date1, date2), date 1 - date 2. Order matter. If */
datediff(activity_date,'2019-07-27') < 30
/* dateiff function doesn't work {"headers": ["day", "active_users"], "values": [["2019-06-25", 1], ["2019-07-20", 2], ["2019-07-21", 2]]}

https://www.w3schools.com/sql/func_mysql_datediff.asp*
eg. SELECT DATEDIFF("2017-06-15", "2017-06-25");  result: -10
    SELECT DATEDIFF("2017-06-25", "2017-06-15");  result: 10
/
