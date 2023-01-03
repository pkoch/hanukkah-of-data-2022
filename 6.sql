select *
from customers
where customerid = (
    select customerid
    from orders
    join orders_items using(orderid)
    join products using(sku)
    join customers using(customerid)
    where unit_price < wholesale_cost
    group by customerid
    order by count(*) desc
    limit 1
);
