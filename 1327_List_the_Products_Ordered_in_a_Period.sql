# get the names of products with greater than or equal to 100 units ordered in February 2020 and their amount

select product_name, t.unit
from products p
join 
     (select product_id, sum(unit) as unit from orders 
      where month(order_date) = '02'and year(order_date) ='2020'
      group by product_id
      having sum(unit) >= 100) as t
on t.product_id = p.product_id
