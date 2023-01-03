select c.*
from customers c
where customerid = (
    select customerid
    from orders o
    join orders_items oi using(orderid)
    where o.ordered::time < '05:00'::time
      and oi.sku like 'BKY%' -- Bakery items start with BKY, as per a spot check.
    group by 1
    order by count(distinct orderid) desc
    limit 1
);
