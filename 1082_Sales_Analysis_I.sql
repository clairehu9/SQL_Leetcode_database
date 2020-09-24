select seller_id
from sales
group by seller_id 
having sum(price) = (select sum(price) as bestsell from sales
                    group by seller_id 
                    order by bestsell desc
                    limit 1
                    )
                    


-- MS SQL Server:

select top 1 with ties seller_id
from Sales
group by seller_id
order by sum(price) desc;


/* The SELECT TOP clause allows you to limit the number of rows or percentage of rows returned in a query result set.
Because the order of rows stored in a table is unspecified, the SELECT TOP statement is always used in conjunction with the ORDER BY clause. 
Therefore, the result set is limited to the first N number of ordered rows.

SELECT TOP (expression) [PERCENT]
    [WITH TIES]
FROM 
    table_name
ORDER BY 
    column_name;
    
    
Reference:https://www.sqlservertutorial.net/sql-server-basics/sql-server-select-top/#:~:text=The%20WITH%20TIES%20allows%20you,can%20use%20the%20TOP%201%20.
*/



