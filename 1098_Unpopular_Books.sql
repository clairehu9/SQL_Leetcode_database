/*
First we need to account for all books and since the number of books which sold less than 10 times is of the interest here, 
we should account for the zero sold as well. In this case we need to do left join 
and be aware that we might get null values from the books that never sold and listed on Orders table. 
We also need to exclude the books which were available less than a month so we can safely filter those results out using the WHERE clause.*/

SELECT b.book_id, b.name
FROM books b
LEFT JOIN                                         -- use left join to include 0 sold
    (SELECT * FROM orders 
     WHERE dispatch_date > date_add('2019-06-23', interval -1 year)) AS o   --filter before join
ON b.book_id = o.book_id
WHERE DATEDIFF('2019-06-23', b.available_from) > 30
GROUP BY b.book_id, b.name
HAVING IFNULL(SUM(o.quantity),0) < 10               -- use IFNULL count for 0 sold as well 
ORDER BY b.book_id

##############################################################################################################
 -- WRONG: 
                                    
SELECT b.book_id, b.name
FROM books b
LEFT JOIN orders o
ON b.book_id = o.book_id
WHERE DATEDIFF('2019-06-23', b.available_from) > 30
  AND  dispatch_date > date_add('2019-06-23', interval -1 year)       -- This is wrong! You will filter out zero sell.
GROUP BY b.book_id, b.name
HAVING IFNULL(SUM(o.quantity),0) < 10
ORDER BY b.book_id                                   

/* output:
{"headers": ["book_id", "name"], "values": [[1, "Kalila And Demna"]]}   */                                 
                                    
##############################################################################################################                                   

select *
from books b 
left join orders o
on b.book_id = o.book_id 
where datediff('2019-06-23', available_from) > 30           
and dispatch_date between '2018-06-23' and '2019-06-23'   -- 条件把left join的结果抵消了,把

/* output                                    
{"headers": ["book_id", "name", "available_from", "order_id", "book_id", "quantity", "dispatch_date"], "values": 
[[1, "Kalila And Demna", "2010-01-01", 1, 1, 2, "2018-07-26"], 
[1, "Kalila And Demna", "2010-01-01", 2, 1, 1, "2018-11-05"]]}    */
                                    
 
select *
from books b 
left join orders o
on b.book_id = o.book_id 
where datediff('2019-06-23', available_from) > 30

/* output 
{"headers": ["book_id", "name", "available_from", "order_id", "book_id", "quantity", "dispatch_date"], "values": 
 [[1, "Kalila And Demna", "2010-01-01", 1, 1, 2, "2018-07-26"],
 [1, "Kalila And Demna", "2010-01-01", 2, 1, 1, "2018-11-05"], 
 [5, "The Hunger Games", "2008-09-21", 6, 5, 9, "2009-02-02"],   
 [5, "The Hunger Games", "2008-09-21", 7, 5, 8, "2010-04-13"],  
 [2, "28 Letters", "2012-05-12", null, null, null, null]]}         -- dispatch_date is null 
  
and dispatch_date between '2018-06-23' and '2019-06-23'条件把left join的结果抵消了
所以要先做条件过滤再join，先过滤再left join，这样left join能留下卖出0本的书 */
  
  
  
