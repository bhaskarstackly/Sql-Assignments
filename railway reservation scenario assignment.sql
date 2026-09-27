use `railway reservation scenario`;

CREATE TABLE trains (
    train_id INT PRIMARY KEY AUTO_INCREMENT,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    train_id INT,
    passenger_name VARCHAR(50),
    fare DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);

INSERT INTO trains (train_name, source, destination) VALUES
('Express1','Chennai','Madurai'),
('Express2','Coimbatore','Salem'),
('Express3','Madurai','Chennai');

INSERT INTO bookings (train_id, passenger_name, fare, status) VALUES
(1,'Janani',500,'Confirmed'),
(1,'Arun',500,'Waiting'),
(2,'Priya',300,'Confirmed'),
(3,'Karthik',450,'Cancelled'),
(2,'Meena',300,'Confirmed');

-- 41.	Retrieve all bookings with fare greater than 400. 

select * from bookings 
where fare > 400;

-- 42.	Find bookings where status is not 'Confirmed'.

select * from bookings 
where status <> 'confirmed';

-- 43.	Display trains starting from Chennai.

select * from trains
where source = 'Chennai'; 

-- 44.	Retrieve bookings with fare between 300 and 500.
select * from bookings 
where fare between 300 and 500; 

-- 45.	Find passengers whose names start with 'A'. 
select * from bookings 
where passenger_name like 'A%';

-- 46.	Retrieve train names along with passenger names. 

select  train_name,passenger_name from trains t
join bookings b on t.train_id= b.train_id;

-- 47.	Count number of bookings for each train. 
select train_name ,count(train_name)from trains t
join bookings b on t.train_id= b.train_id
group by train_name;

-- 48.	Display train names and total fare collected for each train.
select train_name ,sum(fare)from trains t
join bookings b on t.train_id= b.train_id
group by train_name;

-- 49.	Find bookings with fare equal to the highest fare. 
select * from bookings
where fare = ( 
select MAX(fare) from bookings);

-- 50.	Retrieve trains that have more than one booking. 
select train_name ,count(*) as bookings from trains t
join bookings b on t.train_id= b.train_id
group by train_name
having bookings > 1