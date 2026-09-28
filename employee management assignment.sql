use `employee management assignment`;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

INSERT INTO Employee VALUES
(101,'John','IT',60000,'Chennai','2022-01-15'),
(102,'David','HR',45000,'Bangalore','2021-03-10'),
(103,'Smith','IT',70000,'Chennai','2020-07-12'),
(104,'Mary','Finance',55000,'Mumbai','2023-01-20'),
(105,'James','HR',48000,'Delhi','2022-05-05'),
(106,'Linda','Finance',65000,'Mumbai','2021-08-18');

INSERT INTO Customers VALUES
(1,'Rahul','Chennai'),
(2,'Priya','Bangalore'),
(3,'Arun','Mumbai'),
(4,'Sneha','Delhi'),
(5,'Karthik','Chennai'),
(6,'Anjali','Hyderabad');

INSERT INTO Orders VALUES
(1001,1,5000,'2024-01-10'),
(1002,1,3000,'2024-02-15'),
(1003,2,7000,'2024-01-25'),
(1004,3,2500,'2024-03-05'),
(1005,4,9000,'2024-02-20'),
(1006,5,4500,'2024-03-10'),
(1007,2,3500,'2024-04-12'),
(1008,6,6000,'2024-04-20'),
(1009,5,2000,'2024-05-01'),
(1010,3,4000,'2024-05-15');

INSERT INTO Students VALUES
(1,'Rahul','Computer Science',85),
(2,'Priya','Computer Science',72),
(3,'Arun','Mechanical',68),
(4,'Sneha','Electronics',91),
(5,'Karthik','Mechanical',55),
(6,'Anjali','Electronics',78),
(7,'Vikram','Computer Science',95),
(8,'Meena','Civil',62),
(9,'Ravi','Civil',88),
(10,'Divya','Electronics',45);

-- 1. Total number of employees in each department
select department, count(*) as total_employes from employee
group by department;

-- 2.	Find the average salary of employees in each department. 
select department, avg(salary) as average_salary from employee
group by department;

-- 3.	Display departments having more than one employee. 
select department, count(*) as total_employes from employee
group by department
having total_employes > 1;

-- 4. highest salary in each department
select department, max(salary) as highest_salary from employee
group by department;

-- 5. lowest salary in each department
select department, min(salary) as lowest_salary from employee
group by department;

-- 6. departments whose average salary is greater than 50,000
select department, avg(salary) as average_salary from employee
group by department
having avg(salary) > 50000;

-- 7. total salary expenditure for each department
select department, sum(salary) as total_salary from employee
group by department;

-- 8. all employees sorted by salary descending
select * from employee
order by salary desc;

-- 9. employees sorted by department and then salary descending
select * from employee
order by department asc, salary desc;

-- 10. cities that have more than one employee
select city, count(*) as total_employes from employee
group by city
having count(*) > 1;

-- 11. total salary paid in each city
select city, sum(salary) as total_salary from employee
group by city;

-- 12. departments ordered by total salary expenditure
select department, sum(salary) as total_salary from employee
group by department
order by total_salary desc;

-- 13. number of employees in each department whose salary is greater than 50,000
select department, count(*) as total_employes from employee
where salary > 50000
group by department;

-- 14. difference between highest and lowest salary in each department
select department, max(salary) - min(salary) as salary_difference from employee
group by department;

-- 15. top 3 highest-paid employees
select * from employee
order by salary desc
limit 3;

-- 16. Find the total order amount for each customer
select c.customer_id, c.customer_name, sum(amount) as total_order_amount from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- 17. Find customers who have placed more than 3 orders
select c.customer_id, c.customer_name, count(o.order_id) as total_orders from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having count(o.order_id) > 3;

-- 18. Find the average order amount for each customer
select c.customer_id, c.customer_name, avg(o.amount) as average_order_amount from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- 19. Find the highest order amount placed by each customer
select c.customer_id, c.customer_name, max(o.amount) as highest_order_amount from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- 20. Display customers sorted by their total purchase amount
select c.customer_id, c.customer_name, sum(o.amount) as total_purchase_amount from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by total_purchase_amount desc;