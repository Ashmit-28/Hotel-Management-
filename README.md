🏨 Hotel Management System — SQL Database Project

📌 Project Overview

This project is a Hotel Management System Database developed using MySQL, designed to manage hotel operations such as guest details, room bookings, staff management, and additional services.

The system demonstrates the use of relational database design, primary and foreign keys, and advanced SQL queries to extract meaningful business insights from hotel data.

This project showcases my ability to design structured databases, manage relationships between tables, and perform real-world business analysis using SQL.

🎯 Objectives of the Project
Design a normalized relational database for hotel operations
Manage guest, room, booking, staff, and service data
Implement primary key and foreign key relationships
Perform data analysis using SQL queries
Generate insights such as revenue, occupancy rate, and guest behavior
🗂️ Database Structure

The database hotel_db1 consists of the following tables:

1️⃣ Guests Table

Stores information about hotel guests.

Columns:

guest_id — Unique ID for each guest (Primary Key)
name — Guest name
email — Guest email address
phone — Guest contact number
2️⃣ Rooms Table

Stores details about available hotel rooms.

Columns:

room_id — Unique room ID (Primary Key)
room_number — Room number
room_type — Type of room (Single, Double, Suite, Deluxe)
price_per_night — Room price per night
3️⃣ Bookings Table

Stores booking details made by guests.

Columns:

booking_id — Unique booking ID (Primary Key)
guest_id — References Guests table (Foreign Key)
room_id — References Rooms table (Foreign Key)
check_in_date — Check-in date
check_out_date — Check-out date
total_cost — Total booking cost
status — Booking status (Confirmed, Completed, Cancelled)
4️⃣ Staff Table

Stores details about hotel staff members.

Columns:

staff_id — Unique staff ID (Auto Increment Primary Key)
name — Staff member name
role — Staff role (Manager, Receptionist, etc.)
5️⃣ Services Table

Stores additional services used by guests.

Columns:

service_id — Unique service ID (Primary Key)
booking_id — References Bookings table (Foreign Key)
service_type — Type of service (Laundry, Breakfast, etc.)
service_date — Date of service
cost — Service cost
⚙️ Key Features Implemented
Created a fully structured relational database
Used primary and foreign keys to maintain relationships
Inserted sample data for testing
Developed analytical SQL queries
Implemented JOIN operations
Used aggregate functions (SUM, COUNT, AVG)
Applied GROUP BY, HAVING, and ORDER BY
Calculated occupancy rates and total revenue
📊 SQL Queries Implemented

This project includes multiple business-related SQL queries such as:

Calculate total revenue from bookings for the current month
Find the most booked room type
List all active bookings
Calculate the average length of stay per guest
Identify guests with more than 3 stays
Calculate revenue from additional services
Compute room occupancy rate for a given month
List bookings that included additional services
Find the highest spending guest
Identify rooms that were never booked

These queries simulate real-world hotel analytics tasks.

🛠️ Tools & Technologies Used
MySQL
SQL (Structured Query Language)
MySQL Workbench
Relational Database Design
Data Analysis using SQL
📈 Learning Outcomes

Through this project, I gained practical experience in:

Designing relational databases
Implementing foreign key relationships
Writing complex SQL queries
Performing business data analysis
Understanding real-world database structures
Working with aggregate functions and joins
🚀 How to Run This Project
Open MySQL Workbench
Create a new database
Copy and run the SQL script file
Execute the queries to view results
Modify data to test additional scenarios
💡 Project Use Case

This project can be used as a basic backend database model for:

Hotel reservation systems
Guest management platforms
Hospitality analytics
Booking and billing systems
