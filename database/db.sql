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


-- Table Queries:-

-- 3. UPDATE:To update existing rows

-- You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  
-- To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
-- SET SQL_SAFE_UPDATES=0

SET SQL_SAFE_UPDATES=0;

UPDATE users
SET followers =11
where age=16;

SELECT * FROM users;

-- 4.DELETE

DELETE FROM users
where age =14;


-- 5.ALTER :to change the schema

-- ADD COULMN
ALTER TABLE users
ADD COLUMN city VARCHAR(25) DEFAULT "Delhi";

-- DROP COLUMN
ALTER TABLE users
DROP COLUMN city;

-- RENAME TABLE
ALTER TABLE users
RENAME TO insta_user;

ALTER TABLE insta_user
RENAME TO users;

-- CHANGE COlUMN (TO rename)
ALTER TABLE users
CHANGE COLUMN followers subs INT DEFAULT 0;

-- MODIFY COLUMN(modify datatype/constraint)
ALTER TABLE users
MODIFY subs INT DEFAULT 5;
SELECT * FROM users;

-- 5.TRUNCATE :to delete table data 
TRUNCATE TABLE users; -- gives error because of foreign key reference

DROP TABLE posts; -- droping the foreign key table
TRUNCATE TABLE users;

DROP TABLE users;


-- Practice Question 1:

CREATE DATABASE IF NOT EXISTS college;

USE college;

CREATE TABLE teacher(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    salary INT
);


INSERT INTO teacher
(id,name,subject,salary)
VALUES
(23,"ajay","mat",50000),
(47,"bharat","english",60000),
(18,"chetan","chemistry",45000),
(9,"divya","chemistry",75000);


SELECT * FROM teacher;

SELECT * FROM teacher
where salary >50000;

ALTER TABLE teacher
CHANGE COLUMN salary ctc INT;

UPDATE teacher
SET ctc=ctc+ctc*0.25;

ALTER TABLE teacher
ADD COLUMN city VARCHAR(50)DEFAULT "Guragon";


ALTER TABLE teacher
DROP COLUMN ctc;



































