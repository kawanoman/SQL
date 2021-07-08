The SELECT Funktion


SELECT * FROM sql_inventory.products;

SELECT name , unit_price , unit_price*1.1 AS 'new price'
FROM products



——


WHERE Funktion


“A string a sequence of charachrters”




SELECT * FROM customers
WHERE birth_date > '1990-01-01'



SELECT * FROM orders

WHERE order_date >= '2019-01-01'



——



And, Or, Not Operators


WHERE  birth_date <= '1991-01-01' AND points <= 1000 



WHERE order_id = 6 AND quantity*unit_price > 30 

—


The IN Operator 

WHERE quantity_in_stock IN (49,38,72)


——
BETWEEN Operator 



WHERE birth_date  BETWEEN '1990-01-01' AND '2000-01-01'

— % any number of characters

— _ single character



SELECT * FROM  customers

WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%'


—


SELECT * FROM  customers



WHERE phone NOT  LIKE '___________9' 



—
REGEXP


SELECT * FROM  customers

WHERE  last_name    REGEXP  'field$|mac|rose' 


^beginning 
$ end 

| logical or 

[abcds]

[a-h]

SELECT * FROM  customers

-- WHERE  first_name    REGEXP  'ELKA|AMBUR' 
-- WHERE last_name    REGEXP  'EY$|ON$' 
-- WHERE last_name    REGEXP '^MY|SE' 
WHERE last_name    REGEXP  'br|bu' 


——


The Nulll Order

WHERE orders IS NULL



——
Order 



SELECT  first_name , last_name, 10 AS points 

FROM customers

ORDER BY  1 , 2



SELECT * , quantity * unit_price AS total_price
 FROM order_items 
WHERE order_id =2
ORDER BY total_price DESC



SELECT  *

FROM customers

ORDER BY points DESC
LIMIT 3


—


SELECT
Where
Order by
Limlit

—


—

Inner Jonis

SELECT order_id , oi.product_id , quantity, oi.unit_price

FROM order_items oi

JOIN  products p  ON oi.product_id = p.product_id


——


Join Database

USE sql_inventory;

SELECT  *

FROM sql_store.order_items oi

JOIN products p
     ON oi.product_id = p.product_id
——


Join 2 Tables


USE sql_hr;

SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees e
JOIN employees m 
     ON e.reports_to = m.employee_id



——
Join mutable tables



USE sql_store;

SELECT o.order_id,
       o.order_date,
       c.first_name,
       c.last_name,
       os.name AS status
       
       
FROM orders o
JOIN customers c
     ON o.customer_id = c.customer_id
     
JOIN order_statuses os 
     ON o.status = os.order_status_id





USE sql_invoicing;

SELECT * FROM  payments p 
JOIN clients c ON c.client_id = p.payment_id
JOIN payment_methods pm  ON   p.payment_method = pm.payment_method_id  


——

Compound Join Conditions



USE sql_store;
-- Implicit join Syntax

SELECT  p.product_id,
        p.name,
        oi.quantity


FROM   products p
-- WHERE o.customer_id = c.customer_id
 LEFT JOIN order_items oi
		ON p.product_id =  oi.product_id 
ORDER BY  p.product_id   



—



