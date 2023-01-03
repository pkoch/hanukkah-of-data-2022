select *
from customers
where customerid = (
    select customerid
    from customers c1
    join orders o1 using(customerid)
    join orders_items oi1 using(orderid)
    join products p1 using(sku)
    where p1.sku like 'COL%'
    group by customerid
    order by count(*) desc
    limit 1
);
