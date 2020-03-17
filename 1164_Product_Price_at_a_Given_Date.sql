with cte1 as (
select distinct product_id from products
),
cte2 as(
select top 1 with ties product_id ,new_price, change_date
from Products 
where change_date <= '2019-08-16'
order by rank()over(partition by product_id order by change_date desc)
)

select cte1.product_id, coalesce(cte2.new_price, 10) as price
from cte1
left join cte2
on cte1.product_id = cte2.product_id



##################################################################################################################

select product_id ,new_price, change_date
from Products 
where change_date <= '2019-08-16'
order by rank()over(partition by product_id order by change_date desc)

{"headers": ["product_id", "new_price", "change_date"], "values": [
[1, 35, "2019-08-16"], 
[2, 50, "2019-08-14"], 
[1, 30, "2019-08-15"], 
[1, 20, "2019-08-14"]]}

use "select top 1 with ties ..." to filter the most recent change, noticed that post_id = 1 have multiple changes_date.
{"headers": ["product_id", "new_price", "change_date"], "values": [
[1, 35, "2019-08-16"], 
[2, 50, "2019-08-14"]]}


where change_date <= '2019-08-16'
The question is to find the prices of all products on 2019-08-16. So I only need to consider product_id changed before 2019-08-16


