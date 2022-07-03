select
productid,
productname,
category,
subcategory,
sum(s.orderprofit) as profit
from {{ ref('stg_orders') }} s
group by 
productid,
productname,
category,
subcategory