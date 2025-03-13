--- Create database Employee Database

create database EmployeeDB;


--- Use Employee database

Use EmployeeDB;


--- creating tables 

--- First we will make Department Table 

---- Always keep in mind , Independent tables should be create first then dependent.
---- Independent table means those tables does not have foreign key.

Create table Department(
          
		              Department_id int primary key ,
					  Department_name varchar(24),
					  Manager_id int,
					  Location varchar(24));


Create table Employee(
                     
					  Employee_id int primary key ,
					  first_name varchar(30),
					  last_name varchar(30),
					  department_id int,
					  Hire_date date ,
					  Salary int ,
					  Gender varchar(2),
					  Email varchar(50),
					  Phone_Number varchar(15),
					  foreign key (department_id) references Department(Department_id));


Create table Project(

                      Project_id int primary key ,
					  Project_name varchar(50),
					  Department_id int , 
					  Start_date Date ,
					  End_date Date ,
					  Budget int ,
					  Project_Manager_id int ,
					  Status varchar(30),
					  foreign key (Department_id) references department(department_id));


Create table Salary(

                    Salary_id int primary key ,
					Employee_id int not null ,
					Salary int ,
					Bonus int , 
					Deduction int , 
					Effective_date Date,
					foreign key (Employee_id) references Employee(Employee_id));



Create table Employee_Project(

                             Employee_id int ,
							 Project_id int  ,
							 Role varchar(30),
							 Start_date Date ,
							 End_date date,
							 foreign key (Employee_id) references Employee(Employee_id));



Create table attendence(

                        Attendence_id int primary key ,
						Employee_id int ,
						Date date ,
						Status1 varchar(20),
						foreign key (Employee_id) references Employee(Employee_id));




--- Check Tables after data insertion

select * from Department;
select * from Employee;
select * from project;
select * from salary;
select * from employee_project;
select * from attendence;



-------------------------- Data Analysis ------------------------------------------------


-- 1.Get the attendance status of employess on a specific date "2023-01-11"

select * from attendence;

Alter table Attendence rename to Attendance;

select * from attendance;

select a.employee_id , 
       first_name , 
	   last_name,
       date , 
	   status1 as attendance_status 
	   from attendance as a inner join employee as e
       on a.employee_id = e.employee_id where date = '2023-01-11';


-- 2.Find all employees in a specific department (dept id = 102)


select employee_id , 
       first_name , 
	   last_name , 
	   e.department_id ,
	   department_name
	   from employee as e inner join department as d
       on e.department_id = d.department_id where e.department_id = 102;


-- 3.List all projects and their associated department names

select project_id , 
       project_name , 
	   p.department_id , 
	   department_name 
	   from project as p inner join department as d
       on p.department_id = d.department_id order by department_name asc;


-- 4.Get the salary details of employees along with their bonuses


select s.employee_id , 
       first_name , 
	   last_name , 
	   s.salary , 
	   bonus , 
	   (s.salary + bonus) as Total_salary
       from employee as e inner join salary as s 
	   on e.employee_id = s.employee_id;


-- 5.Get the number of employees in each department

select e.department_id , 
       department_name , 
	   count(e.employee_id) as No_of_employees 
       from department as d inner join employee as e
       on d.department_id = e.department_id 
	   group by e.department_id , department_name 
	   order by No_of_employees desc;



-- 6.Get the total number of days each employee was present in a specific month and year (01,2023)


select e.employee_id , 
       concat(first_name , ' ', last_name) as employee_name , 
	   sum(
           Case
		   
		        WHEN status1 = 'Present' THEN 1
			    ELSE 0

		  END) as no_o_days_present													 
	  from employee as e inner join attendance as a
	  on e.employee_id = a.employee_id 
	  where date between '2023-01-01' and '2023-01-31'
	  group by e.employee_id , first_name , last_name
	  order by e.employee_id;
											


-- or


select e.employee_id , 
       concat(first_name , ' ', last_name) as Employee_name , 
	   count(
             Case
			 
			      WHEN status1 = 'Present' THEN 1

			END) as no_o_days_present
	   from employee as e inner join attendance as a
	   on e.employee_id = a.employee_id 
	   where date between '2023-01-01' and '2023-01-31'
	   group by e.employee_id , first_name , last_name
	   order by e.employee_id;


-- or

-- Alter table attendance rename column attendence_id to attendance_id;

-- In mysql / Microsoft Sql Server only (correct)

select e.employee_id , 
       concat(first_name , ' ' , last_name) as employee_name ,
	   count(attendance_id) as no_of_days_present
       from employee as e inner join attendance as a 
	   on e.employee_id = a.employee_id
       where status1 = 'Present' and month(date) = 01 and Year(date) = 2023
	   group by e.employee_id , first_name , last_name
       order by e.employee_id asc;


-- In postegresql

select e.employee_id , 
       concat(first_name , ' ' , last_name) as employee_name ,
	   count(attendance_id) as no_of_days_present
       from employee as e inner join attendance as a 
	   on e.employee_id = a.employee_id
       where status1 = 'Present' and date between  '2023-01-01' and '2023-01-31'
	   group by e.employee_id , first_name , last_name
       order by e.employee_id asc;



-- 7.Calculate the net salary of all employees after bonuses and deductors , and 
--list those whose net salary exceedds a certain threshold.(60000/-)


select e.employee_id , 
       concat(first_name , ' ' , last_name) as employee_name , 
	   e.Salary , 
	   Bonus,
       (e.salary + bonus) as Total_salary , 
	   deduction , 
	   ((e.salary + bonus) - deduction) as Net_salary 
	   from employee as e inner join salary as s 
	   on e.employee_id = s.employee_id 
	   where ((e.salary + bonus) - deduction) > 60000;

-- or 


select e.employee_id , 
       concat(first_name , ' ' , last_name) as employee_name , 
	   e.Salary , 
	   Bonus,
       sum((e.salary + bonus)) as Total_salary , 
	   deduction , 
	   sum(((e.salary + bonus) - deduction)) as Net_salary 
	   from employee as e
       inner join salary as s on e.employee_id = s.employee_id 
       group by e.employee_id , first_name , last_name , e.salary , Bonus , deduction 
       having sum(((e.salary + bonus) - deduction)) > 60000 order by e.employee_id asc;


-- 8.Rank departments based on the number of active employees and their total salaries


-- PostgreSql


With department_active_employees_and_total_salaries AS(

                                               select e.department_id , 
											           department_name ,
													   count(e.employee_id) as no_of_employee_in_department , 
                                                      sum(e.salary + bonus) as Total_salary_of_department,
                                                      Rank() over(order by count(e.employee_id) desc , 
			                                          sum(e.salary + bonus) desc) as Rank_employee_number_and_salary
                                                      from employee as e inner join department as d 
                                                      on e.department_id = d.department_id
                                                      inner join salary as s on e.employee_id = s.salary_id
                                                      where extract(Year from Hire_date) <= extract(Year from current_date) -- for active employees
                                                      group by e.department_id , department_name


)

select * from department_active_employees_and_total_salaries;



-- Mysql


With department_active_employees_and_total_salaries AS(

                                                  select e.department_id   , 
												          department_name , 
														  count(e.employee_id) as no_of_employee_in_department , 
                                                         sum(e.salary + bonus) as Total_salary_of_department,
                                                         Rank() over(order by count(e.employee_id) desc , sum(e.salary + bonus) desc) as Rank_employee_number_and_salary
                                                         from employee as e inner join department as d 
                                                         on e.department_id = d.department_id
                                                         inner join salary as s on e.employee_id = s.salary_id
                                                         where Year(Hire_date) <= Year(Curdate()) -- for active employees
                                                         group by e.department_id , department_name

)

select * from department_active_employees_and_total_salaries;


-- Microsoft Sql Server


With department_active_employees_and_total_salaries AS(

                                              select e.department_id   , 
													  department_name , 
													  count(e.employee_id) as no_of_employee_in_department , 
                                                     sum(e.salary + bonus) as Total_salary_of_department,
                                                     Rank() over(order by count(e.employee_id) desc , sum(e.salary + bonus) desc) as Rank_employee_number_and_salary
                                                     from employee as e inner join department as d 
                                                     on e.department_id = d.department_id
                                                     inner join salary as s on e.employee_id = s.salary_id
                                                     where Year(Hire_date)<= Year(GETDATE()) -- for active employees
                                                     group by e.department_id , department_name

)

select * from department_active_employees_and_total_salaries;



-- 9.Get the net salary of employees


With net_salary AS(

                  select e.employee_id , 
                  concat(first_name , ' ' , last_name) as employee_name , 
				  e.salary , 
				  deduction ,
                 ((e.salary) - (deduction)) as Net_Salary , 
                 Dense_Rank()over(order by  ((e.salary) - (deduction)) desc) as Dense_Rank_net_salary
                 from employee as e inner join salary as s on e.employee_id = s.employee_id
				 
)

select * from net_salary;


-- 10.Find employees who are not assigned to any project:


select employee_id from employee where employee_id not in 
                     (select employee_id from employee_project)

--- Because in employee_project contains only those employee_id whose having projects.


--12.Get the average net salary of employees in each department


With avg_net_salary AS(

                     select e.department_id , 
                            department_name , 
	                        cast(avg((e.salary) - (deduction)) AS decimal(10,2)) as avg_net_salary,
                            Rank() over(order by  avg((e.salary) - (deduction)) desc) as Rank_net_salary
                            from employee as e
                            inner join department as d on e.department_id = d.department_id 
                            inner join salary as s on e.employee_id = e.employee_id
                            group by  e.department_id , department_name

)

select * from avg_net_salary;


-- 13.Get project duration and budget:

select ep.project_id , 
       project_name , 
	   ep.start_date , 
	   ep.end_date , 
	   concat((ep.end_date - ep.start_date) , ' days') as Duration , budget
       from employee_project as ep inner join project as p 
	   on ep.project_id = p.project_id
	   order by project_id asc;


-- 14.Find departments with the highest total salary

select e.department_id , 
       department_name , 
	   max(e.salary + bonus) as Total_salary_of_department 
       from employee as e inner join department as d 
	   on e.department_id = d.department_id
       inner join salary as s 
	   on e.employee_id = s.employee_id 
       group by e.department_id , department_name
       order by Total_salary_of_department desc;


-- or 

With high_salary_in_department AS(
                                 select e.employee_id,
                                        e.department_id , 
                                        department_name , 
	                                    sum(e.salary + bonus) as Total_salary_of_department , 
	                                    Dense_Rank() over( partition by e.department_id order by sum(e.salary + bonus) desc) as Rank_department_salary
                                        from employee as e inner join department as d 
	                                    on e.department_id = d.department_id
                                        inner join salary as s 
	                                    on e.employee_id = s.employee_id 
                                        group by e.employee_id, e.department_id , department_name
	                                    order by total_salary_of_department desc)

select * from high_salary_in_department where Rank_department_salary <= 1;


-- 15.Get the departments with more than 5 employees who have a total salary exceeding a threshold 500,000.

select e.department_id , 
       department_name , 
	   count(e.employee_id) as No_of_employees , 
	   sum(s.salary + bonus) as Total_salary
       from employee as e inner join department as d 
	   on e.department_id = d.department_id
       inner join salary as s on e.employee_id = s.employee_id
       group by e.department_id , department_name
       having sum(s.salary + bonus) > 500000 and count(e.employee_id) > 5
	   order by No_of_employees desc , Total_salary desc ;

	   
-- 16.Using Window Functions to rank employees by salary and attendance

With rank_employees_salary_attendance AS(

select e.employee_id , 
       concat(first_name , ' ' , last_name) as Employee_name , 
	   sum(s.salary + bonus) as Total_salary,
       count(
             case 
	             WHEN status1 = 'Present' THEN 1
	         END) as No_of_days_present,
       rank() over(order by sum(s.salary + bonus) desc , 
	                        count(
                                 case 
	                                 WHEN status1 = 'Present' THEN 1
	                             END) desc) as rank_salary_and_attendance
      from employee as e inner join attendance as a on e.employee_id = a.employee_id
      inner join salary as s on e.employee_id = s.employee_id
      group by e.employee_id , first_name , last_name

)


select * from rank_employees_salary_attendance;


-- 17.Get the names and salaries of employees who are part of a project with a status of 'Completed'.


select e.employee_id , 
       concat(first_name , ' ' , last_name) as Employee_name , 
	   project_id , 
	   project_name ,
       sum(e.salary + bonus) as Total_salary , 
	   status 
	   from employee as e inner join salary as s 
	   on e.employee_id = s.employee_id
       inner join project as p 
	   on e.department_id = p.department_id
       where status = 'Completed' 
	   group by e.employee_id , first_name , last_name , project_id , project_name , status
       order by project_id;


-- 18.List all employees who have attended all workdays in a particular month (e.g., February 2023)


select e.employee_id , 
       concat(first_name , ' ' , last_name) as Employee_name , 
       count( 
             case
	             WHEN status1 =  'Present' THEN 1
	         END) as attendance_days
       from employee as e inner join 
	   attendance as a on e.employee_id = a.employee_id
       group by e.employee_id , first_name , last_name
       having count( 
                    case
	                    WHEN status1 =  'Present' THEN 1
	                END)  = 
			
			       (select count(*) from generate_series(
                                                    '2023-02-01' :: Date , 
									                 '2023-02-27' :: date,
									                 '1 Day' :: Interval) as day
					                   where extract(Dow from day) in (1,2,3,4,5));



-- 19.Retrieve the department with the highest average salary, 
--excluding employees who have not been assigned to any project.


With department_highest_salary_exclude_non_project_employee AS(

                                      select d.department_id , 
									          department_name , 
											  avg(s.salary + bonus) as avg_total_salary , 
                                             Rank() over(order by avg(s.salary + bonus) desc) as RanK_salary_department
                                             from employee as e inner join department as d 
											  on e.department_id = d.department_id
                                             inner join salary as s on e.employee_id = s.employee_id 
                                             where e.employee_id  in (select employee_id from employee_project)
                                             group by d.department_id , department_name 
											 
)

select * from department_highest_salary_exclude_non_project_employee;


-- Here in where clause we put logic, it says we want those employee which present in employee_project table
-- employee project contains only those employee which have project. so appearently , it give those employee
-- which have / assign project



-- 20.Get the details (employee name, department name, project name, and role) for employees 
-- who worked on a project during a specific time period (e.g., between '2024-05-01' and '2024-06-30').


select concat(first_name , ' ' , last_name) as Employee_name , 
       department_name , 
	   project_name , 
	   role 
	   from employee as e inner join department as d
       on e.department_id = d.department_id inner join project as p on e.department_id = p.department_id
       inner join employee_project as ep on e.employee_id = ep.employee_id
       where ep.start_date >= '2024-05-01'  and  ep.end_date <= '2024-06-30'
       group by first_name , last_name , department_name , project_name ,role ;


-- 21.For each department, find the average salary of employees who worked on a project with a specific 
-- status (e.g., 'Ongoing').

select e.department_id , 
       department_name , 
	   cast(avg(s.salary + bonus) AS decimal(10,2)) as avg_total_salary 
	   from employee as e inner join department as d 
	   on e.department_id = d.department_id inner join salary as s 
	   on e.employee_id = s.employee_id
       inner join project as p on e.department_id = p.department_id
       where status = 'Ongoing'
       group by e.department_id , department_name order by avg_total_salary desc;


-- 22.Display the name of the department and the number of employees working in each department, 
-- including departments with no employees.

select d.department_id ,
       department_name , 
	   count(e.employee_id) as No_of_employees_in_department
       from employee as e right join department as d on e.department_id = d.department_id
       group by d.department_id , department_name 
       order by No_of_employees_in_department desc;

-- so basically here , they want department with no employees as well . so we will get those departments which present
-- in employee table and department (common departments) by inner join but we want those also which does not have
-- employees so for that reason we not need inner join , we want other join like left , right so 
-- left table is employee and right is department .. so  here we put right join so first it will give common records
-- (departments) from both table and after that it will give uncommon of right side table so it will uncommon
--  records(departments) of department table . so it will give those departments which does not have employee as well.


-- 23.Find the department that has the most number of employees with a salary 
-- above a certain amount (e.g., 70,000).


select e.department_id , 
       department_name , 
	   count( 
             case
	             WHEN salary > 70000 THEN 1
			 END) as No_of_employees_having_greater_than_70000
	  from employee as e inner join department as d 
	  on e.department_id = d.department_id
	  group by e.department_id , department_name
	  order by No_of_employees_having_greater_than_70000 desc;
												 
-- or

select e.department_id , 
       department_name , 
	   sum( 
             case
	             WHEN salary > 70000 THEN 1
				 ELSE 0
			 END) as No_of_employees_having_greater_than_70000

	  from employee as e inner join department as d 
	  on e.department_id = d.department_id
	  group by e.department_id , department_name
	  order by No_of_employees_having_greater_than_70000 desc;
		

-- 24.Get the employee names and total bonuses they have received for the projects they are part of.

select e.employee_id , 
       concat(first_name , ' ' , last_name) as employee_name ,
       sum(bonus) as total_bonus  
	   from employee as e inner join salary as s 
	   on e.employee_id = s.employee_id
       group by e.employee_id , first_name , last_name
       order by Total_bonus desc;


-- or 

select e.employee_id , 
       concat(first_name , ' ' , last_name) as employee_name ,
       bonus as total_bonus  
	   from employee as e inner join salary as s 
	   on e.employee_id = s.employee_id
       group by e.employee_id , first_name , last_name , bonus
       order by Total_bonus desc;




-- 26.Find the Top 3 Employees with the Highest Net Salary in Each Department

With Top_three_employees_highest_salary_in_department AS(
                                       select e.department_id , 
                                              department_name , 
											   e.employee_id , 
											   concat(first_name , ' ' , last_name) as employee_name,
                                              s.salary , 
											   bonus , 
											   deduction , 
											   ((s.salary + bonus) - deduction) as Total_salary ,
                                               Rank() over(partition by e.department_id order by 
											   ((s.salary + bonus) - deduction) desc) 
											   as Rank_employee_salary_department
                                              from employee as e inner join department as d 
											   on e.department_id = d.department_id
                                              inner join salary as s on e.employee_id = s.employee_id 
											   order by Total_salary desc
											 
)

select * from Top_three_employees_highest_salary_in_department where Rank_employee_salary_department <=3;



-- or


With Top_three_employees_highest_salary_in_department AS(

                                               select e.department_id , 
											           department_name , 
													   e.employee_id , 
													   concat(first_name , ' ' , last_name) as employee_name,
                                                      s.salary ,
													   bonus , 
													   deduction , 
													   sum((s.salary + bonus) - deduction) as Total_salary ,
                                                      Rank() over(partition by e.department_id 
													   order by sum((s.salary + bonus) - deduction) desc) 
													   as Rank_employee_salary_department
                                                      from employee as e inner join department as d 
													   on e.department_id = d.department_id
                                                      inner join salary as s on e.employee_id = s.employee_id 
                                                      group by e.department_id , department_name , e.employee_id , s.salary , bonus , deduction)

select * from Top_three_employees_highest_salary_in_department where Rank_employee_salary_department <=3;



-- 27.Find the Employees Who Have Worked on More Than One Project Simultaneously


select e.employee_id , 
       concat(first_name , ' ', last_name) as employee_name , 
       count(ep.project_id) as no_of_projects
       from employee as e inner join employee_project as ep 
	   on e.employee_id = ep.employee_id

       where exists

      (select ep1.employee_id 
	          from employee_project as ep1  
			  where ep1.employee_id = e.employee_id 
              and ep1.project_id != ep.project_id and ep1.start_date < ep.end_date 
			  and ep1.end_date > ep.start_date)

      group by e.employee_id , first_name , last_name
      having count(ep.project_id) > 1


-- 28.Get the Department with the Highest Average Project Budget (Excluding Projects with Status 'Completed')

With Highest_avg_budget AS( 

                      select d.department_id , 
					         department_name , 
							  cast(avg(budget) AS decimal(10,2)) as avg_budget,
                             Rank() over(order by avg(budget) desc) as Rank_avg_budget
                             from department as d inner join project
                             as p on d.department_id = p.department_id
                             where status !='Completed'
                             group by d.department_id , department_name

)

select * from Highest_avg_budget where Rank_avg_budget <= 1;


-- or

select d.department_id , 
       department_name , 
	   cast(avg(budget) AS decimal(10,2)) as avg_budget 
       from department as d inner join project as p
       on d.department_id = p.department_id 
       where status != 'Completed'
       group by d.department_id , department_name
       order by avg_budget desc Limit 1;


-- 29.Find the Employees Who Have Never Been Present on Any Workday

select e.employee_id , 
       concat(first_name , ' ' , last_name) as employee_name ,
       count(
             case
				  WHEN status1 = 'Absent' THEN 1
			 END) AS No_of_days_absent

	   from employee as e inner join attendance as a
	   on  e.employee_id = a.employee_id
	   group by e.employee_id , first_name , last_name
	   having (count(
                     case
						  WHEN status1 = 'Absent' THEN 1
					  END)  <= (select count(*)  from generate_series(

						              '2023-01-10' :: Date ,
									  '2023-01-11' :: Date ,
									  '1 Day' :: Interval ) as Day

									   where extract(Dow from Day ) in (1,2,3,4,5)))

				and (count(
                           case
							    WHEN status1 = 'Absent' THEN 1
				     END) != 0 )

									 

-- 30.Find the Projects with the Most Employees Assigned and Their Total Salaries


select p.project_id , 
       project_name , 
	   count(e.employee_id) as No_of_employees,
       sum(s.salary + bonus) as Total_salary
       from project as p
       inner join employee as e on p.department_id = e.department_id
       inner join salary as s on e.employee_id = s.employee_id
       group by p.project_id , project_name
       order by No_of_employees desc , Total_salary;

