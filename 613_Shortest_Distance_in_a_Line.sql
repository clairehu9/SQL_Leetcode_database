select min(abs(a.x - b.x)) as shortest
from point a
inner join point b
on a.x <> b.x
