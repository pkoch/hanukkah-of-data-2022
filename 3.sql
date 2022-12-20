select c.*
from customers c
where true
    and extract(year from birthdate)::int % 12 = 2
    and citystatezip like '% 11420' -- Same "neighborhood" from 2.sql
    and make_date(
            1900,
            extract(month from birthdate)::int,
            extract(day from birthdate)::int
        ) between '1900-03-21'::date  and '1900-04-19'::date
