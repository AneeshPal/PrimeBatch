CREATE DATABASE xyz_company;

DROP DATABASE college;
DROP DATABASE school;

USE  xyz_company;

CREATE TABLE student(
    rollno INT,
    name VARCHAR(30),
    age INT
);

CREATE DATABASE IF NOT EXISTS instagram;

DROP DATABASE IF EXISTS instagram;

SHOW DATABASES;

SHOW TABLES;

-- TABLE QUERIES:

-- 1.CREATE

-- CONSTRAINTS
-- 1.not null
-- 2.unique
-- 3.defualt
-- 4.check

CREATE TABLE user(
id INT,
age INT,
name VARCHAR(30) NOT NULL,
email VARCHAR(50) UNIQUE,
followers INT DEFAULT 0,
following INT,
CONSTRAINT CHECK(AGE>13)
);

-- TWO More constraint:
-- 1.primary key
-- 2. foreign key

DROP TABLE user;

CREATE TABLE users (
id INT PRIMARY KEY,
age INT,
name VARCHAR(30) NOT NULL,
email VARCHAR(50) UNIQUE,
followers INT DEFAULT 0,
following INT DEFAULT 0,
CHECK (age > 13)
);

CREATE TABLE posts (
id INT PRIMARY KEY,
content VARCHAR(100),
user_id INT,
FOREIGN KEY (user_id) REFERENCES users(id)
);

-- TABLE QUERIES:

-- 2.INSERT

INSERT INTO users
(id,age,name,email,followers,following)
VALUES
(1,14,"adam","adam@yahoo.in",123,145),
(2,16,"bob","bob@gmail.com",200,200);

-- 3.SELECT

SELECT id,name,email from users;
SELECT * from users;

-- 4.DISTINCT

SELECT DISTINCT age from users;



-- WHERE Clause: to define some condition

SELECT * FROM users 
WHERE followers<200;

-- WHERE Clause:Operators
-- 1. arithmetic
-- 2. comparison
-- 3. logical
-- 4. bitwise

-- frequently used operator
-- 1. AND
-- 2. OR
-- 3. BETWEEN
-- 4.IN
-- 5 NOT

-- LIMIT Clause
SELECT * FROM users
LIMIT 1;


-- ORDER BY Clause
SELECT * FROM users
ORDER BY age DESC;


-- Aggregate Function:
-- 1.COUNT()
-- 2.MAX()
-- 3.MIN()
-- 4.SUM()
-- 5.AVG()

SELECT MAX(followers)
FROM users;


-- GROUP BY Clause
SELECT age ,COUNT(ID)
FROM users
GROUP BY age;

-- we get error here apart from aggregate function we can select those columns only which are part of GROUP BY Clause
SELECT name,age ,COUNT(ID)
FROM users
GROUP BY age;

-- HAVING Clause
SELECT age ,MAX(followers)
FROM users
GROUP BY age
HAVING MAX(followers)>200;


-- GENERAL ORDER 
-- SELECT 
-- FROM
-- WHERE 
-- GROUP BY
-- HAVING 
-- ORDER BY






























