with cte as (
select order_id,
sum(ordersellingprice) as total_sp 
from {{ ref('raw_orders') }}
group by 1
having sum(ordersellingprice)<0
)
select * from cte