Create database CustomerProject 
USE CustomerProject

CREATE TABLE Customers ( Customer_id INT, name VARCHAR(30),city VARCHAR(30),)
CREATE TABLE Orders ( Order_id INT, customer_id INT, product VARCHAR(30), amount INT)

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
 SELECT * FROM Customers 
SELECT * FROM Orders 

SELECT * 
FROM orders 
WHERE amount > 500

SELECT c.name, SUM(o.amount) 
FROM customers as c
JOIN orders as o
on c.customer_id = o.customer_id 
GROUP BY c.name 

SELECT c.name, o.amount 
FROM customers as c
JOIN orders as o
ON c.customer_id = o.customer_id 
 
SELECT c.name , 
 COUNT(o.order_id) AS total_spent
FROM customers AS c 
INNER JOIN orders AS O
 ON c.customer_id = o.customer_id 
 GROUP BY c.name 

SELECT TOP 1
c.name , COUNT(o.amount) AS total_spent 
FROM customers as c
INNER JOIN orders as o 
ON c.customer_id = o.customer_id 
GROUP BY c.name 
ORDER BY total_spent 

--SELECT o.product, 
--SUM(o.amount) AS Total_revenue
--FROM orders as o
--GROUP BY o.product 

--SELECT c.name,
--SUM(o.amount)
--FROM customers AS c
--INNER JOIN orders as o
--on c.customer_id = o.customer_id 
--GROUP BY c.name 
--HAVING SUM(o.amount) > 500

--SELECT 
--TRIM(name) AS clean_name 
--FROM customers

--SELECT 
--CONCAT(c.name, ' Spent ', o.amount) AS description 
--FROM customers as c
--INNER JOIN orders as o
--ON c.customer_id = o.customer_id 

--SELECT 
--UPPER(TRIM(product)) AS clean_product 
--FROM orders
 
SELECT 
c.name, 
COUNT(o.order_id) AS total_order,
SUM(o.amount) AS total_revenue 
FROM customers AS c 
INNER JOIN orders AS o
ON c.customer_id = o.customer_id 
GROUP BY c.name 



