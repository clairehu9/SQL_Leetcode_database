# find the team size of each of the employees

select e.employee_id, t.team_size
from Employee as e
left join
    (select team_id, count(employee_id) as team_size from Employee group by team_id) as t
on e.team_id = t.team_id

/* Note:
common mistake:
use aggregate function COUNT without use GROUP BY 
The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
The GROUP BY statement is often used with aggregate functions (COUNT, MAX, MIN, SUM, AVG) to group the result-set by one or more columns.

sql subquery里，不能有除了group by 和aggregation function 以外的cloumn！


*/

