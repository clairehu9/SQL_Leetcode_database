SELECT
  t.login_date
  ,COUNT(user_id) AS user_count 
FROM
    (SELECT 
         user_id
        ,MIN(activity_date) AS login_date
    FROM Traffic
    WHERE activity='login' 
    GROUP BY user_id) AS t
WHERE datediff('2019-06-30', login_date) <= 90
GROUP BY t.login_date
;




/*

    SELECT *
    FROM Traffic
    WHERE activity='login' 
    AND activity_date > DATE_ADD('2019-06-30', INTERVAL -90 day)
    GROUP BY user_id
    
    
Traffic table:
+---------+----------+---------------+
| user_id | activity | activity_date |
+---------+----------+---------------+
| 1       | login    | 2019-05-01    |  -- 1 
| 2       | login    | 2019-06-21    |  -- 1
| 3       | login    | 2019-01-01    |
| 4       | login    | 2019-06-21    |  -- 1
| 5       | login    | 2019-03-01    |
| 5       | login    | 2019-06-21    |  -- 90 day but not first time
+---------+----------+---------------+

{"headers": ["user_id", "activity", "activity_date"], "values": 
[[1, "login", "2019-05-01"], 
[2, "login", "2019-06-21"], 
[4, "login", "2019-06-21"], 
[5, "login", "2019-06-21"]]}

Now, how to include only the earliest date? use MIN() and GROUP BY userID.
another approach, which is WRONG:

    SELECT user_id
        ,MIN(activity_date) AS login_date
    FROM Traffic
    WHERE activity='login' 
    AND activity_date > DATE_ADD('2019-06-30', INTERVAL -90 day)
    GROUP BY user_id

{"headers": ["user_id", "login_date"], "values": [
[1, "2019-05-01"], 
[2, "2019-06-21"], 
[4, "2019-06-21"], 
[5, "2019-06-21"]]}

Why is WRONG? and how I fix it? 
1. While using aggregate function, you have to use a GROUP BY.
2. SQL Query Optimization
   1)from
   2)where 
   3)group by 
   4)having 
   5)select 
   6)order by 
   7)limit

so, remove: activity_date > DATE_ADD('2019-06-30', INTERVAL -90 day) from subquery

    SELECT user_id
        ,MIN(activity_date) AS login_date
    FROM Traffic
    WHERE activity='login' 
    GROUP BY user_id

{"headers": ["user_id", "login_date"], "values": [
[1, "2019-05-01"], 
[2, "2019-06-21"], 
[3, "2019-01-01"], 
[4, "2019-06-21"], 
[5, "2019-03-01"]]}      -- looks good!

*/

-- So, my final query: 


SELECT
  t.login_date
  ,COUNT(user_id) AS user_count 
FROM
    (SELECT 
         user_id
        ,MIN(activity_date) AS login_date
    FROM Traffic
    WHERE activity='login' 
    GROUP BY user_id) AS t
WHERE t.login_date >= DATE_ADD('2019-06-30', INTERVAL -90 day) 
GROUP BY t.login_date
;

--- 1496s


SELECT
  t.login_date
  ,COUNT(user_id) AS user_count 
FROM
    (SELECT 
         user_id
        ,MIN(activity_date) AS login_date
    FROM Traffic
    WHERE activity='login' 
    GROUP BY user_id) AS t
WHERE datediff('2019-06-30', login_date) <= 90    
GROUP BY t.login_date
;

-- 423s


/* The DATE_ADD() function adds a time/date interval to a date and then returns the date.
DATE_ADD(date, INTERVAL value addunit)

The DateAdd function adds a number of units to a date/time value. 
The result is a new date/time value. You can also subtract a number of units from a date/time value by specifying a negative value.

The DateDiff function returns the difference between two date/time values. The result is a number of units. */



