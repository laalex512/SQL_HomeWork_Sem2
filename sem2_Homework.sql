DROP DATABASE IF EXISTS homework2;
CREATE DATABASE IF NOT EXISTS homework2;

USE homework2;

# Задание 1
CREATE TABLE IF NOT EXISTS sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
count_product INT
);

TRUNCATE TABLE sales; -- чтобы запускать полностью весь скрипт, а не пошагам

INSERT INTO sales (order_date, count_product)
	VALUES 
		("2022-01-01", 156),
		("2022-01-02", 180),
		("2022-01-03", 21),
		("2022-01-04", 124),
		("2022-01-05", 341);

SELECT * FROM sales;

-- Задание 2
-- Вариант с Case:
SELECT 
	id AS "id заказа",
    CASE 
		WHEN count_product < 100 THEN "Маленький заказ"
        WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
        ELSE "Большой заказ"
	END AS "Тип заказа"
FROM sales;

-- Вариант с IF:
SELECT
	id AS "id заказа",
    IF (count_product < 100, "Маленький заказ",
		IF (count_product > 300, "Большой заказ", "Средний заказ"))
	AS "Тип заказа"
FROM sales;

-- Задание 3
CREATE TABLE IF NOT EXISTS orders
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(45),
amount DECIMAL(10,2) NOT NULL,   -- 10 - максимум цифр, 2 - после запятой (по условию)
order_status VARCHAR(45)
);

TRUNCATE TABLE orders; 

INSERT INTO orders (employee_id, amount, order_status)
	VALUES 
		("e03", 15.00, "OPEN"),
		("e01", 25.50, "OPEN"),
		("e05", 100.70, "CLOSED"),
		("e02", 22.18, "OPEN"),
		("e04", 9.50, "CANCELLED");

SELECT * FROM orders;

-- По аналогии с 2 заданием два варианта:
SELECT 
	id, employee_id, amount,
    CASE 
		WHEN order_status = "OPEN" THEN "Order is in open state"
        WHEN order_status = "CLOSED" THEN "Order is closed"
        ELSE "Order is cancelled"
	END AS "full_order_status"
FROM orders;

SELECT
	id, employee_id, amount,
    IF (order_status = "OPEN", "Order is in open state",
		IF (order_status = "CLOSED", "Order is closed", "Order is cancelled"))
	AS "full_order_status"
FROM orders;






