select 
    distinct s.product_id
    ,p.product_name
from sales s
left join product p
on s.product_id = p.product_id
where s.sale_date between '2019-01-01' and '2019-03-31'
and s.product_id not in (
    select product_id from sales
    where sale_date<'2019-01-01' or sale_date > '2019-03-31')
order by s.product_id



select a.product_id, max(product_name) as product_name
from Sales a
join Product b
on a.product_id = b.product_id
group by a.product_id
having max(sale_date) <= '2019-03-31'
  and min(sale_date) >= '2019-01-01'
  
  
select s.product_id,
product_name
from sales s
join product p
on s.product_id=p.product_id
group by s.product_id
having sum(if(sale_date between '2019-01-01' and '2019-03-31',0,1))=0
--If sale_date is between the spring period then 0, so if the sum is 0 means that all sale_date of this product are in the spring period.

