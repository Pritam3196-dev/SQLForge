-- Q-13. Write an SQL query to show only odd rows from a table.

With Employee_table AS(

                     select * , 
					        Row_number() over(order by id asc) as Row_number_ 
							from employee
							
)

select * from Employee_table where Row_number_ % 2 != 0;


-- Q-14. Write an SQL query to clone a new table from another table.

Create table new_table AS
      select * from old_table ;