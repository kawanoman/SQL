JOIN USING Parameter


USE sql_invoicing;

SELECT  
      p.date ,
      c.name AS client,
      p.amount ,
      pm.name AS payment_method
FROM  payments p

JOIN clients c USING (client_id)
JOIN payment_methods pm  ON p.payment_method = pm.payment_method_id


——
Cross Join


USE sql_store;

SELECT 
	sh.name AS shipper,
    p.name AS product

FROM shippers sh

CROSS JOIN products p 

ORDER BY sh.name



——

Insert Values


INSERT INTO customers(
first_name,
last_name,
birth_date,
address,
city,
state
)
VALUES ( 'KAWA','NOMAN','1991-01-30','Koblenzer Strasse 52','Bielefeld','NRW')



——




INSERT INTO products(name, quantity_in_stock,unit_price
)
VALUES ( 'product1',10,1.56),
       ( 'product2',13,1.5536),
       ( 'product3',14,1.446)
