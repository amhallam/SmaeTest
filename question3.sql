CREATE INDEX product_id_index ON  example_3.product_prices USING HASH (product_id);

create view valid_product_prices as (
	select  P."name" , pp.product_price  , pp.published_date  , pp.unit_of_measure , p.unit_of_measure
	from example_3.product_prices pp 
	left join example_3.products p 
	on pp.product_id = p.id 
	and pp.unit_of_measure  = p.unit_of_measure
	where p.unit_of_measure is not null 
	and pp.unit_of_measure is not null
)
