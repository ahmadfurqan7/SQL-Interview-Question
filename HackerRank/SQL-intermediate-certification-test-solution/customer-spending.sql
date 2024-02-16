set @a=(select avg(total_price) from INVOICE)

select a.customer_name, avg(b.total_price)
from CUSTOMER a
join INVOICE b
on a.id=b.customer_id
group by a.customer_name
having avg(b.total_price) <= @a
order by avg(b.total_price) desc;