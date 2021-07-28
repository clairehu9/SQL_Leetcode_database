-- windown funtion + from subquary

SELECT 
    product_id, year as first_year, quantity, price 
FROM 
    (SELECT * 
        ,RANK()OVER(PARTITION BY product_id ORDER BY year) AS rnk
      FROM sales) as t
WHERE rnk =1 

-- window function +top1

select top 1 with ties product_id, year as first_year, quantity, price
from Sales
order by rank() over (partition by product_id order by year);


-- mysql
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
SELECT product_id, MIN(year) as year
FROM Sales
GROUP BY product_id) ;
