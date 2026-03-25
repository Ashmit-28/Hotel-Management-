create database hotel_db1;
use hotel_db1 ;
create table guests (
guest_id int primary key,
name varchar (30) not null,
email varchar(30)not null,
phone bigint not null );
select*from guests ;
INSERT INTO guests (guest_id, name, email, phone) VALUES
(101, 'Ashmit Dhongade', 'ashmit@gmail.com', 9876543210),
(102, 'Deepankshi Themse', 'deepankshi@gmail.com', 9876501234),
(103, 'Prajwal Themse', 'prajwal@gmail.com', 9867543210),
(104, 'Sakshi Kulkarni', 'sakshi@gmail.com', 9823456789),
(105, 'Vikram Singh', 'vikram@gmail.com', 9812345678) ;

create table rooms (
room_id int  primary key,
room_number varchar(20)not null,
room_type varchar(20) not null,
price_per_night decimal(10,2) not null );
select*from rooms ;
INSERT INTO rooms (room_id, room_number, room_type, price_per_night) VALUES
(201, '111', 'Single', 1500.00),
(202, '112', 'Double', 2500.00),
(203, '113', 'Suite', 5000.00),
(204, '114', 'Deluxe', 3500.00),
(205, '115', 'Single', 1500.00);

    
    
create table bookings (
booking_id int  primary key,
guest_id int,
room_id int,
check_in_date date not null,
check_out_date date not null,
total_cost decimal(10,2) not null,
status VARCHAR(20)not null,
foreign key (guest_id) references guests(guest_id),
foreign key (room_id) references rooms(room_id) );
select*from bookings ;
INSERT INTO bookings (booking_id, guest_id, room_id, check_in_date, check_out_date, total_cost, status) VALUES
(301, 101, 201, '2025-01-10', '2025-01-12', 3000.00, 'Confirmed'),
(302, 102, 202, '2025-02-05', '2025-02-07', 10000.00, 'Completed'),
(303, 103, 203, '2025-03-01', '2025-03-03', 5000.00, 'Confirmed'),
(304, 104, 204, '2025-03-15', '2025-03-18', 10500.00, 'Cancelled'),
(305, 105, 205, '2025-04-01', '2025-04-02', 1500.00, 'Completed');



create table staff (
staff_id int auto_increment primary key,
name varchar(20),
role varchar(20) );
select*from staff ;
INSERT INTO staff (name, role) VALUES
('Arjun Rampal', 'Manager'),
('Sovrav Joshi', 'Receptionist'),
('Sanjay Duth', 'Housekeeping'),
('Meena Gupta', 'Chef'),
('Rahul Sharma', 'Security');




create table services (
service_id int  primary key,
booking_id int,
service_type varchar(50) not null,
service_date date not null,
cost decimal(10,2),
foreign key (booking_id) references bookings(booking_id) );
select*from services ;
INSERT INTO services (service_id, booking_id, service_type, service_date, cost) VALUES
(401, 301, 'Room Cleaning', '2025-01-11', 300.00),
(402, 302, 'Breakfast', '2025-02-06', 500.00),
(403, 303, 'Airport Pickup', '2025-03-01', 800.00),
(404, 304, 'Dinner Buffet', '2025-03-16', 1200.00),
(405, 305, 'Laundry', '2025-04-01', 200.00);



-- Queries 

-- 1.	Calculate the total revenue from bookings for the current month .

select sum(total_cost) as total_revenue_current_month
from bookings
where month(check_in_date) = month(curdate())
and year(check_in_date) = year(curdate());


-- 2.	Find the most booked room type.

select rooms.room_type, count(*) as total_bookings
from bookings
join rooms on bookings.room_id = rooms.room_id
group by rooms.room_type
order by total_bookings desc
limit 1;

-- 3.	List all active bookings (check_in <= today AND check_out >= today).

select * from bookings
where check_in_date <= curdate()
and check_out_date >= curdate();

-- 4.	Calculate the average length of stay per guest.

select guests.name, 
avg(datediff(bookings.check_out_date, bookings.check_in_date)) as avg_stay_days
from bookings
join guests on bookings.guest_id = guests.guest_id
group by guests.guest_id, guests.name;

-- 5.	Identify guests who have stayed at the hotel more than 3 times.

select guests.name, count(*) as total_stays
from bookings
join guests on bookings.guest_id = guests.guest_id
group by guests.guest_id, guests.name
having total_stays > 3;

-- 6.	Find the total revenue from additional services (like Spa, Laundry).

select sum(cost) as total_service_revenue
from services;

-- 7.	Calculate the occupancy rate for each room for a given month.
select 
rooms.room_id,
rooms.room_number,
(sum(datediff(least(bookings.check_out_date, last_day('2025-03-01')),greatest(bookings.check_in_date, '2025-03-01'))) 
/ day(last_day('2025-03-01'))) * 100 as occupancy_rate_percent
from rooms
left join bookings 
on rooms.room_id = bookings.room_id
and bookings.check_in_date <= last_day('2025-03-01')
and bookings.check_out_date >= '2025-03-01'
group by rooms.room_id, rooms.room_number;

-- 8.	List all bookings that included additional services.

select distinct bookings.*
from bookings
join services on bookings.booking_id = services.booking_id;

-- 9.	Find the guest with the highest total spending (room + services).

select guests.name,
sum(bookings.total_cost) + ifnull(sum(services.cost), 0) as total_spending
from guests
join bookings on guests.guest_id = bookings.guest_id
left join services on bookings.booking_id = services.booking_id
group by guests.guest_id, guests.name
order by total_spending desc
limit 1;

-- 10.	Identify rooms that have never been booked.

select rooms.*
from rooms
left join bookings on rooms.room_id = bookings.room_id
where bookings.room_id is null;

















  
  






















    
    
    