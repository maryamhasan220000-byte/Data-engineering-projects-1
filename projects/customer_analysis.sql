-- =====================================
-- CUSTOMER ANALYSIS PROJECT
-- =====================================

-- 1. CREATE DATABASE
Create database CustomerProject 
USE CustomerProject

-- 2. CREATE TABLES
CREATE TABLE Customers ( Customer_id INT, name VARCHAR(30),city VARCHAR(30),)
CREATE TABLE Orders ( Order_id INT, customer_id INT, product VARCHAR(30), amount INT)

-- 3. INSERT DATA
INSERT INTO Customers VALUES
(1, ' alice ', 'london'),
(2, 'BOB', 'LONDON'),
(3, 'charlie', 'manchester'),
(4, ' DAVID ', 'Manchester'),
(5, 'eve', 'birmingham'),
(6, ' FRANK', 'Birmingham'),
(7, 'grace ', 'Leeds'),
(8, ' HARRY', 'leeds');

INSERT INTO orders VALUES
(101, 1, 'laptop', 800),
(102, 2, 'phone', 500),
(103, 1, 'tablet', 300),
(104, 3, 'laptop', 900),
(105, 4, 'phone', 400),
(106, 5, 'tablet', 350),
(107, 6, 'laptop', 1000),
(108, 2, 'tablet', 200),
(109, 3, 'phone', 600),
(110, 5, 'laptop', 750),
(111, 7, 'phone', 450),
(112, 8, 'laptop', 1200),
(113, 7, 'tablet', 250),
(114, 6, 'phone', 650);
-- =====================================
-- 4. ANALYSIS QUERIES
-- =====================================

-- 1. Customers with total spending
SELECT 
    c.name,
    SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.name;

-- 2. High value customers (>1000)
SELECT 
    c.name,
    SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING SUM(o.amount) > 1000;

-- 3. Revenue per product
SELECT 
    product,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY product;

-- 4. Clean customer names
SELECT 
    UPPER(TRIM(name)) AS clean_name,
    city
FROM customers;

-- 5. Orders above 500
SELECT *
FROM orders
WHERE amount > 500;
-- =====================================
-- FINAL SUMMARY
-- =====================================

SELECT 
    c.name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_revenue DESC;



