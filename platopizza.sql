-- MODIFY order_date DATATYPE

ALTER TABLE orders
MODIFY COLUMN order_date DATE;

-- JOINING TABLES AND SELECT THE COULMNS YOU WILL NEEDED IT IN THE ANLAYSIS
WITH T1 AS (
SELECT order_details_id, order_id, quantity, order_date, order_time, pizza_type_id, pizza_name,category, pizza_id, size, price
FROM 
(
SELECT *
FROM
(SELECT *
FROM
(SELECT *
FROM order_details od
LEFT JOIN orders o 
ON od.order_id = o.ord_id) j1
JOIN pizzas p 
ON j1.p_id = p.pizza_id) j2
JOIN pizza_types pz
ON j2.pz_type_id = pz.pizza_type_id ) j3) 

SELECT *, (quantity * price) as total_price FROM T1;




