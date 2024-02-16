select SKU, Product_Name
from product
where ID not in (select product_id from invoice_item)
order by SKU asc;