select 
    score,
    dense_rank()over(order by score desc)
from scores



/* Note: according to the question, if there is a tie between two scores, both should have the same ranking. 
Note that after a tie, the next ranking number should be the next consecutive integer value.

---> DENSE_RANK() is a rank with no gaps*/
