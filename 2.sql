select distinct c.*
from customers c
join orders o using(customerid)
join orders_items oi1 on(oi1.orderid = o.orderid)
join products p1 on(p1.sku = oi1.sku)
join orders_items oi2 on(oi2.orderid = o.orderid)
join products p2 on(p2.sku = oi2.sku)
where true
    and p1.desc ilike '%coffee%'
    and p2.desc ilike '%bagel%'
    and c.name like 'J%'
    and c.name like '%D%'
