select *
from customers
where customerid = (
    select customerid
    from customers c
    join orders using(customerid)
    join orders_items using(orderid)
    where citystatezip like 'Queens Village,%'
      and sku like 'PET%'
    group by customerid
    order by count(*) desc
    limit 1
);
