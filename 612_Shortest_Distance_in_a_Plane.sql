/* POWER( base, exponent )
eg. power(3,2), 3^2, output is 9. */

SELECT
  ROUND( MIN(SQRT(POWER(p1.x - p2.x, 2) + POWER(p1.y - p2.y, 2))), 2) as shortest
FROM point_2d p1
JOIN point_2d p2
ON p1.x != p2.x 
  OR p1.y != p2.y；
  
  
