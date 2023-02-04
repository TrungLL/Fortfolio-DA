
-- DATA SET 

SELECT
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name) AS customers,
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name, -- brand of product purchased
	bra.brand_name,
	sto.store_name, --store which sales took place
	sum(ite.quantity) AS total_units, 
	SUM(ite.quantity * ite.list_price) AS revenue,
	CONCAT(sta.first_name, ' ', sta.last_name) AS staff_sale --staff sales product
FROM sales.orders AS ord
JOIN sales.customers AS cus
ON cus.customer_id = ord.customer_id
JOIN sales.order_items AS ite
ON ite.order_id = ord.order_id
JOIN production.products AS pro
ON pro.product_id = ite.product_id
JOIN production.categories AS cat
ON cat.category_id = pro.category_id
JOIN sales.stores AS sto
ON sto.store_id = ord.store_id
JOIN sales.staffs AS sta
ON sta.staff_id = ord.staff_id
JOIN production.brands AS bra
ON bra.brand_id = pro.brand_id
GROUP BY
	ord.order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	bra.brand_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name)
	

--Step 2: CLEANING connect to Excel
	-- DATA NO REDUNDANCIES

SELECT @@SERVERNAME