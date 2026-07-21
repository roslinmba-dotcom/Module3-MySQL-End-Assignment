CREATE DATABASE sales_trend;
USE sales_trend;
CREATE TABLE learners(
learner_id INT PRIMARY KEY,
full_name VARCHAR(100),
country VARCHAR(50)
);
CREATE TABLE courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
category VARCHAR(50),
unit_price DECIMAL(10,2)
);
CREATE TABLE purchases(
purchase_id INT PRIMARY KEY,
learner_id INT,
course_id INT,
quantity INT,
purchase_date DATE,
FOREIGN KEY(learner_id) REFERENCES learners(learner_id),
FOREIGN KEY(course_id) REFERENCES courses(course_id)
);
INSERT INTO learners VALUES
(1,'Rishan','India'),
(2,'Priya','India'),
(3,'Jas','USA'),
(4,'Subha','UK'),
(5,'Anshi','UAE');
INSERT INTO courses VALUES
(101,'Python','Programming',5000),
(102,'SQL','Database',4000),
(103,'Power BI','Analytics',6000),
(104,'Excel','Analytics',3000),
(105,'Java','Programming',7000);
INSERT INTO purchases VALUES
(1,1,101,2,'2026-03-01'),
(2,2,102,1,'2026-03-02'),
(3,3,103,2,'2026-03-03'),
(4,4,104,3,'2026-03-04'),
(5,5,105,1,'2026-03-05'),
(6,1,103,1,'2026-03-06'),
(7,2,104,2,'2026-03-07'),
(8,3,101,1,'2026-03-08');
SELECT * FROM learners;
SELECT * FROM courses;
SELECT * FROM purchases;
SELECT
l.full_name AS Learner_Name,
c.course_name AS Course_Name,
c.category,
p.quantity,
(p.quantity*c.unit_price) AS Total_Amount,
p.purchase_date
FROM purchases p
INNER JOIN learners l
ON p.learner_id=l.learner_id
INNER JOIN courses c
ON p.course_id=c.course_id
ORDER BY Total_Amount DESC;