with first as (
select top 1 with ties delivery_id, customer_id, order_date, customer_pref_delivery_date
from Delivery order by rank() over (partition by customer_id order by order_date)
)

select round(100 * sum(case when order_date = customer_pref_delivery_date then 1.0 else 0.0 end)/    
             count(distinct customer_id), 2) as immediate_percentage from first;


-- then 1 else 0 end don't work on leetcode
#####################################################################################################


select  *
from Delivery order by rank() over (partition by customer_id order by order_date)

{"headers": ["delivery_id", "customer_id", "order_date", "customer_pref_delivery_date"], "values": [
[1, 1, "2019-08-01", "2019-08-02"],   
[2, 2, "2019-08-02", "2019-08-02"], 
[5, 3, "2019-08-21", "2019-08-22"], 
[7, 4, "2019-08-09", "2019-08-09"], 
[4, 3, "2019-08-24", "2019-08-24"], 
[6, 2, "2019-08-11", "2019-08-13"], 
[3, 1, "2019-08-11", "2019-08-12"]]}  

select top 1 with ties delivery_id, customer_id, order_date, customer_pref_delivery_date
from Delivery order by rank() over (partition by customer_id order by order_date)

{"headers": ["delivery_id", "customer_id", "order_date", "customer_pref_delivery_date"], "values": [
[1, 1, "2019-08-01", "2019-08-02"], 
[2, 2, "2019-08-02", "2019-08-02"], 
[5, 3, "2019-08-21", "2019-08-22"], 
[7, 4, "2019-08-09", "2019-08-09"]]}


