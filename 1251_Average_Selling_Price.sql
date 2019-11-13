SELECT 
    p.product_id
    ,ROUND(SUM(p.price * s.units)/SUM(units),2) AS average_price
FROM Prices p
JOIN UnitsSold s
ON p.product_id = s.product_id
WHERE s.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id
ORDER BY p.product_id;
    
/*
1.Average selling price = Total Price of Product / Number of products sold
  SUM(p.price * s.units)/SUM(units)
  
2. Purchase_date is between the start date and end_date
  Use between and function
 
*/
