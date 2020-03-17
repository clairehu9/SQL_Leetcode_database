-- Answer: 

select round(avg(
    if(removed is null, 0, removed/reported)) *100,2) as average_daily_percent from(
  (
  SELECT action_date, count(distinct post_id) as reported
  FROM Actions 
  WHERE extra = 'spam'
  GROUP BY action_date
  ) t1
LEFT JOIN
  (
  SELECT action_date, count(distinct a.post_id) as removed
  FROM Actions a
  INNER JOIN removals r
   ON a.post_id = r.post_id
  WHERE extra = 'spam'
  GROUP BY action_date
  ) t2
ON t1.action_date = t2.action_date
)



####################################################################

Just take a look of overall of table

SELECT *
FROM Actions a
LEFT JOIN removals r
ON a.post_id = r.post_id
WHERE extra = 'spam'

{"headers": ["user_id", "post_id", "action_date", "action", "extra", "post_id", "remove_date"], "values": [
[2, 2, "2019-07-04", "report", "spam", 2, "2019-07-20"], 
[4, 3, "2019-07-02", "report", "spam", 3, "2019-07-18"], 
[3, 4, "2019-07-04", "report", "spam", null, null]]}


####################################################################
First, find the number of removed post daily 

SELECT action_date, count(distinct a.post_id) as removed
FROM Actions a
INNER JOIN removals r            
  ON a.post_id = r.post_id
WHERE extra = 'spam'
GROUP BY action_date

{"headers": ["action_date", "removed"], "values": [
["2019-07-02", 1], ["2019-07-04", 1]]}


-- Use inner join, not left join! post_id = 4 reported as spam, but not remove.
{"headers": ["action_date", "removed"], "values": [
["2019-07-02", 1], ["2019-07-04", 2]]}



####################################################################
Then, find the number of repoarted post daily

SELECT action_date, count(distinct post_id) as reported
FROM Actions 
WHERE extra = 'spam'
GROUP BY action_date

join these 2 tables

select * from (
  (SELECT action_date, count(distinct post_id) as reported
  FROM Actions 
  WHERE extra = 'spam'
  GROUP BY action_date) t1
LEFT JOIN
  (SELECT action_date, count(distinct a.post_id) as removed
  FROM Actions a
  LEFT JOIN removals r
   ON a.post_id = r.post_id
  WHERE extra = 'spam'
  GROUP BY action_date) t2
ON t1.action_date = t2.action_date
)


{"headers": ["action_date", "reported", "action_date", "removed"], "values": [
["2019-07-02", 1, "2019-07-02", 1], ["2019-07-04", 2, "2019-07-04", 2]]}


####################################################################
Lastly, caculation.

select round(avg(
    if(removed is null, 0, removed/reported)) *100,2) as average_daily_percent

-- IF(condition, value_if_true, value_if_false)
-- eg. SELECT IF(500<1000, "YES", "NO");


####################################################################
####################################################################
Another solution: https://leetcode.com/problems/reported-posts-ii/discuss/361971/Two-straightforward-MySQL-solution-with-detailed-explanation
