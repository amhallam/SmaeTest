with product_pricing as ( -- select product and their pricing ordered by date
	select  P."name" , pp.product_price  , pp.published_date  , rank() OVER (PARTITION BY product_id   ORDER BY published_date  desc) as rank
	from example_1.product_prices pp 
	left join example_1.products p 
	on pp.product_id = p.id 
	where name in ('Product-100','Product-200','Product-300','Product-400' )
	and published_date  <= '2022-06-10'
) , dedup_product_pricing as (  -- select top price before 10th June
	select *, rank() OVER (PARTITION BY name, published_date   ORDER BY product_price  desc)  as dedup
	from product_pricing where rank = 1
)
select name, product_price , published_date  
from dedup_product_pricing where dedup = 1 --remove duplicate pricing / same day
