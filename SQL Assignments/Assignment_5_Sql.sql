-- Q-1. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.


select * from worker where first_name not in ('Vipul' , 'Satish');

-- or

select * from worker where first_name != 'Vipul' or first_name != 'Satish';


-- Q-2. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

select * from worker where first_name like '_____h' and length(first_name) = 6;


-- Q-3. Write a query to validate Email of Employee.

select Email_id from Employee where Email_id REGEXP '^[A-Za-z0-9]+@gmail\.com$' or Email_id REGEXP '^[A-Za-z0-9]+@yahoo\.com$'

