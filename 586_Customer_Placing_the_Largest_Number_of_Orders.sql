SELECT customer_number
FROM orders
GROUP BY customer_number
HAVING COUNT(order_number) = (
	SELECT COUNT(order_number) cnt
	FROM orders
	GROUP BY customer_number
	ORDER BY cnt DESC
	LIMIT 1
)

/* wrong
SELECT customer_number
FROM orders
WHERE order_number = (SELECT COUNT(order_number) cnt
	                    FROM orders
	                    GROUP BY customer_number
	                    ORDER BY cnt DESC
                        LIMIT 1)
			
			
 */
