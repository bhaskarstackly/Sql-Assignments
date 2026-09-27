use `banking scenario assignment`;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (name, city) VALUES
('Janani','Chennai'),
('Arun','Coimbatore'),
('Priya','Madurai'),
('Karthik','Salem');

INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1,'Savings',50000),
(1,'Current',20000),
(2,'Savings',30000),
(3,'Savings',15000),
(4,'Current',40000);

-- 1.Retrieve all accounts with balance greater than 20,000.

select * from accounts where balance > 20000;

-- 2.Find customers who live in Chennai.
select * from customers where city ='chennai';

-- 3.Display accounts with balance between 20,000 and 50,000.

select * from accounts where balance between 20000 and 50000;

-- 4.	Find customers whose names start with 'J'. 

select name from customers where name like 'j%'

-- 5.	Retrieve accounts of type 'Savings' or 'Current'. 

select * from accounts where account_type in('savings','current')

-- 6.	Display accounts that are not 'Savings'. 

select * from accounts where account_type <> 'savings'

-- 7.	Find customers whose names contain the letter 'a'. 

select * from customers where name like '%a%';

-- 8.	Retrieve accounts with balance less than or equal to 30,000.

select * from accounts where balance <= 30000;

-- 9.	Find customers who are not from Madurai.

select * from customers where city <> 'madurai';

-- 10.	Display accounts where balance is not between 10,000 and 40,000. 

select * from accounts where balance not between 10000 and 40000;

select * from accounts where balance < 10000 or balance > 40000;

-- 11.	Retrieve customers whose names end with 'i'.

select * from customers where name like '%i';

-- 12.	Find accounts with balance equal to 50,000.

select * from accounts where balance = 50000;

-- 13.	Display customers whose city is either Chennai or Salem.

select * from customers where city in ('chennai','salem'); 

-- 14.	Find accounts with balance greater than 10,000 and less than 40,000.

select * from accounts where balance > 10000 and balance < 40000;

-- 15.	Retrieve accounts where account type is not in ('Current').

select * from accounts where account_type <> 'current';

-- 16.	Display all accounts sorted by balance in descending order.

select * from accounts 
order by balance desc;

-- 17.	List customers sorted alphabetically by name.

select * from customers 
order by name asc;

select * from customers 
order by name;

-- 18.	Display accounts sorted by account type and then by balance (descending). 
 
select * from accounts
order by account_type asc, balance desc;

-- 19.	Find the total balance of all accounts.

select sum(balance) as total_balance from accounts;

-- 21.	Find the maximum account balance. 
 
select max(balance) as max_balance from accounts;

-- 20.	Calculate the average balance of accounts.

select avg(balance) as avg_balance from accounts; 

-- 22.	Find the minimum account balance.

select min(balance) as min_balance from accounts;

-- 23.	Count the total number of customers.

select count(*) as total_customers from customers;

-- 24.	Find total balance grouped by account type.

select account_type, sum(balance) as total_balance from accounts
group by account_type; 

-- 25.	Find average balance for each account type. 
select account_type, avg(balance) as avg_balance from accounts
group by account_type;
   
-- 26.	Display account types having average balance greater than 20,000. 

select account_type, avg(balance) as avg_balance from accounts
group by account_type
having avg_balance > 20000;

-- 27.	Count number of accounts for each customer. 

select customer_id , count(customer_id) as totol_accounts from accounts
group by customer_id;

-- 28.	Display customers having more than one account. 

select customer_id , count(customer_id) as totol_accounts from accounts
group by customer_id
having totol_accounts >1;

-- 29.	Retrieve customer names along with their account balances. 

select name,balance from accounts a
join customers c on a.customer_id= c.customer_id;

-- 30.	Display all customers and their accounts (including customers without accounts). 

select name,account_type from customers c
left join accounts a on c.customer_id= a.customer_id;

-- 31.	Display all accounts and corresponding customer details. 
select * from customers c
right join accounts a on c.customer_id= a.customer_id;

-- 32.	Retrieve customer names and account types where balance is greater than 20,000.
select name,account_type,balance from customers c
join accounts a on c.customer_id= a.customer_id
where balance > 20000;

-- 33.	List customers with their total balance using JOIN. 
select c.customer_id,name,sum(balance) as total_balance from customers c
join  accounts a on c.customer_id= a.customer_id
group by a.customer_id,name;

-- 34.	Display customer names and balances sorted by balance.
select name,balance  from customers c
join  accounts a on c.customer_id= a.customer_id
order by balance desc;

-- 35.	Count number of accounts for each city using JOIN. 
select c.city,count(c.customer_id)as no_of_accounts from customers c
join  accounts a on c.customer_id= a.customer_id
group by c.city;

-- 36.	Find accounts with balance greater than average balance. 

select * from accounts where balance >(
select avg(balance) from accounts );

-- 37.	Retrieve customers who have accounts.
 
select * from customers where customer_id in (
select customer_id from accounts );

-- 38.	Find customers who do not have any accounts. 
select * from customers where customer_id not in (
select customer_id from accounts );

-- 40.	Find customers whose total balance is greater than 40,000.
select * from customers where  customer_id in (
select customer_id from accounts 
group by customer_id
having sum(balance) > 40000);
 