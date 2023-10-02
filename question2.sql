CREATE INDEX ship_date_brin ON example_2.transactions USING brin(ship_date); -- brin index , works best for dates / ordered columns
CREATE INDEX product_id_index ON  example_2.transactions USING HASH (product_id); -- hash index


select  product_id ,transaction_type , unit_of_measure 
from example_2.transactions t 
where product_id = 50 
and ship_date between '2022-06-01' and '2022-07-01'
