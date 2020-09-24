SELECT s.buyer_id
FROM Sales AS s INNER JOIN Product AS p
ON s.product_id = p.product_id
GROUP BY s.buyer_id
HAVING SUM(CASE WHEN p.product_name = 'S8' THEN 1 ELSE 0 END) > 0
AND SUM(CASE WHEN p.product_name = 'iPhone' THEN 1 ELSE 0 END) = 0;



SELECT DISTINCT buyer_id 
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id
WHERE product_name = 'S8' AND buyer_id NOT IN
      (SELECT DISTINCT buyer_id
      FROM Sales s1
      JOIN Product p1
      ON s1.product_id = p1.product_id
      WHERE product_name='iPhone' )
      
      
-- @shawlu95

with joined as (
select a.product_id, a.product_name, b.buyer_id
from Product a
join Sales b
on a.product_id = b.product_id
)
,iphone as (
select distinct buyer_id
from joined where product_name = 'iPhone'
)
,s8 as (
select distinct buyer_id
from joined where product_name = 'S8'
)
select a.buyer_id
from s8 a
left join iphone b
on a.buyer_id = b.buyer_id
where b.buyer_id is null
