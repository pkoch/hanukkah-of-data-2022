begin;

CREATE TEMPORARY TABLE digit_to_regex (digit text, re text);
COPY digit_to_regex (digit, re) FROM stdin;
2	abc
3	def
4	ghi
5	jkl
6	mno
7	pqrs
8	tuv
9	wxyz
\.

create or replace function phone_to_re (phone text)
returns text
language plpgsql as $$
declare
    result text;
begin

 select string_agg(re, null) || '$'
 into result
 from (
    select '[' || re || ']' as re
    from string_to_table(phone, null) WITH ORDINALITY as elems
    join digit_to_regex d2r on(elems = d2r.digit)
    order by ORDINALITY asc
 ) a;

 return result;
end;
$$;

select "name", phone from customers where (lower(translate("name", '-10', '')) ~ phone_to_re(phone));

drop function phone_to_re;
commit;
