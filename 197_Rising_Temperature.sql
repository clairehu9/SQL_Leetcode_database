select w1.id as 'Id'
from weather w1
inner join weather w2
on datediff(w1.recorddate, w2.recorddate) = 1

