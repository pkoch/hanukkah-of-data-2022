select distinct c.*
from customers c
join orders o using(customerid)
join orders_items oi1 using(orderid)
join products p1 on(p1.sku = oi1.sku)
join orders_items oi2 using(orderid)
join products p2 on(p2.sku = oi2.sku)
where p1.desc ilike '%coffee%'
  and p2.desc ilike '%bagel%'
  and c.name like 'J%'
  and c.name like '%D%'
;
