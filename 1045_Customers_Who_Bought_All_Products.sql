SELECT customer_id
FROM customer 
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM product) 


/* note to myself
WRONG:

SELECT customer_id
FROM customer 
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM product) 

OUTPUT is 1

要用group by，aggregation query没用分组的话算出来的是global aggregation，
你再选一个customer_id column就相当于既不是group by column也不是aggregation column，结果是随机的

*/

