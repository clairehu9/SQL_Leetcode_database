-- MS SQL 289ms

WITH cte AS
(
   SELECT left(c.trans_date, 7) AS month, country, 'chargeback' AS state, amount
   FROM chargebacks AS c
   JOIN transactions AS t ON c.trans_id = t.id
   UNION ALL  
   SELECT left(trans_date, 7) AS month, country, state, amount
   FROM transactions 
   WHERE state = 'approved'
)

SELECT month, country, 
SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_amount, 
SUM(CASE WHEN state = 'chargeback' THEN 1 ELSE 0 END) AS chargeback_count,
SUM(CASE WHEN state = 'chargeback' THEN amount ELSE 0 END) AS chargeback_amount
FROM cte
GROUP BY month, country


-- MySQL 498ms

SELECT month, country, 
SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_amount, 
SUM(CASE WHEN state = 'chargeback' THEN 1 ELSE 0 END) AS chargeback_count,
SUM(CASE WHEN state = 'chargeback' THEN amount ELSE 0 END) AS chargeback_amount
FROM
(
   SELECT DATE_FORMAT(c.trans_date, '%Y-%m') AS month, country, 
   "chargeback" AS state, amount
   FROM chargebacks AS c
   JOIN transactions AS t ON c.trans_id = t.id
   UNION ALL
   
   SELECT DATE_FORMAT(t.trans_date, '%Y-%m') AS month, country, state, amount
   FROM transactions AS t
   WHERE state = "approved"
) s
GROUP BY month, country

###################################################################################################

   SELECT left(c.trans_date, 7) AS month, country, 'chargeback' AS state, amount
   FROM chargebacks AS c
   JOIN transactions AS t ON c.trans_id = t.id
   UNION ALL  
   SELECT left(trans_date, 7) AS month, country, state, amount
   FROM transactions 
   WHERE state = 'approved'

/*
{"headers": ["month", "country", "state", "amount"], "values": [
["2019-06", "US", "chargeback", 1000], 
["2019-05", "US", "chargeback", 2000], 
["2019-09", "US", "chargeback", 5000], 
["2019-05", "US", "approved", 1000], 
["2019-06", "US", "approved", 3000],
["2019-06", "US", "approved", 5000]]}
*/
