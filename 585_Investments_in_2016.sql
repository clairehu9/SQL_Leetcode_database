-- Answer 1: use IN and NOT IN

SELECT 
    ROUND(SUM(TIV_2016),2) AS TIV_2016 
FROM insurance 
WHERE TIV_2015 IN(
        SELECT TIV_2015 FROM insurance GROUP BY TIV_2015 HAVING COUNT(*)>1)
    AND (lat, lon) NOT IN(
        SELECT lat, lon FROM insurance GROUP BY lat, lon HAVING COUNT(*)>1);
        
-- Answer 2: use IN, use IN is faster than NOT IN
select
round(sum(tiv_2016),2) as tiv_2016
from
insurance
where
tiv_2015 in (select tiv_2015 from insurance group by 1 having count(*) > 1)
and (lat, lon) in (select lat, lon from insurance group by 1, 2 having count(*) = 1)
