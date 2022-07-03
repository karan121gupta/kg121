select
-- from raw orders
o.order_id,
o.order_date,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordersellingprice,
o.ordercostprice,
c.customername,
c.segment,
c.country,
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} o
left join
{{ ref('raw_customer') }} c
on
o.customerid = c.customerid
left join
{{ ref('raw_product') }} p
on
o.productid = p.productid