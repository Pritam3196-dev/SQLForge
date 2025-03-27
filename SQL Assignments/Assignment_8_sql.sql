-- Q-15. Write an SQL query to fetch intersecting records of two tables.

--( We have two tables bike and rental . bike contains bike data and rental contains bike and customer data which is rented . now we want to find
-- the bike and their customer )
 
 select b.bike_id , 
        model_name ,
		category ,
		c.customer_id , 
		customer_name , 
		total_paid 
		from bike as b 
		inner join rental as r on b.bike_id = r.bike_id
        inner join customer as c on r.customer_id = c.customer_id 
		order by r.customer_id asc; 
		
		
-- Q-16. Write an SQL query to show records from one table that another table does not have.


select * from table1 as t1 Left join table2 as t2 on t1.common_column = t2.common_column where t2.common_column is null;

-- (Here according to problem statment it want records which not available in other table so we put left join so left join work like it give common 
--  records from both table and uncommon / remaining records of left table so here we filter table2's common column is null means left  join is not
--  able to find common records from both table so it can't give common records then it give uncommon records of left table)
 
 
 -- or
 
 select * from table1 as t1 right join table2 as t2 on t1.common_column = t2.common_column where t1.common_column is null;