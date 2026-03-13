
-- Transaction :

Select @@autocommit;

SET autocommit=0;


CREATE DATABASE IF NOT EXISTS prime;

USE prime;

CREATE TABLE accounts(
 id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(50),
 balance DECIMAL (10,2)
);


 INSERT INTO accounts
 (name,balance)
 VALUES
 ("adam",500.00),
 ("bob",300.00),
 ("charlie",1000.00);


-- 1.COMMIT

START TRANSACTION;
UPDATE accounts SET balance =balance-50 WHERE id=1;
UPDATE accounts SET balance =balance+50 WHERE id=2;
COMMIT;

-- 2.ROLLBACK

START TRANSACTION;
UPDATE accounts SET balance =balance-50 WHERE id=1;
UPDATE accounts SET balance =balance+50 WHERE id=2;
ROLLBACK;

START TRANSACTION;
UPDATE accounts SET balance =balance-50 WHERE id=1;
COMMIT;
UPDATE accounts SET balance =balance+50 WHERE id=2;
ROLLBACK;

-- 3.SAVEPOINTS
SELECT * FROM accounts;
START TRANSACTION;
UPDATE accounts SET balance =balance+1000 WHERE id=1;
SAVEPOINT after_wallet_topup;

UPDATE accounts SET balance =balance+10 WHERE id=1;
-- some error occured here
ROLLBACK TO after_wallet_topup;
COMMIT;

-- JOINS:-

CREATE TABLE customers(
   customer_id INT PRIMARY KEY,
   name VARCHAR(50),
   city VARCHAR(50)
);

INSERT INTO customers
VALUES
(1,"alice","mumbai"),
(2,"bob","delhi"),
(3,"charlie","bangalore"),
(4,"david","mumbai");

CREATE TABLE orders(
   order_id INT PRIMARY KEY,
   customer_id INT,
   amount INT
);

INSERT INTO orders
VALUES
(101,1,500),
(102,1,900),
(103,2,300),
(104,5,700);

SELECT * FROM customers;
SELECT * FROM orders;

-- 1. INNER JOIN
SELECT c.customer_id,o.order_id,c.name
FROM customers c
INNER JOIN orders o
ON c.customer_id=o.customer_id;

-- 2. LEFT JOIN 
SELECT  *
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id;

-- 3. RIGHT JOIN 
SELECT  *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id=o.customer_id;

-- 4. OUTER JOIN 

SELECT  *
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id
UNION
SELECT  *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id=o.customer_id;

-- 5.CROSS JOIN

SELECT  *
FROM customers c
CROSS JOIN orders o;

-- 6.SELF JOIN

SELECT  *
FROM customers as A
JOIN customers as B 
ON A.customer_id=B.customer_id;



-- EXCLUSIVE JOIN

SELECT  *
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id
WHERE o.customer_id IS NULL;


SELECT  *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id=o.customer_id
WHERE c.customer_id IS NULL;


-- Sub-Queries

-- 1.Inside WHERE
SELECT * 
FROM orders
WHERE amount>(
   SELECT AVG(amount)
   FROM orders
);

-- 2.Inside SELECT
SELECT name,
    ( 
    SELECT COUNT(*)
    FROM orders o
    WHERE o.customer_id=c.customer_id
    )AS order_count
FROM customers c;

-- 3. Inside FROM
SELECT
   summary.customer_id,
   summary.avg_amount
FROM
  (
     SELECT
         customer_id,
         AVG(amount) AS avg_amount
	 FROM orders
     GROUP BY customer_id
   ) AS summary;
     


-- VIEWS in SQL

CREATE VIEW view1 AS
SELECT customer_id,name FROM customers;

SELECT * FROM view1;


CREATE VIEW view2 AS
SELECT c.customer_id,c.name,o.order_id
FROM customers c
INNER JOIN orders o
ON c.customer_id=o.customer_id;

SELECT * FROM view2;

DROP VIEW view1;

-- INDEX in SQL
-- makes read queries faster BUT
-- makes write queries slower

SELECT * FROM accounts;

-- 1. SINGLE COLUMN INDEX
CREATE INDEX idx_balance ON accounts(balance);

-- 2.Composite INDEX
CREATE INDEX idx2 ON accounts(balance,name);

SHOW INDEX FROM accounts;

DROP INDEX idx2 ON accounts;


-- STORED PROCEDURE

DELIMITER $$

CREATE PROCEDURE check_balance(IN acc_id INT)
BEGIN 
    SELECT balance
    FROM accounts
    WHERE id =acc_id;
END$$

DELIMITER ;


CALL check_balance(1);

DROP PROCEDURE check_balance;


DELIMITER $$

CREATE PROCEDURE check_balance1(IN acc_id INT, OUT bal DECIMAL(10,2))
BEGIN 
    SELECT balance INTO bal
    FROM accounts
    WHERE id =acc_id;
END$$

DELIMITER ;


CALL check_balance1(1,@balance);
SELECT @balance;











































































































