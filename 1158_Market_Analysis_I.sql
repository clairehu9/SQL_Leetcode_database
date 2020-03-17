
SELECT 
  user_id as buyer_id                                                           -- user_id not o.buyer_id
  ,join_date
  , ifnull(COUNT(order_id), 0) as orders_in_2019                                -- ifnull vs COALESCE
FROM orders o
RIGHT JOIN users u on u.user_id  = o.buyer_id AND YEAR(o.order_date) = '2019'   -- right join
GROUP BY user_id
ORDER BY user_id



SELECT user_id AS buyer_id, join_date, COALESCE(COUNT(o.order_id),0) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.buyer_id AND YEAR(order_date)='2019'
GROUP BY user_id
ORDER BY user_id


reference link:
https://stackoverflow.com/questions/18528468/what-is-the-difference-bewteen-ifnull-and-coalesce-in-mysql

IFNULL function takes two arguments and returns the first one if it's not NULL or the second if the first one is NULL.
COALESCE function can take two or more parameters and returns the first non-NULL parameter

example:

SELECT IFNULL('some value', 'some other value');
-> returns 'some value'

SELECT IFNULL(NULL,'some other value');
-> returns 'some other value'

SELECT COALESCE(NULL, 'some other value');
-> returns 'some other value' - equivalent of the IFNULL function

SELECT COALESCE(NULL, 'some value', 'some other value');
-> returns 'some value'

SELECT COALESCE(NULL, NULL, NULL, NULL, 'first non-null value');
-> returns 'first non-null value'

######################################################################################################################
with norder as (
select buyer_id, count(*) as n from Orders
where order_date >= '2019-01-01'
group by buyer_id
)
select a.user_id as buyer_id, join_date, coalesce(n, 0) as orders_in_2019
from Users a
left join norder b
on a.user_id = b.buyer_id






