-- Got two results. 315-618-5263 worked.
select c2.*
from customers c1
join orders o1 using(customerid)
join orders_items oi1 using(orderid)
join products p1 using(sku)
join products p2 on(
    trim(substring(p2.desc from '[^(]+')) = trim(substring(p1.desc, '[^(]+'))
    and p1.sku != p2.sku
)
join orders_items oi2 on(oi2.sku = p2.sku)
join orders o2 on(o2.orderid = oi2.orderid AND o2.ordered::date = o1.ordered::date)
join customers c2 on(c2.customerid = o2.customerid)
where c1.customerid = 8342 -- from 6.sql
  and p1.sku like 'HOM%' -- educated guess it was not a collectible.
;
