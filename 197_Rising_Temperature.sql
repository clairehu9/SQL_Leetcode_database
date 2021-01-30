select w1.id as 'Id'
from weather w1
inner join weather w2
on datediff(w1.recorddate, w2.recorddate) = 1

SELECT
    weather.id AS 'Id'
FROM
    weather
        JOIN
    weather w ON DATEDIFF(weather.recordDate, w.recordDate) = 1
        AND weather.Temperature > w.Temperature
;
