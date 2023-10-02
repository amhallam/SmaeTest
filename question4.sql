CREATE INDEX index_organization_id
ON example_4.transactions (organization_id);

select organization_id  from example_4.transactions t
group by organization_id 
