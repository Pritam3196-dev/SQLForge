Use EMP_ETL;


select * from EMP_DTS_SRC1;



select 
       Case
	       WHEN EMP_GENDER = 'Female' THEN 'F'
		END   AS EMP_GENDER
		from EMP_DTS_SRC1 where EMP_GENDER = 'Female'
EXCEPT
select EMP_GENDER from EMP_DTS_TRG;





--- Unknown -----> unknown



select  
       Case
	       WHEN EMP_GENDER = 'Unknown' THEN 'Unknown'
		END AS EMP_GENDER
		from EMP_DTS_SRC1 where EMP_GENDER = 'Unknown'

EXCEPT

select EMP_GENDER from EMP_DTS_TRG;




--- NULLL -----> Unknown

select
       case 
	        WHEN EMP_GENDER = 'NULL' THEN 'Unknown'
		END AS EMP_GENDER
		from EMP_DTS_SRC1 where EMP_GENDER = 'NULL'
EXCEPT
select EMP_GENDER from EMP_DTS_TRG;





--- Derived transformation


select * from EMP_DTS_TRG;


select Datediff(Year , HIRE_DATE , GETDATE()) as Total_EXP from EMP_DTS_TRG;


-- When Hire is in past years;
select Datediff(Year , HIRE_DATE , GETDATE()) AS Total_EXP from EMP_DTS_TRG where Year(HIRE_DATE) < YEAR(GETDATE());


-- when Hire Date is in same years


select Datediff(Year , Hire_Date , Getdate()) AS Total_EXP from EMP_DTS_TRG where year(Hire_Date) = year(Getdate());


-- When hire date is in future(2025)


select datediff(Year , Hire_date , GETDATE()) AS Total_EXP from EMP_DTS_TRG where Year(Hire_Date) > Year(GETDATE());


--- Check Referance Table Name;


select Reference_table from EMP_DTS_TRG;

select ETLUpdateTime from EMP_DTS_TRG;


