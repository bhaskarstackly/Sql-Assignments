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