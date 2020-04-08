WITH cte AS (
SELECT visited_on,
    SUM(SUM(amount))OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS 'amount'
FROM customer
GROUP BY visited_on
)

SELECT visited_on, amount, ROUND(CAST(amount AS FLOAT)/7.0, 2) AS'average_amount' 
FROM cte
ORDER BY visited_on
OFFSET 6 ROWS

-- window function running total, cast



-- Why doesn't work? 
-- There are 2 transections on "2019-01-10". 

SELECT
    visited_on,
    SUM(amount)OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount
FROM customer

/*
{"headers": ["visited_on", "amount"], "values": [
["2019-01-01", 100], 
["2019-01-02", 210], 
["2019-01-03", 330], 
["2019-01-04", 460], 
["2019-01-05", 570], 
["2019-01-06", 710],
["2019-01-07", 860], 
["2019-01-08", 840], 
["2019-01-09", 840],
["2019-01-10", 850], 
["2019-01-10", 870]]} */

 
 SELECT
    visited_on,
    SUM(SUM(amount))OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS 'amount'
FROM customer
GROUP BY visited_on
 
 /*           
{"headers": ["visited_on", "amount"], "values": [
["2019-01-01", 100], 
["2019-01-02", 210], 
["2019-01-03", 330], 
["2019-01-04", 460], 
["2019-01-05", 570], 
["2019-01-06", 710], 
["2019-01-07", 860], 
["2019-01-08", 840], 
["2019-01-09", 840], 
["2019-01-10", 1000]]} */
