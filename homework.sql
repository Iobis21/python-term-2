SQL
-- 1. customerName, phone, city, country ველების წამოღება
SELECT customerName, phone, city, country
FROM customers
LIMIT 10;

-- 2. postalCode > 1370 და salesRepEmployeeNumber > 150
SELECT *
FROM customers
WHERE postalCode > 1370 AND salesRepEmployeeNumber > 150
LIMIT 10;

-- 3. customerName შეიცავს ტექსტს 'Mini'
SELECT *
FROM customers
WHERE customerName LIKE '%Mini%'
LIMIT 10;

-- 4. state არის 'CA' ან 'NY'
SELECT *
FROM customers
WHERE state IN ('CA', 'NY')
LIMIT 10;

-- 5. creditLimit > 10000
SELECT *
FROM customers
WHERE creditLimit > 10000
LIMIT 10;