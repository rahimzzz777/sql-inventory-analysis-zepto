-- Data Exploration


-- count of rows 

SELECT 
	COUNT ( * )
FROM
	zepto;


-- sample data

SELECT 
	*
FROM
	zepto
LIMIT 
	10;


-- Null Values

SELECT
	*
FROM
	zepto
WHERE
	category IS NULL 
	OR
	name IS NULL 
	OR
	mrp IS NULL 
	OR
	discount_percent IS NULL 
	OR
	available_quantity IS NULL 
	OR
	discounted_selling_price IS NULL 
	OR
	weight_in_gms IS NULL 
	OR
	out_of_stock IS NULL 
	OR
	quantity IS NULL;


-- Different Product Categories

SELECT
	DISTINCT ( category )
FROM 
	zepto
ORDER BY 
	category ASC;


-- How many products in stock vs out of stock?

SELECT
	out_of_stock,
	COUNT ( sku_id )
FROM 
	zepto
GROUP BY
	out_of_stock;


/*	Product names that are repeated 
	( common in e commerce data because of different packaging, different weight etc. ) */

SELECT
	name,
	COUNT ( sku_id ) AS " number_of_sku's "
FROM
	zepto
GROUP BY
	name
HAVING 
	COUNT( sku_id ) > 1
ORDER BY
	COUNT ( sku_id ) DESC;


-- Data Cleaning

SELECT
	*
FROM
	zepto
WHERE
	mrp = 0 
	OR
	discounted_selling_price = 0;

DELETE
FROM
	zepto
WHERE
	mrp = 0;


-- Convert paise to rupees 

UPDATE
	zepto
SET 
	mrp = mrp / 100.00,
	discounted_selling_price = discounted_selling_price / 100.00;

SELECT
	mrp,
	discounted_selling_price
FROM
	zepto;


-- Q1. Find the top 10 best-value products based on the discount percentage.

SELECT
	DISTINCT name,
	mrp,
	discount_percent
FROM
	zepto
ORDER BY 
	discount_percent DESC
LIMIT
	10;


-- Q2. What are the products with high MRP but out of stock?

SELECT
	DISTINCT name,
	mrp
FROM
	zepto
WHERE
	out_of_stock = TRUE
	AND
	mrp > 300
ORDER BY
	mrp DESC;


-- Q3. Calculate estimated revenue for each category.

SELECT
	category,
	SUM ( discounted_selling_price * available_quantity ) AS total_revenue
FROM
	zepto
GROUP BY
	category
ORDER BY 
	total_revenue DESC;


-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

SELECT
	name,
	mrp,
	discount_percent
FROM
	zepto
WHERE
	mrp > 500
	AND
	discount_percent < 10
ORDER BY
	discount_percent DESC;


-- Q5. Identify the top 5 categories offering the highest average discount percentage.

SELECT
	DISTINCT category,
	ROUND ( AVG ( discount_percent ) , 2 ) AS avg_discount_percent
FROM
	zepto
GROUP BY
	category
ORDER BY 
	avg_discount_percent DESC
LIMIT 5;


-- Q6. Find the price per gram for products above 100g and sort by best value.


SELECT 
	DISTINCT name,
	weight_in_gms,
	discounted_selling_price,
	ROUND ( discounted_selling_price / weight_in_gms, 2 ) AS price_per_gram
FROM
	zepto
WHERE
	weight_in_gms > 100
ORDER BY
	price_per_gram;


-- Q7. Group the products into categories like Low, Medium, Bulk.

SELECT
	DISTINCT name,
	weight_in_gms,
	CASE
		WHEN weight_in_gms < 1000 THEN 'Low'
		WHEN weight_in_gms < 5000 THEN 'Medium'
		ELSE 'Bulk'
	END AS weight_category
FROM
	zepto
ORDER BY
	weight_in_gms;


-- Q8. What is the total inventory weight per category?

SELECT
	category,
	SUM ( weight_in_gms * available_quantity ) AS total_weight
FROM
	zepto
GROUP BY 
	category
ORDER BY
	total_weight DESC;