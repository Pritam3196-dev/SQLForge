-- Create database

create database Airline_reservation_system;

-- Use Airline_reservation_system

Use Airline_reservation_system;


-- Create Tables


Create table Airport(

          Airport_code varchar(20) primary key ,
		  Airport_location varchar(255) Not Null);


Create table routess(

         route_id int primary key ,
		 Source_airport_code varchar(20) Not Null ,
		 Destination_airport_code varchar(20) Not Null,
		 fare float  Not Null, 
		 foreign key (Source_airport_code) references Airport(Airport_code) ,
		 foreign key (Destination_airport_code) references Airport(Airport_code));


-- Exec sp_rename 'route' , 'routess';


Create table Flights(

        Flight_number int primary key ,
		Carrier_Name varchar(30) Not Null ,
		Departure varchar(30) Not Null ,
		arrival varchar(30) Not Null ,
		route_id int Not Null ,
		Seat_capacity int Not null ,
		Seat_booked int Not null,
		foreign key (route_id) references routess(route_id));


Create table ticket(


       Ticket_Number int primary key ,
	   Carrier_Name varchar(30) Not Null ,
	   Flight_Number int ,
	   route_id int ,
	   Total_Amount float ,
	   foreign key (Flight_Number) references Flights(Flight_number) ,
	   foreign key (route_id) references routess(route_id));


Create table Passenger(

       Serial_number int primary key ,
	   ticket_number int  ,
	   Passenger_Name varchar(40) Not Null ,
	   Passenger_dob Date Not Null ,
	   fare float Not Null ,
	   foreign key (ticket_number) references ticket(Ticket_Number));

-- Alter table Passenger Drop constraint UQ__Passenge__413613D2BA019962;



Create table Payment(

       payment_id int IDENTITY(1,1) primary key ,
	   Amount float Not null ,
	   payment_mode varchar(30) Not null ,
	   Status varchar(30) Not Null);



-- Insert data into Airport data;

Insert into Airport(Airport_Code , Airport_location)
            values
('DEL', 'New Delhi, India'),
('BOM', 'Mumbai, India'),
('BLR', 'Bangalore, India'),
('DXB', 'Dubai, UAE'),
('LHR', 'London, UK'),
('JFK', 'New York, USA'),
('HND', 'Tokyo, Japan'),
('CDG', 'Paris, France'),
('SIN', 'Singapore'),
('SYD', 'Sydney, Australia');



-- Insert data into routess

select * from routess;


Insert into routess(route_id , Source_airport_code , Destination_airport_code , fare)
            values
(1, 'DEL', 'BOM', 4000),
(2, 'BOM', 'BLR', 3500),
(3, 'DEL', 'BLR', 4200),
(4, 'DEL', 'DXB', 12000),
(5, 'DXB', 'LHR', 16000),
(6, 'LHR', 'JFK', 30000),
(7, 'JFK', 'HND', 34000),
(8, 'HND', 'SYD', 37000),
(9, 'CDG', 'DEL', 22000),
(10, 'SIN', 'SYD', 18000);


-- Insert data into flight


select * from flights;

insert into flights(flight_number , Carrier_Name , Departure , arrival , route_id , Seat_capacity , Seat_booked)
            values
(101, 'Air India', '2025-06-01 06:00:00', '2025-06-01 08:00:00', 1, 180, 150),
(102, 'IndiGo', '2025-06-02 09:30:00', '2025-06-02 11:00:00', 2, 160, 140),
(103, 'SpiceJet', '2025-06-03 12:00:00', '2025-06-03 14:15:00', 3, 170, 120),
(104, 'Emirates', '2025-06-04 16:00:00', '2025-06-04 19:30:00', 4, 200, 180),
(105, 'British Airways', '2025-06-05 08:45:00', '2025-06-05 13:00:00', 5, 250, 200),
(106, 'Delta', '2025-06-06 10:00:00', '2025-06-06 18:30:00', 6, 260, 240),
(107, 'ANA', '2025-06-07 11:00:00', '2025-06-07 22:00:00', 7, 240, 230),
(108, 'Qantas', '2025-06-08 14:00:00', '2025-06-08 23:00:00', 8, 220, 200),
(109, 'Air France', '2025-06-09 07:30:00', '2025-06-09 17:00:00', 9, 180, 160),
(110, 'Singapore Airlines', '2025-06-10 05:00:00', '2025-06-10 13:00:00', 10, 200, 180);



-- Insert data into Ticket;

Insert into Ticket(Ticket_Number , Carrier_Name , Flight_Number ,route_id , Total_Amount)
       values
(1001, 'Air India', 101, 1, 4000),
(1002, 'IndiGo', 102, 2, 3500),
(1003, 'SpiceJet', 103, 3, 4200),
(1004, 'Emirates', 104, 4, 12000),
(1005, 'British Airways', 105, 5, 16000),
(1006, 'Delta', 106, 6, 30000),
(1007, 'ANA', 107, 7, 34000),
(1008, 'Qantas', 108, 8, 37000),
(1009, 'Air France', 109, 9, 22000),
(1010, 'Singapore Airlines', 110, 10, 18000),
(1011, 'Air India', 101, 1, 8000),
(1012, 'IndiGo', 102, 2, 7000),
(1013, 'SpiceJet', 103, 3, 8400),
(1014, 'Emirates', 104, 4, 24000),
(1015, 'British Airways', 105, 5, 32000);


-- Insert data into passenger;


select * from passenger;


Insert into passenger(serial_number , ticket_number , Passenger_Name , Passenger_dob , fare)
       values

(1, 1001, 'John Doe', '1985-06-15', 4000),
(2, 1002, 'Alice Smith', '1988-02-20', 3500),
(3, 1003, 'Carlos Vega', '1978-11-11', 4200),
(4, 1004, 'Nina Vega', '1982-09-23', 12000),
(5, 1005, 'Emily Johnson', '1990-10-30', 16000),
(6, 1006, 'Michael Brown', '1975-06-12', 30000),
(7, 1007, 'Priya Sharma', '1995-01-16', 34000),
(8, 1008, 'Rahul Sharma', '1989-03-03', 37000),
(9, 1009, 'Olivia Wilson', '1993-05-25', 22000),
(10, 1010, 'David Lee', '1991-07-07', 18000),
(11, 1011, 'Sophia Kim', '1987-08-18', 4000),
(12, 1011, 'Ethan Thomas', '1984-12-12', 4000),
(13, 1012, 'Chloe Martinez', '1992-06-06', 3500),
(14, 1012, 'Noah Davis', '1990-04-01', 3500),
(15, 1013, 'Ava Anderson', '1986-01-01', 4200),
(16, 1013, 'Liam Anderson', '1988-02-14', 4200),
(17, 1014, 'James Jackson', '1980-11-09', 12000),
(18, 1014, 'Grace White', '1983-03-19', 12000),
(19, 1015, 'Benjamin Harris', '1976-04-30', 16000),
(20, 1015, 'Lily Martin', '1982-12-21', 16000);


-- Insert into payment;

select * from payment;

Insert into payment(Amount , payment_mode , Status) 
        values
(4000, 'Credit Card', 'Completed'),
(3500, 'UPI', 'Completed'),
(4200, 'Net Banking', 'Completed'),
(12000, 'Debit Card', 'Pending'),
(16000, 'Credit Card', 'Completed'),
(30000, 'Net Banking', 'Completed'),
(34000, 'Credit Card', 'Completed'),
(37000, 'UPI', 'Completed'),
(22000, 'Debit Card', 'Pending'),
(18000, 'Credit Card', 'Completed'),
(8000, 'UPI', 'Completed'),
(7000, 'Debit Card', 'Pending'),
(8400, 'Credit Card', 'Completed'),
(24000, 'Net Banking', 'Completed'),
(32000, 'Credit Card', 'Completed');



-- Check all tablename onece


select distinct(table_name) from information_schema.columns;


-- Data Analysis

-- 1.List all passengers who paid more than 10,000 for their ticket.


select * from passenger where fare > 10000;


-- 2.Find all flights operated by 'Air India'.

select * from flights where Carrier_Name = 'Air India';

-- 3.Show all passengers born before 1990.

select * from passenger where year(Passenger_dob) < 1990;

-- 4.Get all payments made using ‘Credit Card’.

select * from payment where payment_mode = 'Credit Card';

-- 5.List all airports located in India.

select * from Airport where Airport_location like '%India';

-- 6.List passenger names along with their flight carrier and ticket amount.

select Passenger_name , 
       carrier_Name as flight_carrier , 
	   fare as Ticket_Amount 
	   from passenger as p 
	   inner join ticket as t 
	   on p.ticket_number = t.ticket_number;



-- 7.Show all flights along with source and destination airport names.

select r.route_id , 
       flight_number , 
	   Source_airport_code , 
	   a.Airport_location as source_Airport_location , 
       Destination_airport_code , 
       a1.Airport_location as Destination_Airport_location ,
       Departure , 
	   Arrival , 
	   fare ,
       Seat_capacity , 
	   Seat_booked 
	   from routess as r inner join flights as f on r.route_id = f.route_id
       inner join Airport as a on r.source_airport_code = a.airport_code
       inner join Airport as a1 on r.destination_airport_code = a1.airport_code;


-- 8.Find total number of passengers on each flight.

select f.flight_number , 
       count(serial_number) as Total_no_customers 
       from passenger as p 
	   inner join ticket as t 
	   on p.ticket_number = t.Ticket_Number 
       inner join flights as f 
	   on f.flight_number = t.flight_number 
	   group by f.flight_number;


-- 9.Get all ticket details with passenger names (one-to-one matching).


select t.Ticket_Number ,
       Passenger_Name ,
	   Serial_Number as Customer_id,
	   carrier_Name ,
	   Flight_Number , 
	   t.Route_id ,
	   Source_airport_code as Flight_From ,
	   Destination_airport_code as  Flight_To ,
	   p.fare
	   from ticket as t 
	   inner join passenger as p 
	   on t.Ticket_Number = p.ticket_number
	   inner join routess as r on
	   t.route_id = r.route_id;


-- 10.List all payments along with passenger names and ticket details.

select serial_number as Customer_id , 
       passenger_name ,
       ps.ticket_number , 
	   ps.fare , 
	   carrier_Name ,
	   r.route_id ,
	   source_airport_code , 
	   destination_airport_code ,
	   payment_id , 
	   p.Amount , 
	   payment_mode , 
	   Status as payment_status
	   from payment as p 
	   inner join passenger as ps 
	   on p.Amount = ps.fare
	   inner join ticket as t 
	   on ps.ticket_number = t.ticket_number
	   inner join routess as r 
	   on t.route_id = r.route_id;


-- 11.What is the average fare paid per route?

select route_id, 
       source_airport_code , 
	   Destination_airport_code , 
	   avg(fare) as avg_fare_per_route 
	   from routess 
       group by route_id , source_airport_code , Destination_airport_code;

-- or 

select route_id , 
       source_airport_code ,
	   Destination_airport_code ,
       cast(cast(sum(fare) AS decimal(10,2)) / count(distinct(route_id)) AS decimal(10,2)) as avg_fare
	   from routess group by route_id ,
	   source_airport_code ,
	   Destination_airport_code;


-- 12.Find the total revenue generated per carrier.

select carrier_Name , 
       sum(Total_Amount) as Total_revenue 
	   from ticket 
	   group by carrier_Name;


-- 13.Count the number of flights between each airport pair.

select 
    r.route_id , 
    Source_airport_code as flight_from , 
	Destination_airport_code  as flight_to ,
    count(flight_number) as no_of_flights_between_each_airport_pair
from   
    routess as r 
inner join 
    flights as f on r.route_id = f.route_id
group by 
    r.route_id , source_airport_code , Destination_airport_code;


-- 14.Get the most frequently used payment mode.

select 
    TOP 1 payment_mode  ,
    count(payment_mode) as count_payment_mode
from 
    payment
group by 
    payment_mode
order by count_payment_mode desc;


-- or 

with most_frequently_payment_mode AS(

select 
    payment_mode , 
    count(payment_mode) as no_of_payment_modes_used ,
	Dense_Rank() over(order by count(payment_mode) desc) as Rank_payment_mode
from 
    payment group by payment_mode

)

select * from most_frequently_payment_mode where Rank_payment_mode <= 1;


-- 15.Find the route with the highest number of bookings.

With route_with_highest_bookings AS(

select r.route_id , source_airport_code as Flight_from , Destination_airport_code as Flight_to ,
count(t.ticket_number) as No_of_tickets_booked , 
Dense_rank() over(order by count(t.ticket_number) desc) as Rank_route_id
from routess as r inner join ticket as t on r.route_id = t.route_id
inner join passenger as p on t.ticket_number = p.ticket_number group by 
r.route_id , source_airport_code , Destination_airport_code

)

select * from route_with_highest_bookings where Rank_route_id <= 1;


-- 16.List all flights scheduled to depart in June 2025.

select 
    flight_number , 
    f.route_id , 
	source_airport_code as flight_from , 
	Destination_airport_code as flight_to ,
    Departure 
from 
    flights as f 
inner join 
    routess as r on f.route_id = r.route_id
where 
    month(departure) = 6 and year(departure) = 2025;


-- 17.Find flights with a duration of more than 5 hours.


select 
       flight_number , 
       f.route_id , 
	   source_airport_code as flight_from , 
	   a1.Airport_location as flight_from_airport ,
       Destination_airport_code as flight_to ,
       a2.Airport_location as flight_to_airport,
       Carrier_Name , concat(datediff(hour , Departure , arrival) , ' hr') as Flight_duration 
from   flights as f 
inner join 
       routess as r on f.route_id = r.route_id
inner join 
       airport as a1 on r.source_airport_code = a1.airport_code 
inner join 
       airport as  a2 on Destination_airport_code = a2.airport_code
where 
      datediff(hour , Departure , arrival) > 5;


-- 18.Show passenger birthdays in the current month.

select 
       *      
from  passenger 
where Datename(month  , Passenger_dob) = Datename(month , getdate());


-- 19.List payments made in the last 30 days.

-- Here we don't have payment_date column in out tables so we just for practice purpose we create this query


select * from payment where payment_date between Dateadd(Day , -30 , getdate()) and Dateadd(day ,0 ,  getdate());

-- or 


select * from payment where payment_date >= Dateadd(day , -30 , getdate());


-- 20.Find all flights departing between 6 AM and 12 PM.


select * from flights where Datepart(hour , departure)  between 6  and  12;

-- or

select * from flights where datepart(hour ,departure) >= 6 and Datename(hour , departure) <= 12;


-- 21.Which route has the highest average fare?


With Highest_avg_fare AS (

select f.route_id , source_airport_code as Flight_from , Destination_airport_code as Flight_to , carrier_Name ,
avg(fare) as avg_fare_of_route ,
Dense_Rank() over(order by avg(fare) desc) as Rank_route_id
from routess as r inner join flights as f on r.route_id = f.route_id
group by f.route_id , source_airport_code , Destination_airport_code , carrier_Name

)

select * from Highest_avg_fare where Rank_route_id <= 1;



-- or 


select Top 1 f.route_id , 
       source_airport_code as Flight_from , 
	   Destination_airport_code as Flight_to , carrier_Name ,
       avg(fare) as avg_fare_of_route 
from   
       routess as r 
inner join 
       flights as f on r.route_id = f.route_id
group by 
       f.route_id , source_airport_code , Destination_airport_code , carrier_Name
order by 
       avg_fare_of_route desc;


-- 22.Who are the top 5 passengers by total fare paid?

select 
     Top 5 serial_number , 
     passenger_Name , 
	 sum(Fare) as Total_fare_paid 
from 
     passenger 
group by 
     serial_number , passenger_Name
order by 
     Total_fare_paid desc;


-- or 

With Top_five_paid_passengers AS(

select 
     serial_number ,
     passenger_Name ,
     sum(Fare) as Total_fare ,
     Dense_Rank() over(order by sum(fare) desc) as Rank_passenger
from 
     passenger
group by 
     serial_number , passenger_Name

)

select * from Top_five_paid_passengers where Rank_passenger <= 5;


-- 23.What is the seat utilization percentage for each flight?

select 
     flight_number ,  
     r.source_airport_code as flight_from , 
	 a1.Airport_location as Flight_from_airport,
	 r.destination_airport_code as flight_to ,
	 a2.airport_location as Flight_to_airport,
     carrier_Name , 
	 seat_capacity , 
	 seat_booked , 
	 concat(cast(cast(Seat_booked AS decimal(10,2)) * 100 / Seat_capacity AS decimal(10,2)) , ' %')
AS   seat_utilization_percentage_each_flight
from 
     flights as f inner join routess as r on f.route_id = r.route_id
	 inner join airport as a1 on r.source_airport_code = a1.Airport_code
	 inner join airport as a2 on r.destination_airport_code = a2.Airport_code;


-- 24.Which carrier has the most flights?

select 
     Top 10 Carrier_Name ,
     count(flight_number) as No_of_flights 
from flights
group by 
     Carrier_Name
order by 
     count(flight_number) desc;


-- or 

With most_flights_carrier AS(

select 
     carrier_Name ,
     count(flight_number) as No_of_flights ,
	 Dense_Rank() over(order by count(flight_number) desc) as Rank_carrier_Name
from 
   flights
group by 
   carrier_Name

)


select * from most_flights_carrier where Rank_carrier_Name <= 1;


-- 25.Which flight had the most passengers?

select 
    Top 5 f.flight_number , 
	r.source_airport_code as flight_from , 
	a1.airport_location as flight_from_airport , 
    r.destination_airport_code as flight_to ,
    a2.airport_location as flight_to_airport , count(serial_number) as count_passenger_id , count(Passenger_Name) as count_passengers
from 
    flights as f 
inner join 
    ticket as t on f.flight_number = t.flight_number
inner join 
    routess as r on t.route_id = r.route_id 
inner join 
    passenger as p on t.ticket_number = p.ticket_number
inner join 
    airport as a1 on r.source_airport_code = a1.Airport_code
inner join 
    airport as a2 on r.destination_airport_code = a2.Airport_code
group by 
    f.flight_number , r.source_airport_code , a1.airport_location ,
    r.destination_airport_code , a2.airport_location
order by 
    count_passenger_id desc;


-- or 



With Most_passenger_flight AS(

select 
     f.flight_number ,  
	 r.source_airport_code as flight_from , 
	 a1.airport_location as flight_from_airport , 
     r.destination_airport_code as flight_to ,
     a2.airport_location as flight_to_airport , 
	 count(serial_number) as count_passenger_id , 
	 count(Passenger_Name) as count_passengers,
     Dense_Rank() over(order by count(serial_number) desc) as Rank_flight 
from 
     flights as f inner join ticket as t 
on   
     f.flight_number = t.flight_number
inner join 
     routess as r on t.route_id = r.route_id 
inner join 
     passenger as p on t.ticket_number = p.ticket_number
inner join 
     airport as a1 on r.source_airport_code = a1.Airport_code
inner join 
     airport as a2 on r.destination_airport_code = a2.Airport_code
group by 
     f.flight_number , r.source_airport_code , a1.airport_location ,
     r.destination_airport_code , a2.airport_location

)


select * from most_passenger_flight where Rank_flight <= 1;



-- 26.Rank passengers by fare within each flight.


select 
     f.flight_number , 
     r.Source_airport_code as Take_off_from, 
	 a1.Airport_location as Take_off_Airport, 
	 r.Destination_airport_code as Landing_to, 
     a2.Airport_location as Landing_airport , 
	 serial_number as passenger_id , 
	 passenger_name , p.fare,
     Dense_Rank() over(partition by f.flight_number order by p.fare desc) as Rank_passenger
from 
     flights as f 
inner join 
      ticket as t on f.flight_number = t.flight_number
inner join 
      passenger as p on t.ticket_number = p.ticket_number
inner join 
      routess as r on t.route_id = r.route_id
inner join 
      Airport as a1 on r.source_airport_code = a1.Airport_code
inner join 
      Airport as a2 on r.destination_airport_code = a2.Airport_code;


-- 27.Find duplicate payments, if any (same amount, mode, status).

With duplicate_rows AS(

select 
      serial_number , 
      fare , 
	  payment_mode , 
	  status  , 
      Row_number() over(partition by fare order by fare asc) as Row_number_passenger
from   
      passenger as ps inner join payment as p
on     
      p.Amount = ps.fare 

)

select * from duplicate_rows where Row_number_passenger > 1;


-- 28.Show flights that are overbooked .

select * from flights where Seat_booked > Seat_Capacity;

-- 29.Find passengers who traveled together (same ticket number).

select * from passenger where ticket_number in (

select ticket_number from passenger group by ticket_number having count(ticket_number) > 1

);


-- 30.Detect payment failures or pending statuses by user.

select serial_number , 
       passenger_name , 
	   Amount , 
	   payment_mode , 
	   status as payment_status
	   from passenger as ps 
inner join 
       payment as p
on     
       ps.fare = p.Amount where status != 'Completed';


-- or 


select * from passenger where fare in (

select Amount from payment where status != 'Completed'

);


-- 31.What is the total revenue generated per airline carrier?

select 
   f.Carrier_Name ,  
   sum(Total_Amount) as Total_revenue_per_airline_carrier 
from 
   flights as f inner join ticket 
AS 
   t 
ON 
   f.route_id = t.route_id
group by 
   f.carrier_name 
order by 
   Total_revenue_per_airline_carrier desc;


-- 32.What are the top 5 most booked routes?

With Top_five_most_booked_routes AS(

select r.route_id , 
       source_airport_code as frlight_from, 
	   a1.airport_location as Take_Airport , 
	   Destination_airport_code as flight_to ,
       a2.airport_location as Landing_Airport ,
       count(ticket_number) as No_of_tickets_booked ,
       Dense_Rank() over(order by count(ticket_number) desc) as Rank_route_id
from 
       routess as r inner join ticket AS t
ON
   r.route_id = t.route_id 
inner join 
   Airport AS a1 
ON 
   r.source_airport_code = a1.airport_code
inner join
   Airport as a2 
ON 
   r.destination_airport_code = a2.airport_code
group by 
   r.route_id , source_airport_code , Destination_airport_code , a1.airport_location , a2.airport_location

)

select * from Top_five_most_booked_routes where Rank_route_id <=5;


-- 33.What is the seat utilization per flight?


select 
     flight_number , 
     source_airport_code as flight_from , 
	 a1.airport_location as Take_off_Airport,
	 destination_airport_code as flight_to,
	 a2.airport_location as Landing_Airport,
	 Seat_capacity , 
	 Seat_Booked ,
	 concat(cast(cast(seat_booked AS decimal(10,2)) * 100 / cast(seat_capacity AS decimal(10,2)) AS decimal(10,2)), ' %')
AS   seat_utilization_ratio
from 
     flights as f INNER JOIN routess AS r 
ON 
    f.route_id = r.route_id
INNER JOIN
    Airport as a1 on r.source_airport_code = a1.airport_code
INNER JOIN 
    Airport as a2 on r.destination_airport_code = a2.airport_code;
    


-- 34.Which airports have the most traffic (departures + arrivals)?

select a1.Airport_location , 
       count(departure) as Total_no_of_flights_departure , 
	   count(arrival) as Total_no_of_flights_arrival
from 
   flights as f 
inner join 
   routess as r on f.route_id = r.route_id
inner join 
   airport as  a1 on r.source_airport_code = a1.airport_code
group by 
   a1.Airport_location order by Total_no_of_flights_departure desc;


-- or 



select a1.Airport_location , 
       count(departure) as Total_no_of_flights_departure , 
	   count(arrival) as Total_no_of_flights_arrival ,
	   Dense_Rank() over(order by count(departure) desc , count(arrival) desc) as Rank_on_airport
from 
   flights as f 
inner join 
   routess as r on f.route_id = r.route_id
inner join 
   airport as  a1 on r.source_airport_code = a1.airport_code
group by 
   a1.Airport_location ;


-- 35.What is the average fare per route?

select 
    route_id, 
    source_airport_code as flight_from , 
	a1.airport_location as Take_off_airport, 
	destination_airport_code as flight_to ,
    a2.airport_location as Landing_airport ,
    avg(fare) as avg_fare 
from 
    routess as r 
inner join 
     airport as a1 
on 
     r.source_airport_code = a1.airport_code
inner join 
     airport as a2 
on 
     r.destination_airport_code = a2.airport_code
group by 
     route_id , source_airport_code , a1.airport_location , destination_airport_code ,a2.airport_location
	 order by avg_fare desc;


-- 36.What are the most common payment modes?

select 
    Top 1 payment_mode , 
    count(payment_mode) as No_of_times_used
from 
   payment 
group by 
   payment_mode 
order by 
    No_of_times_used desc;

-- or 

With Most_common_payment_mode AS(

select 
     payment_mode , 
     count(payment_mode) as No_of_times_used,
     Dense_Rank() over(order by count(payment_mode) desc) as Rank_payment_mode
from 
     payment 
group by 
     payment_mode 
)

select * from Most_common_payment_mode where Rank_payment_mode <= 1;


-- 37.What is the booking trend over time (monthly or weekly)?


select Year(departure) as Year , month(departure) as month ,count(Ticket_number) as No_of_tickets_booked
from ticket as t inner join flights as f on t.route_id = f.route_id group by year(departure) , month(departure);

-- or 


select Year(departure) as Year , month(departure) as month , Day(departure) as date,
count(Ticket_number) as No_of_tickets_booked
from ticket as t inner join flights as f on t.route_id = f.route_id group by year(departure) , month(departure),
Day(departure);

-- or 


select Year(departure) as Year , month(departure) as month ,
Datepart(Day , departure) as Date,
count(Ticket_number) as No_of_tickets_booked
from ticket as t inner join flights as f on t.route_id = f.route_id group by year(departure) , month(departure) ,
Datepart(day , departure);


-- or 


select Year(departure) as Year , month(departure) as month,
Datename(weekday , departure) as Days
,count(Ticket_number) as No_of_tickets_booked
from ticket as t inner join flights as f on t.route_id = f.route_id group by year(departure) , month(departure),
Datename(weekday , departure);


--  36.What is the age of passengers?


select * , Datediff(year , Passenger_dob ,  getdate()) as Age from passenger;

-- 38.What is the ratio of completed vs pending payments?

with ratio_of_completed_and_pending_payment AS(

select 
      count(
	       case
		       WHEN status = 'Completed' THEN 1
			END) as count_payment_completed ,
	  count(
	       case
		       WHEN status = 'Pending' THEN 1
			END) as count_payment_pending
	  from payment

)

select (concat(cast(cast(count_payment_pending AS decimal(10,2)) * 100 / count_payment_completed AS decimal(10,2)) , '%')) AS ratio_pending_vs_complete
from 
ratio_of_completed_and_pending_payment;