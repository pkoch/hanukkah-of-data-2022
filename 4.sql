select c.*
from customers c
where customerid = (
    select customerid
    from orders o
        join orders_items oi using(orderid)
        join products p using(sku)
        join customers c using(customerid)
    where o.ordered::time < '05:00'::time
      and p.sku like 'BKY%' -- Bakery items start with BKY
    group by 1
    order by count(distinct orderid) desc
    limit 1
);
