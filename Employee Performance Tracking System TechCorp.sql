create database krishna_suresh_Data_analyst_project_TechCorp;

use krishna_suresh_Data_analyst_project_TechCorp;

----- creating tables


------ 1.create Department table with department_id pk and department_name not null;

create table Department(Department_id int primary key ,   --- (Unique + not null)
                       DepartName varchar(100) not null);



------- 2.create job_title table with job_title_id pk and job_title_name ;

create table job_title(job_title_id int primary key,
                       job_title_name varchar(100) unique not null);



---------- 3.create employee table (self referencing key)

create table employee(employee_id int primary key,
                      first_name varchar(100) not null,
					  last_name varchar(100) not null,
					  DateOfBirth Date,
					  gender varchar(10),
					  PhoneNumber varchar(15) unique,
					  email varchar(100) unique,
					  HireDate Date not null,
					  department_id int,
					  job_title_id int,
					  manager_id int,
					  foreign key (Department_id) references  Department(Department_id),
					  foreign key (job_title_id) references job_title(job_title_id),
					  foreign key (manager_id) references employee(employee_id));


---- 4.create Attendance table 

create table Attendance(Attendance_id int primary key,
                        Employee_id int not null,
						Date Date not null,
                        Status varchar(10) check (Status in ('Present' , 'Absent ', 'Leave')),
						foreign key (Employee_id) references Employee(employee_id));


------- 5.Create Salary Table

create table Salary(Salary_id int primary key , 
                    Employee_id int not null , 
					BaseSalary decimal(10,2) not null,
					Bonus decimal(10,2) default 0.00,
					Deductions decimal(10,2) default 0.00,
					PaymentDate Date not null,
					foreign key (Employee_id) references Employee(Employee_id));


-------- 6.Create Project Table

create table project(project_id int primary key,
                     project_name varchar(100) not null,
					 start_date Date ,
					 end_date Date ,
					 project_manager_id int ,
					 foreign key (project_manager_id) references Employee(employee_id));



-------------   7.Create project_allocation table

create table project_allocation(allocation_id int primary key,
                                employee_id int foreign key (employee_id) references Employee(Employee_id) ,
								project_id int ,
								allocation_date Date , 
		
								foreign key (project_id) references project(project_id),
								constraint  unique_employee_project  unique(employee_id , project_id));
-- last constraint does not allow duplication of combination(empid,projectid)(1,1) does not repeated.but it can allowed (1,2).
-- Here we avoid duplication of combination of both means same id with same projectid again.


--drop table project_allocation;



---------------------------------------     DML     -----------------------------------------------------

---------- 1.Insert data in Department table

insert into Department(Department_id , DepartName) 
            values    (1, 'Human Resources'),
			          (2, 'Engineering'),
					  (3, 'Sales'),
					  (4, 'Marketing'),
					  (5, 'Finance');


-------------- 2.Insert data in Job_title table

insert into job_title(job_title_id,job_title_name) values
                     (1, 'HR Manager'),
					 (2, 'Software Engineer'),
					 (3, 'Sales Executive'),
					 (4, 'Marketing Manager'),
					 (5, 'Finance Analyst'),
					 (6, 'Project Manager'),
					 (7, 'Software Developer'),
					 (8, 'Accountant'),
					 (9, 'Data Scientist'),
					 (10, 'Marketing Executive');



-------------------- 3.  Insert in Employee table --------------------------------

insert into Employee ( employee_id , first_name , last_name , DateOfBirth , gender , PhoneNumber , email , HireDate , department_id , job_title_id , manager_id)
            values(1, 'John', 'Doe', '1980-01-15', 'M', '123-456-7890', 'john.doe@example.com', '2015-06-01', 1, 1, NULL),
(2, 'Jane', 'Smith', '1985-03-20', 'F', '234-567-8901', 'jane.smith@example.com', '2016-07-10', 2, 2, NULL),
(3, 'Michael', 'Johnson', '1978-11-30', 'M', '345-678-9012', 'michael.johnson@example.com', '2014-08-15', 3, 3, NULL),
(4, 'Emily', 'Davis', '1990-05-25', 'F', '456-789-0123', 'emily.davis@example.com', '2017-09-01', 4, 4, 1),
(5, 'David', 'Martinez', '1982-07-18', 'M', '567-890-1234', 'david.martinez@example.com', '2015-10-21', 5, 5, 2),
(6, 'Sarah', 'Miller', '1992-02-10', 'F', '678-901-2345', 'sarah.miller@example.com', '2018-01-15', 1, 2, 3),
(7, 'James', 'Wilson', '1988-09-05', 'M', '789-012-3456', 'james.wilson@example.com', '2016-03-12', 2, 3, 4),
(8, 'Olivia', 'Moore', '1991-10-25', 'F', '890-123-4567', 'olivia.moore@example.com', '2017-12-10', 3, 4, 5),
(9, 'William', 'Taylor', '1983-04-13', 'M', '901-234-5678', 'william.taylor@example.com', '2016-11-30', 4, 1, 3),
(10, 'Sophia', 'Anderson', '1993-06-27', 'F', '123-456-7891', 'sophia.anderson@example.com', '2018-02-22', 5, 5, 2),
(11, 'Benjamin', 'Thomas', '1981-12-09', 'M', '234-567-8902', 'benjamin.thomas@example.com', '2014-05-18', 1, 2, 3),
(12, 'Isabella', 'Jackson', '1987-03-15', 'F', '345-678-9013', 'isabella.jackson@example.com', '2017-06-05', 2, 3, 4),
(13, 'Lucas', 'White', '1984-08-28', 'M', '456-789-0124', 'lucas.white@example.com', '2015-07-09', 3, 4, 5),
(14, 'Mia', 'Harris', '1994-01-19', 'F', '567-890-1235', 'mia.harris@example.com', '2018-03-17', 4, 1, 1),
(15, 'Alexander', 'Clark', '1986-12-21', 'M', '678-901-2346', 'alexander.clark@example.com', '2016-04-25', 5, 5, 2),
(16, 'Ethan', 'Lewis', '1990-09-11', 'M', '789-012-3457', 'ethan.lewis@example.com', '2017-09-11', 1, 1, 3),
(17, 'Ava', 'Walker', '1988-02-03', 'F', '890-123-4568', 'ava.walker@example.com', '2016-10-07', 2, 2, 4),
(18, 'Charlotte', 'Hall', '1985-05-29', 'F', '901-234-5679', 'charlotte.hall@example.com', '2015-12-15', 3, 3, 5),
(19, 'Jackson', 'Allen', '1981-11-03', 'M', '123-456-7892', 'jackson.allen@example.com', '2014-06-21', 4, 4, 1),
(20, 'Amelia', 'Young', '1989-08-17', 'F', '234-567-8903', 'amelia.young@example.com', '2016-01-25', 5, 5, 2),
(21, 'Sebastian', 'King', '1984-02-20', 'M', '345-678-9014', 'sebastian.king@example.com', '2014-11-28', 1, 2, 3),
(22, 'Liam', 'Wright', '1987-07-08', 'M', '456-789-0125', 'liam.wright@example.com', '2016-09-19', 2, 3, 4),
(23, 'Aiden', 'Scott', '1983-12-22', 'M', '567-890-1236', 'aiden.scott@example.com', '2015-04-02', 3, 4, 5),
(24, 'Harper', 'Green', '1991-01-30', 'F', '678-901-2347', 'harper.green@example.com', '2017-05-12', 4, 1, 1),
(25, 'Jack', 'Adams', '1986-09-14', 'M', '789-012-3458', 'jack.adams@example.com', '2016-12-01', 5, 5, 2),
(26, 'Ella', 'Baker', '1989-03-11', 'F', '890-123-4569', 'ella.baker@example.com', '2015-07-23', 1, 2, 3),
(27, 'Henry', 'Gonzalez', '1993-10-07', 'M', '901-234-5680', 'henry.gonzalez@example.com', '2018-01-03', 2, 3, 4),
(28, 'Lily', 'Nelson', '1992-06-05', 'F', '123-456-7893', 'lily.nelson@example.com', '2018-03-01', 3, 4, 5),
(29, 'Matthew', 'Carter', '1985-11-18', 'M', '234-567-8904', 'matthew.carter@example.com', '2016-02-14', 4, 1, 3),
(30, 'Scarlett', 'Mitchell', '1988-07-26', 'F', '345-678-9015', 'scarlett.mitchell@example.com', '2017-06-23', 5, 5, 2),
(31, 'Charlotte', 'Perez', '1981-12-15', 'F', '456-789-0126', 'charlotte.perez@example.com', '2014-08-19', 1, 2, 3),
(32, 'James', 'Roberts', '1984-04-21', 'M', '567-890-1237', 'james.roberts@example.com', '2015-09-09', 2, 3, 4),
(33, 'Oliver', 'Murphy', '1990-12-01', 'M', '678-901-2348', 'oliver.murphy@example.com', '2016-04-18', 3, 4, 5),
(34, 'Avery', 'Evans', '1992-09-13', 'F', '789-012-3459', 'avery.evans@example.com', '2017-10-02', 4, 1, 1),
(35, 'Mason', 'Walker', '1989-05-08', 'M', '890-123-4570', 'mason.walker@example.com', '2015-03-20', 5, 5, 2),
(36, 'Sophia', 'Wood', '1991-11-09', 'F', '901-234-5681', 'sophia.wood@example.com', '2016-08-17', 1, 2, 3),
(37, 'Jacob', 'Green', '1987-06-03', 'M', '123-456-7894', 'jacob.green@example.com', '2016-12-07', 2, 3, 4),
(38, 'Samuel', 'Baker', '1994-08-19', 'M', '234-567-8905', 'samuel.baker@example.com', '2017-01-15', 3, 4, 5),
(39, 'Zoe', 'Lopez', '1983-03-27', 'F', '345-678-9016', 'zoe.lopez@example.com', '2015-10-31', 4, 1, 1),
(40, 'Gabriel', 'Hill', '1986-07-12', 'M', '456-789-0127', 'gabriel.hill@example.com', '2016-05-20', 5, 5, 2),
(41, 'Elijah', 'Graham', '1992-04-15', 'M', '567-890-1238', 'elijah.graham@example.com', '2018-02-03', 1, 2, 3),
(42, 'Lucy', 'Rivera', '1989-09-09', 'F', '678-901-2349', 'lucy.rivera@example.com', '2016-09-29', 2, 3, 4),
(43, 'Isaac', 'Cooper', '1990-01-25', 'M', '789-012-3460', 'isaac.cooper@example.com', '2017-03-15', 3, 4, 5),
(44, 'Chloe', 'James', '1993-11-18', 'F', '890-123-4571', 'chloe.james@example.com', '2018-05-10', 4, 1, 1),
(45, 'Liam', 'Lee', '1987-02-27', 'M', '901-234-5682', 'liam.lee@example.com', '2016-07-25', 5, 5, 2),
(46, 'Benjamin', 'Lopez', '1985-10-12', 'M', '123-456-7895', 'benjamin.lopez@example.com', '2015-02-28', 1, 2, 3),
(47, 'Aiden', 'Harris', '1990-07-23', 'M', '234-567-8906', 'aiden.harris@example.com', '2016-11-12', 2, 3, 4),
(48, 'Layla', 'Thompson', '1991-05-05', 'F', '345-678-9017', 'layla.thompson@example.com', '2017-07-08', 3, 4, 5),
(49, 'Jackson', 'Johnson', '1988-08-13', 'M', '456-789-0128', 'jackson.johnson@example.com', '2015-04-25', 4, 1, 1),
(50, 'Grace', 'White', '1982-09-22', 'F', '567-890-1239', 'grace.white@example.com', '2015-01-13', 5, 5, 2);



---------------------- insert data in Attendance table -----------------------------------------

insert into Attendance( Attendance_id , Employee_id , Date , Status) values
                       (1, 1, '2024-10-01', 'Present'),
					   (2, 2, '2024-10-01', 'Absent'),
					   (3, 3, '2024-10-01', 'Leave'),
					   (4, 4, '2024-10-01', 'Present'),
					   (5, 5, '2024-10-01', 'Absent'),
					   (6, 6, '2024-10-01', 'Present'),
					   (7, 7, '2024-10-01', 'Leave'),
					   (8, 8, '2024-10-01', 'Present'),
					   (9, 9, '2024-10-01', 'Absent'),
					   (10, 10, '2024-10-01', 'Present'),
					   (11, 11, '2024-10-01', 'Present'),
(12, 12, '2024-10-01', 'Absent'),
(13, 13, '2024-10-01', 'Leave'),
(14, 14, '2024-10-01', 'Present'),
(15, 15, '2024-10-01', 'Absent'),
(16, 16, '2024-10-01', 'Leave'),
(17, 17, '2024-10-01', 'Present'),
(18, 18, '2024-10-01', 'Absent'),
(19, 19, '2024-10-01', 'Present'),
(20, 20, '2024-10-01', 'Present'),
(21, 21, '2024-10-01', 'Absent'),
(22, 22, '2024-10-01', 'Leave'),
(23, 23, '2024-10-01', 'Present'),
(24, 24, '2024-10-01', 'Absent'),
(25, 25, '2024-10-01', 'Present'),
(26, 26, '2024-10-01', 'Leave'),
(27, 27, '2024-10-01', 'Present'),
(28, 28, '2024-10-01', 'Absent'),
(29, 29, '2024-10-01', 'Leave'),
(30, 30, '2024-10-01', 'Present'),
(31, 31, '2024-10-01', 'Absent'),
(32, 32, '2024-10-01', 'Present'),
(33, 33, '2024-10-01', 'Leave'),
(34, 34, '2024-10-01', 'Present'),
(35, 35, '2024-10-01', 'Absent'),
(36, 36, '2024-10-01', 'Leave'),
(37, 37, '2024-10-01', 'Present'),
(38, 38, '2024-10-01', 'Absent'),
(39, 39, '2024-10-01', 'Present'),
(40, 40, '2024-10-01', 'Leave'),
(41, 41, '2024-10-01', 'Present'),
(42, 42, '2024-10-01', 'Absent'),
(43, 43, '2024-10-01', 'Present'),
(44, 44, '2024-10-01', 'Leave'),
(45, 45, '2024-10-01', 'Absent'),
(46, 46, '2024-10-01', 'Present'),
(47, 47, '2024-10-01', 'Leave'),
(48, 48, '2024-10-01', 'Present'),
(49, 49, '2024-10-01', 'Absent'),
(50, 50, '2024-10-01', 'Present');

--------------------------- insert into salary table ---------------------

insert into salary (salary_id , Employee_id , BaseSalary , Bonus , Deductions , PaymentDate) values
(1, 1, 60000, 5000, 1000, '2024-10-30'),
(2, 2, 70000, 6000, 1200, '2024-10-30'),
(3, 3, 65000, 5500, 1100, '2024-10-30'),
(4, 4, 75000, 6500, 1300, '2024-10-30'),
(5, 5, 68000, 6200, 1250, '2024-10-30'),
(6, 6, 72000, 6300, 1400, '2024-10-30'),
(7, 7, 66000, 5400, 1150, '2024-10-30'),
(8, 8, 71000, 5900, 1300, '2024-10-30'),
(9, 9, 67000, 6100, 1200, '2024-10-30'),
(10, 10, 69000, 6000, 1300, '2024-10-30'),
(11, 11, 72000, 5500, 1250, '2024-10-30'),
(12, 12, 70000, 5800, 1200, '2024-10-30'),
(13, 13, 74000, 6100, 1350, '2024-10-30'),
(14, 14, 69000, 5900, 1250, '2024-10-30'),
(15, 15, 67000, 5500, 1100, '2024-10-30'),
(16, 16, 72000, 5400, 1200, '2024-10-30'),
(17, 17, 70000, 5900, 1300, '2024-10-30'),
(18, 18, 68000, 5700, 1250, '2024-10-30'),
(19, 19, 71000, 6200, 1200, '2024-10-30'),
(20, 20, 69000, 5400, 1350, '2024-10-30'),
(21, 21, 73000, 5600, 1200, '2024-10-30'),
(22, 22, 68000, 5800, 1250, '2024-10-30'),
(23, 23, 71000, 6000, 1300, '2024-10-30'),
(24, 24, 65000, 5400, 1150, '2024-10-30'),
(25, 25, 68000, 5900, 1200, '2024-10-30'),
(26, 26, 70000, 6200, 1250, '2024-10-30'),
(27, 27, 71000, 6300, 1350, '2024-10-30'),
(28, 28, 68000, 5900, 1200, '2024-10-30'),
(29, 29, 72000, 6000, 1250, '2024-10-30'),
(30, 30, 75000, 6500, 1300, '2024-10-30'),
(31, 31, 70000, 5800, 1200, '2024-10-30'),
(32, 32, 69000, 6100, 1250, '2024-10-30'),
(33, 33, 67000, 5600, 1150, '2024-10-30'),
(34, 34, 72000, 5900, 1300, '2024-10-30'),
(35, 35, 74000, 6100, 1350, '2024-10-30'),
(36, 36, 68000, 5400, 1200, '2024-10-30'),
(37, 37, 69000, 5800, 1250, '2024-10-30'),
(38, 38, 71000, 5900, 1300, '2024-10-30'),
(39, 39, 75000, 6000, 1350, '2024-10-30'),
(40, 40, 67000, 5500, 1100, '2024-10-30'),
(41, 41, 72000, 5900, 1250, '2024-10-30'),
(42, 42, 74000, 6200, 1300, '2024-10-30'),
(43, 43, 71000, 5800, 1250, '2024-10-30'),
(44, 44, 68000, 5400, 1200, '2024-10-30'),
(45, 45, 69000, 6000, 1250, '2024-10-30'),
(46, 46, 73000, 5500, 1300, '2024-10-30'),
(47, 47, 71000, 5900, 1200, '2024-10-30'),
(48, 48, 75000, 6500, 1350, '2024-10-30'),
(49, 49, 68000, 5700, 1250, '2024-10-30'),
(50, 50, 70000, 6000, 1300, '2024-10-30');

------------------------------ Insert data into Project table ------------------------------------------------------

insert into project(project_id , project_name , start_date , end_date , project_manager_id) values
(1, 'Project Alpha', '2024-01-01', '2024-12-31', 1),
(2, 'Project Beta', '2024-02-01', '2024-12-31', 2),
(3, 'Project Gamma', '2024-03-01', '2024-12-31', 3),
(4, 'Project Delta', '2024-04-01', '2024-12-31', 4),
(5, 'Project Epsilon', '2024-05-01', '2024-12-31', 5);


----------------------------------------- insert into project_allocation table ---------------------------

insert into project_allocation(allocation_id , employee_id , project_id , allocation_date) values
                              (1, 1, 1, '2024-01-01'),
(2, 2, 1, '2024-01-02'),
(3, 3, 1, '2024-01-03'),
(4, 4, 2, '2024-02-01'),
(5, 5, 2, '2024-02-05'),
(6, 6, 2, '2024-02-10'),
(7, 7, 3, '2024-03-01'),
(8, 8, 3, '2024-03-02'),
(9, 9, 3, '2024-03-05'),
(10, 10, 4, '2024-04-01'),
(11, 11, 4, '2024-04-05'),
(12, 12, 4, '2024-04-10'),
(13, 13, 5, '2024-05-01'),
(14, 14, 5, '2024-05-03'),
(15, 15, 5, '2024-05-07'),
(16, 16, 1, '2024-06-01'),
(17, 17, 1, '2024-06-02'),
(18, 18, 2, '2024-07-01'),
(19, 19, 2, '2024-07-02'),
(20, 20, 3, '2024-08-01'),
(21, 21, 3, '2024-08-02'),
(22, 22, 4, '2024-09-01'),
(23, 23, 4, '2024-09-05'),
(24, 24, 5, '2024-10-01'),
(25, 25, 5, '2024-10-02'),
(26, 26, 1, '2024-11-01'),
(27, 27, 2, '2024-11-03'),
(28, 28, 3, '2024-12-01'),
(29, 29, 4, '2024-12-05'),
(30, 30, 5, '2024-12-10');


select * from Department;
select * from job_title;
select * from employee;
select * from Salary;
select * from Attendance;
select * from project;
select * from project_allocation;



------Q1.: Retrive first name and last name of employee;

select first_name , last_name from Employee;


------------- Q.2.: Retrive first_name and last_name of employees work as 'software Engineer'

select e.first_name , e.last_name from employee as e inner join job_title as j 
on e.job_title_id = j.job_title_id  
where j.job_title_name = 'Software Engineer';
----- or-----
select first_name , last_name from employee where job_title_id = (select job_title_id from job_title  where job_title_name = 'Software Engineer');

--- whenwever refered to single value in sub query use = (equal to) and 
--- multiple values returned by sub query then use in (membership operator)

--------------------------- Q.3.: Retrive first names and last names of last 7 hires ----------------

select first_name , last_name from Employee order by HireDate desc limit 7; --- mysql

select Top 7  first_name , last_name from Employee order by HireDate desc;    ---- SQL server


------------------------ Q.4. Get the count of Employees in each job title ------------------------------------------

select j.job_title_name , count(e.employee_id) as count_of_Employees_in_each_job_title from 
Employee as e inner join job_title as j on e.job_title_id = j.job_title_id group by j.job_title_name;


----------------Q.5. Retrive full name and other personal info of employee who working in 'Engineering' department;---------

select concat(first_name , ' '  ,last_name) as Full_name , DateOfBirth , gender , PhoneNumber from employee where department_id =
(select department_id from department where departName = 'Engineering');   ---- subquery

----- or 

select concat(e.first_name , ' ' , e.last_name) as full_name , DateOfBirth , gender , PhoneNumber  from employee as e 
inner join Department as d on e.department_id = d.department_id where d.departName = 'Engineering';   --- join


----------------------------- Q.6. Retrive firstname from full name --------------------------------------------

create view view_employee_dept as 
select concat(e.first_name , ' ' , e.last_name) as full_name , DateOfBirth , gender , PhoneNumber  from employee as e 
inner join Department as d on e.department_id = d.department_id where d.departName = 'Engineering' ;

select * from view_employee_dept;


select left( full_name    , charindex(' ' , full_name)-1) as first_name from view_employee_dept;

--left(string , number of characters)  --- extract data of left side of charindex
--charindex(sybstring , string)



-------------------------------  Q.7. Retrive Lastname from full name ----------------------------------------------------

select  right(full_name  ,len(full_name) -  charindex(' ' , full_name)) from view_employee_dept;

--right(string , number of characters)  --- extract data of right side of charindex
--charindex(sybstring , string)


--------------------------------- Q.8. List job titles that have more than 3 employees; -----------------------------------

select j.job_title_name , count(e.employee_id)as count_employee_id from  employee as e inner join job_title  as j 
on e.job_title_id = j.job_title_id group by j.job_title_name having count(employee_id) > 3;


------- Q.9. Retrive all employees along with their department names ---------


--select first_name , last_name , department_id from employee where department_id in (select department_id from  department);


select first_name , last_name , departname , e.department_id from employee as e inner join  department as d on 
e.department_id = d.department_id;


------------------------ Q.10. Retrive the first names of employees and the projects they are working on , along with their role 
-- in the project


select * from project_allocation;

select e.first_name , p.employee_id , p.project_id , p1.project_name , j.job_title_name 
from 
employee as e
inner join 
project_allocation as p   on  e.employee_id =   p.employee_id
inner join 
project as p1 on p.project_id = p1.project_id
inner join 
job_title as j on e.job_title_id = j.job_title_id;


-------------------------- Q.11.Get the count of employee in each department-------------------------------------

select d.departname , count(e.employee_id) from employee as e inner join department as d on e.department_id = d.department_id 
group by d.departname;


--------------------------- Q.12.Lists of all department with more than 5 employees--------------------------------

select d.departName ,count(e.employee_id) from employee as e inner join department as d 
on e.department_id = d.department_id group by d.departName having count(e.employee_id) > 5;

----------------------------- Q.13. Retrive the names of employees and their managers ----------------------------------
-- self join


select * from employee;

select concat(e1.first_name , ' ' , e1.last_name) as Managers_Name , concat(e2.first_name , ' ' , e2.last_name) as Employees_name 
from employee as e1 inner join employee as e2 on e1.manager_id = e2.employee_id ;



----------- Q.14. Which manager is managing more employees and how many ?


select m.manager_id , count(e.employee_id)as count_employees_per_manager  from employee as m inner join employee as e 
on m.manager_id = e.employee_id
group by m.manager_id order by count_employees_per_manager desc ;


select * from Employee;
select concat(m.first_name , ' ' ,m.last_name)as manager_name  , count(distinct(e.employee_id)) as count_employees_per_manager  
from employee as e inner join employee as m on e.manager_id = m.employee_id
group by concat(m.first_name , ' ' , m.last_name) order by count_employees_per_manager desc; 



select concat(m.first_name , ' ' , m.last_name) as manager_name , count(distinct(e.employee_id)) as number_of_employees 
from employee as e  inner join employee as m 
on e.manager_id = m.employee_id 
group by m.first_name , m.last_name order by number_of_employees desc;


------------------------------ Q.15. Which manager is handling more employees -----------------------

select top 1 concat(m.first_name , ' ' , m.last_name) as manager_name , count(distinct(e.employee_id)) as number_of_employees 
from employee as e  inner join employee as m 
on e.manager_id = m.employee_id 
group by m.first_name , m.last_name order by number_of_employees desc;


-------------------------------- Q.16. Retrive names of employees working on projects is 'software engineer' 
--ordered by project start date


select concat(e.first_name  , ' ' , e.last_name) as name_of_employees , j.job_title_name  , p.start_date
from job_title as j  inner join employee as e
on j.job_title_id =  e.job_title_id
inner join project_allocation as pa on e.employee_id = pa.employee_id
inner join project as p on pa.project_id = p.project_id 
where j. job_title_name = 'software engineer' order by 3 asc ;



-------------------- Q.17.Retrive names of all employees who are working on project delta;

select e.first_name , e.last_name , p.project_name as project_name from employee as e 
inner join project_allocation as pa on e.employee_id = pa.employee_id
inner join project as p on pa.project_id = p.project_id
where p.project_name = 'project delta';

--or


select e.first_name , e.last_name  from employee as e 
inner join project_allocation as pa on e.employee_id = pa.employee_id 
where pa.project_id = (select project_id from project where project_name = 'project delta') ;


------ or    nested query 
select first_name, last_name from employee where employee_id in (
select employee_id from project_allocation where project_id = 
(select project_id from project where project_name = 'project delta'));



--------- Q.18.Retrive the names of employees , department name and total salary ordered by total salary in descending order

select  e.first_name , e.last_name , d.departname , (s.BaseSalary + Bonus - Deductions) as total_sal from department as d 
inner join employee as e on d.department_id = e.department_id
inner join Salary as s on e.employee_id = s.employee_id 
order by 4 desc;




----------------- Q.19.create a function find employee with a birthday in given month and calculate their age ? --------------------


select first_name , last_name , DateOfBirth ,
Datediff(YEAR , DateOfBirth , getdate()) as age
from employee  where month(DateOfBirth) = 12;


CREATE Function dbo.Get_birthday(@Month INT)
Returns Table
AS
Return 
(
select first_name , last_name , DateOfBirth ,
YEAR(GETDATE()) - YEAR(DateOfBirth) as age from employee
where month(DateOfBirth) = @Month

);


select * from dbo.get_birthday(12);

--drop function dbo.getbirthday;


--------- Q.1.Find the employees who have a birthday in November and their age --------------------------------


select first_name , last_name , age , DateOfBirth from dbo.get_birthday(11);


------------------ Q.2.Find the employees who have birthday in march -----------------------------------------------------

select first_name , last_name from dbo.get_birthday(3);



----HW


----- 1.Create a function to find employees in a specified department and calculate their years of service
------ find the employees in the IT depatment and their years of service
-------find employees in the HR department and their years of service

create function dbo.get_years_service_dept(@departname varchar(20))
Returns table 
AS
Return
(
select e.first_name , e.last_name , d.departName ,  Year(GETDATE()) - Year(HireDate) as years_of_Service 
from employee as e inner join  department as d 
on e.department_id = d.department_id where departName = @departname

);

-- find the employees in the IT depatment and their years of service

select first_name , last_name , years_of_service from  dbo.get_years_service_dept('IT');

select * from Department;

------ find employees in the HR department and their years of service

select first_name , last_name  , years_of_Service , DepartName from dbo.get_years_service_dept('Human Resources'); 

--select first_name , last_name  , years_of_Service from dbo.get_years_service_dept('Engineering'); 
--select first_name , last_name  , years_of_Service , DepartName from dbo.get_years_service_dept('Sales'); 
--select first_name , last_name  , years_of_Service , DepartName from dbo.get_years_service_dept('Marketing');
--select first_name , last_name  , years_of_Service , DepartName from dbo.get_years_service_dept('Finance'); 







--drop function dbo.get_years_service_dept;
