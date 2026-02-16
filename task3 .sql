CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(50),
    customer_state VARCHAR(5)
);

CREATE TABLE orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);

CREATE TABLE payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(20),
    payment_installments INT,
    payment_value DECIMAL(10,2)
);

CREATE TABLE products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);
SELECT * FROM customers LIMIT 10;
-- Orders from São Paulo (SP)-- 
SELECT *
FROM customers
WHERE customer_state = 'SP';

-- Latest Orders-- 
SELECT order_id, order_purchase_timestamp
FROM orders
ORDER BY order_purchase_timestamp DESC;

-- Total Revenue-- 
SELECT SUM(payment_value) AS total_revenue
FROM payments;

-- Average Payment Value-- 
SELECT AVG(payment_value) AS avg_payment
FROM payments;

-- Total Orders-- 
SELECT COUNT(order_id) AS total_orders
FROM orders;

-- Orders by State-- 
SELECT c.customer_state,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

-- Revenue by Payment Type-- 
SELECT payment_type,
       SUM(payment_value) AS revenue
FROM payments
GROUP BY payment_type
ORDER BY revenue DESC;

-- Customer Orders with City-- 
SELECT c.customer_city,
       o.order_id,
       o.order_status
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Product Category Sales-- 
SELECT p.product_category_name,
       SUM(oi.price) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_sales DESC;

-- Total Revenue Per Order-- 
SELECT oi.order_id,
       SUM(oi.price + oi.freight_value) AS order_total
FROM order_items oi
GROUP BY oi.order_id;

-- Orders Above Average Payment-- 
SELECT order_id, payment_value
FROM payments
WHERE payment_value >
      (SELECT AVG(payment_value) FROM payments);
      
-- Customers with High Spending Orders-- 
SELECT o.customer_id, p.payment_value
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_value >
      (SELECT AVG(payment_value) FROM payments);
      
-- CREATE VIEW (FOR ANALYSIS)-- 
CREATE VIEW category_sales AS
SELECT p.product_category_name,
       SUM(oi.price) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name;

SELECT * FROM category_sales;


