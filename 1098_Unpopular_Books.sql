/*
First we need to account for all books and since the number of books which sold less than 10 times is of the interest here, 
we should account for the zero sold as well. In this case we need to do left join 
and be aware that we might get null values from the books that never sold and listed on Orders table. 
We also need to exclude the books which were available less than a month so we can safely filter those results out using the WHERE clause.

*/
ifnull

SELECT  b.book_id, b.name
FROM Books AS b
LEFT JOIN
Orders AS o
ON b.book_id = o.book_id
AND datediff('2019-06-23', dispatch_date) <=365
WHERE datediff('2019-06-23', available_from)>=30
GROUP BY b.book_id
HAVING SUM(quantity)<10 OR SUM(quantity) is null



SELECT o.book_id, b.name
FROM orders o
JOIN books b
ON o.book_id = b.book_id 
WHERE datediff('2019-06-23', available_from) > 30
AND dispatch_date BETWEEN  '2019-06-23' AND '201-06-23'
GROUP BY book_id,b.name
HAVING SUM(quantity) < 10 













