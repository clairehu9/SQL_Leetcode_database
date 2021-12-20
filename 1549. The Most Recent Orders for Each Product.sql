select product_name, product_id,order_id,order_date
from orders as o
join products as p
using(product_id)
where (product_id, order_date)in(
    select product_id, max(order_date) as order_date
    from orders
    group by product_id)
order by product_name, product_id, order_id asc

