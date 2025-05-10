--- Create database Student_Management;

Create database Student_Management;

-- Use student_Management database

Use Student_Management;


-- Create table 

Create table user_login(

         User_id varchar(20) primary key ,
		 User_password varchar(20) ,
		 last_name varchar(20) ,
		 signed_up_on Date , 
		 email_id varchar(30))



Create table parent_details(


        Parent_id varchar(20) primary key ,
		fathers_first_name varchar(20),
		fathers_last_name varchar(20),
		fathers_email_id varchar(30),
		father_mobile_number varchar(10),
		fathers_occupation varchar(20),
		mothers_first_name varchar(20),
		mothers_last_name varchar(20),
		mothers_mobile_number varchar(10),
		mothers_occupation varchar(20))



Create table teacher(


              Teacher_id varchar(20) primary key,
			  first_name varchar(20),
			  last_name varchar(20),
			  Date_of_Birth Date ,
			  Email_Id varchar(30),
			  contact varchar(10),
			  registration_date Date ,
			  registration_id varchar(20))





Create table class_details(



               class_id  varchar(20) primary key,
			   class_teacher varchar(20),
			   class_year varchar(20) ,
			   foreign key (class_teacher) references teacher(Teacher_id))
			   



Create table student_details(



                  student_id varchar(20) primary key,
				  first_name varchar(20),
				  last_name varchar(20),
				  Date_of_Birth Date ,
				  class_id varchar(20),
				  roll_no varchar(20),
				  Email_id varchar(30),
				  parent_id varchar(20),
				  registration_date Date ,
				  registration_id varchar(20) unique ,
				  foreign key (class_id) references class_details(class_id),
				  foreign key (parent_id) references parent_details(parent_id))





Create table subject(


                 subject_id varchar(20) primary key,
				 subject_name varchar(20),
				 class_year varchar(20),
				 subject_head varchar(20),
				 foreign key (subject_head) references Teacher(Teacher_id))





Create table Tutors(


                  row_id serial primary key ,
				  subject_id varchar(20),
				  Teacher_id varchar(20),
				  class_id varchar(20),
				  foreign key (subject_id) references subject(subject_id),
				  foreign key (Teacher_id) references Teacher(Teacher_id),
				  foreign key (class_id) references class_details(class_id))





------- Insert data into table

Insert into user_login(user_id , user_password , last_name , signed_up_on , email_id)
             values

('user001', 'pass001', 'Sharma', '2024-01-01', 'user001@gmail.com'),
('user002', 'pass002', 'Khan', '2024-01-02', 'user002@gmail.com'),
('user003', 'pass003', 'Patel', '2024-01-03', 'user003@gmail.com'),
('user004', 'pass004', 'Mehra', '2024-01-04', 'user004@gmail.com'),
('user005', 'pass005', 'Reddy', '2024-01-05', 'user005@gmail.com'),
('user006', 'pass006', 'Joshi', '2024-01-06', 'user006@gmail.com'),
('user007', 'pass007', 'Nair', '2024-01-07', 'user007@gmail.com'),
('user008', 'pass008', 'Singh', '2024-01-08', 'user008@gmail.com'),
('user009', 'pass009', 'Verma', '2024-01-09', 'user009@gmail.com'),
('user010', 'pass010', 'Gupta', '2024-01-10', 'user010@gmail.com'),
('user011', 'pass011', 'Kapoor', '2024-01-11', 'user011@gmail.com'),
('user012', 'pass012', 'Chopra', '2024-01-12', 'user012@gmail.com'),
('user013', 'pass013', 'Bose', '2024-01-13', 'user013@gmail.com'),
('user014', 'pass014', 'Saxena', '2024-01-14', 'user014@gmail.com'),
('user015', 'pass015', 'Mishra', '2024-01-15', 'user015@gmail.com'),
('user016', 'pass016', 'Tripathi', '2024-01-16', 'user016@gmail.com'),
('user017', 'pass017', 'Bhatt', '2024-01-17', 'user017@gmail.com'),
('user018', 'pass018', 'Roy', '2024-01-18', 'user018@gmail.com'),
('user019', 'pass019', 'Dey', '2024-01-19', 'user019@gmail.com'),
('user020', 'pass020', 'Sen', '2024-01-20', 'user020@gmail.com');


-- Parent_details;

Insert into parent_details(parent_id , fathers_first_name , fathers_last_name , fathers_email_id , father_mobile_number , fathers_occupation , mothers_first_name , mothers_last_name , mothers_mobile_number , mothers_occupation )
values
('parent001', 'Raj', 'Sharma', 'raj.sharma@gmail.com', '9876500001', 'Engineer', 'Sunita', 'Sharma', '9876510001', 'Teacher'),
('parent002', 'Imran', 'Khan', 'imran.khan@gmail.com', '9876500002', 'Doctor', 'Saba', 'Khan', '9876510002', 'Lawyer'),
('parent003', 'Vikas', 'Patel', 'vikas.patel@gmail.com', '9876500003', 'Manager', 'Rina', 'Patel', '9876510003', 'Banker'),
('parent004', 'Rohan', 'Mehra', 'rohan.mehra@gmail.com', '9876500004', 'Architect', 'Pooja', 'Mehra', '9876510004', 'Designer'),
('parent005', 'Anil', 'Reddy', 'anil.reddy@gmail.com', '9876500005', 'Consultant', 'Kavita', 'Reddy', '9876510005', 'Homemaker'),
('parent006', 'Amit', 'Joshi', 'amit.joshi@gmail.com', '9876500006', 'Engineer', 'Sneha', 'Joshi', '9876510006', 'Teacher'),
('parent007', 'Suresh', 'Nair', 'suresh.nair@gmail.com', '9876500007', 'Pilot', 'Anita', 'Nair', '9876510007', 'Doctor'),
('parent008', 'Vikram', 'Singh', 'vikram.singh@gmail.com', '9876500008', 'Lawyer', 'Seema', 'Singh', '9876510008', 'Banker'),
('parent009', 'Ajay', 'Verma', 'ajay.verma@gmail.com', '9876500009', 'Teacher', 'Geeta', 'Verma', '9876510009', 'Nurse'),
('parent010', 'Sanjay', 'Gupta', 'sanjay.gupta@gmail.com', '9876500010', 'IT Professional', 'Neha', 'Gupta', '9876510010', 'Engineer'),
('parent011', 'Alok', 'Kapoor', 'alok.kapoor@gmail.com', '9876500011', 'Scientist', 'Kiran', 'Kapoor', '9876510011', 'Engineer'),
('parent012', 'Aditya', 'Chopra', 'aditya.chopra@gmail.com', '9876500012', 'Chef', 'Simran', 'Chopra', '9876510012', 'Artist'),
('parent013', 'Rajat', 'Bose', 'rajat.bose@gmail.com', '9876500013', 'Journalist', 'Neeta', 'Bose', '9876510013', 'Author'),
('parent014', 'Ravi', 'Saxena', 'ravi.saxena@gmail.com', '9876500014', 'Architect', 'Shruti', 'Saxena', '9876510014', 'Designer'),
('parent015', 'Naresh', 'Mishra', 'naresh.mishra@gmail.com', '9876500015', 'Electrician', 'Sonal', 'Mishra', '9876510015', 'Teacher'),
('parent016', 'Harish', 'Tripathi', 'harish.tripathi@gmail.com', '9876500016', 'Businessman', 'Manju', 'Tripathi', '9876510016', 'Manager'),
('parent017', 'Jatin', 'Bhatt', 'jatin.bhatt@gmail.com', '9876500017', 'Consultant', 'Namrata', 'Bhatt', '9876510017', 'HR'),
('parent018', 'Nikhil', 'Roy', 'nikhil.roy@gmail.com', '9876500018', 'Analyst', 'Riya', 'Roy', '9876510018', 'Consultant'),
('parent019', 'Suraj', 'Dey', 'suraj.dey@gmail.com', '9876500019', 'Trader', 'Tina', 'Dey', '9876510019', 'Homemaker'),
('parent020', 'Deepak', 'Sen', 'deepak.sen@gmail.com', '9876500020', 'Engineer', 'Priya', 'Sen', '9876510020', 'Banker');



-- Teacher Table


Insert into Teacher(teacher_id , first_name  , last_name , date_of_birth , email_id , contact , registration_date , registration_id)
values
('T001', 'Anita', 'Verma', '1985-05-20', 'anita.verma@school.com', '9876543101', '2022-06-10', 'REGT001'),
('T002', 'Vikram', 'Singh', '1979-12-10', 'vikram.singh@school.com', '9876543102', '2023-01-15', 'REGT002'),
('T003', 'Meera', 'Patel', '1990-03-08', 'meera.patel@school.com', '9876543103', '2024-03-05', 'REGT003'),
('T004', 'Suresh', 'Nair', '1982-07-22', 'suresh.nair@school.com', '9876543104', '2022-11-20', 'REGT004'),
('T005', 'Kiran', 'Joshi', '1988-10-05', 'kiran.joshi@school.com', '9876543105', '2023-05-25', 'REGT005');



-- Class_details


Insert into class_details(class_id , class_teacher , class_year)
values
('C001', 'T001', '2024'),
('C002', 'T002', '2024'),
('C003', 'T003', '2024'),
('C004', 'T004', '2024'),
('C005', 'T005', '2024');



-- student_details;

Insert into student_details(student_id , first_name , last_name , date_of_birth , class_id , roll_no , email_id , parent_id , registration_date , registration_id)
values
('S001', 'Aarav', 'Sharma', '2010-08-15', 'C001', '101', 'aarav.sharma@student.com', 'parent001', '2024-01-10', 'REGS001'),
('S002', 'Sara', 'Khan', '2011-03-20', 'C002', '102', 'sara.khan@student.com', 'parent002', '2024-01-11', 'REGS002'),
('S003', 'Rohan', 'Patel', '2010-11-30', 'C003', '103', 'rohan.patel@student.com', 'parent003', '2024-01-12', 'REGS003'),
('S004', 'Isha', 'Mehra', '2011-05-12', 'C004', '104', 'isha.mehra@student.com', 'parent004', '2024-01-13', 'REGS004'),
('S005', 'Neha', 'Reddy', '2010-09-25', 'C005', '105', 'neha.reddy@student.com', 'parent005', '2024-01-14', 'REGS005'),
('S006', 'Vivaan', 'Joshi', '2011-04-11', 'C001', '106', 'vivaan.joshi@student.com', 'parent006', '2024-01-15', 'REGS006'),
('S007', 'Sai', 'Nair', '2010-10-30', 'C002', '107', 'sai.nair@student.com', 'parent007', '2024-01-16', 'REGS007'),
('S008', 'Aditya', 'Singh', '2011-02-17', 'C003', '108', 'aditya.singh@student.com', 'parent008', '2024-01-17', 'REGS008'),
('S009', 'Anaya', 'Verma', '2010-07-08', 'C004', '109', 'anaya.verma@student.com', 'parent009', '2024-01-18', 'REGS009'),
('S010', 'Riya', 'Gupta', '2011-12-22', 'C005', '110', 'riya.gupta@student.com', 'parent010', '2024-01-19', 'REGS010'),
('S011', 'Krishna', 'Kapoor', '2011-08-01', 'C001', '111', 'krishna.kapoor@student.com', 'parent011', '2024-01-20', 'REGS011'),
('S012', 'Reyansh', 'Chopra', '2010-06-10', 'C002', '112', 'reyansh.chopra@student.com', 'parent012', '2024-01-21', 'REGS012'),
('S013', 'Navya', 'Bose', '2011-01-19', 'C003', '113', 'navya.bose@student.com', 'parent013', '2024-01-22', 'REGS013'),
('S014', 'Ayaan', 'Saxena', '2010-04-30', 'C004', '114', 'ayaan.saxena@student.com', 'parent014', '2024-01-23', 'REGS014'),
('S015', 'Myra', 'Mishra', '2011-09-17', 'C005', '115', 'myra.mishra@student.com', 'parent015', '2024-01-24', 'REGS015'),
('S016', 'Aarohi', 'Tripathi', '2010-12-03', 'C001', '116', 'aarohi.tripathi@student.com', 'parent016', '2024-01-25', 'REGS016'),
('S017', 'Diya', 'Bhatt', '2011-06-14', 'C002', '117', 'diya.bhatt@student.com', 'parent017', '2024-01-26', 'REGS017'),
('S018', 'Ishaan', 'Roy', '2010-03-07', 'C003', '118', 'ishaan.roy@student.com', 'parent018', '2024-01-27', 'REGS018'),
('S019', 'Saanvi', 'Dey', '2011-11-09', 'C004', '119', 'saanvi.dey@student.com', 'parent019', '2024-01-28', 'REGS019'),
('S020', 'Vihaan', 'Sen', '2010-01-25', 'C005', '120', 'vihaan.sen@student.com', 'parent020', '2024-01-29', 'REGS020');


-- Subject table


Insert into subject(subject_id , subject_name , class_year , subject_head)
values

('SUB001', 'Mathematics', '2024', 'T001'),
('SUB002', 'Science', '2024', 'T002'),
('SUB003', 'English', '2024', 'T003'),
('SUB004', 'Social Studies', '2024', 'T004'),
('SUB005', 'Hindi', '2024', 'T005'),
('SUB006', 'Computer', '2024', 'T001'),
('SUB007', 'Physics', '2024', 'T002'),
('SUB008', 'Chemistry', '2024', 'T003'),
('SUB009', 'Biology', '2024', 'T004'),
('SUB010', 'Geography', '2024', 'T005');



-- Tutor Table

Insert into Tutors(row_id , subject_id , teacher_id , class_id)
values
(1, 'SUB001', 'T001', 'C001'),
(2, 'SUB002', 'T002', 'C002'),
(3, 'SUB003', 'T003', 'C003'),
(4, 'SUB004', 'T004', 'C004'),
(5, 'SUB005', 'T005', 'C005'),
(6, 'SUB006', 'T001', 'C002'),
(7, 'SUB007', 'T002', 'C003'),
(8, 'SUB008', 'T003', 'C004'),
(9, 'SUB009', 'T004', 'C005'),
(10, 'SUB010', 'T005', 'C001'),
(11, 'SUB001', 'T001', 'C003'),
(12, 'SUB002', 'T002', 'C004'),
(13, 'SUB003', 'T003', 'C005'),
(14, 'SUB004', 'T004', 'C001'),
(15, 'SUB005', 'T005', 'C002'),
(16, 'SUB006', 'T001', 'C004'),
(17, 'SUB007', 'T002', 'C005'),
(18, 'SUB008', 'T003', 'C001'),
(19, 'SUB009', 'T004', 'C002'),
(20, 'SUB010', 'T005', 'C003');


--- Sql queries 


-- 1.Get all students names with their class IDs

select concat(first_name , ' ' , last_name) as student_name , 
       class_id 
	   from student_details;



-- 2.List all teachers and their emails

select teacher_id , concat(first_name , ' ' , last_name) as full_name , email_id from Teacher;


-- 3.Find students born after 2010:

select * from student_details where extract(Year from date_of_birth) > 2010;


-- 4.Get student name along with their class teacher's name

select * 
        from student_details as sd 
		inner join class_details as cd 
		on sd.class_id = cd.class_id
        inner join Teacher as t on cd.class_teacher = t.teacher_id;


-- 5.Get subjects along with their subject head name

select subject_id , 
       subject_name , 
	   s.subject_head , 
	   concat(first_name , ' ' , last_name) as subject_head_name
	   from subject as s inner join teacher as t
	   on s.subject_head = t.teacher_id;


-- 6.List students with their parents’ names and mobile numbers:


select student_id  , 
       concat(first_name , '  ' , last_name) as student_name ,
       pd.parent_id , 
	   concat(fathers_first_name , ' ' ,fathers_last_name) as father_name , 
	   father_mobile_number ,
       concat(mothers_first_name , ' ' , mothers_last_name) as mother_name  , 
	   mothers_mobile_number
       from student_details as sd 
	   inner join parent_details as pd 
	   on sd.parent_id = pd.parent_id;


-- 7.List all classes with their teacher names

select * 
       from class_details as cd 
	   inner join teacher as t 
	   on cd.class_teacher = t.teacher_id;


-- 8.Count the number of students in each class:

select cd.class_id , 
       count(student_id) as No_of_students 
	   from class_details as cd 
	   inner join student_details as sd 
	   on cd.class_id = sd.class_id
	   group by cd.class_id;

-- 9.Count how many subjects each teacher is head of


select subject_head , 
       count(subject_id) as no_of_subjects 
	   from subject group by subject_head;


-- 10.Find the total number of teachers, students, and parents

select
(select count(teacher_id) from teacher) as No_of_Teachers ,
(select count(student_id) from student_details) as No_of_students ,
(select count(parent_id) from parent_details) as No_of_parents;



-- 11.Find students whose parents are doctors


select * from student_details as sd inner join parent_details as pd on sd.parent_id = pd.parent_id
where fathers_occupation = 'Doctor' or Mothers_occupation = 'Doctor';

-- or 

select * from student_details as sd inner join parent_details as pd on sd.parent_id = pd.parent_id
where sd.parent_id in 
(
select parent_id from parent_details where fathers_occupation = 'Doctor' or
mothers_occupation = 'Doctor' );


-- 12.List classes that have more than 4 students;


select cd.class_id , 
       count(student_id) as No_of_students 
	   from class_details as cd 
	   inner join student_details 
       as sd on cd.class_id = sd.class_id 
	   group by cd.class_id 
	   having count(student_id) > 4;



-- 13.Find teachers who teach more than 2 subjects (from Tutors table):


select teacher_id , 
       count(subject_id) as No_of_subject_id 
	   from tutors 
	   group by teacher_id
       having count(subject_id) > 2;




-- 14.List students along with all subjects they are taught


select student_id , concat(first_name , ' ' , last_name) as student_name ,
       sd.class_id ,
       s.subject_id , 
	   subject_name 
       from student_details as sd 
	   inner join Tutors as t
	   on sd. class_id = t.class_id
	   inner join subject as s on t.subject_id = s.subject_id
	   order by subject_id;


-- 15.List classes and the number of distinct subjects taught in each;


select t.class_id , 
       count(distinct(subject_id)) as No_of_subjects 
	   from class_details as cd 
	   inner join tutors as t 
       on cd.class_id = t.class_id 
	   group by t.class_id;



-- 16.Show which teacher is teaching which subject in which class

select t.Teacher_id , 
       concat(first_name , ' ' , last_name) as Teacher_name , 
       t.subject_id , 
	   subject_name , 
	   class_id
       from Teacher as tc 
	   inner join tutors as t 
	   on tc.Teacher_id = t.Teacher_id
       inner join subject as s 
	   on t.subject_id = s.subject_id 
	   order by t.Teacher_id asc;



-- 17.Find the oldest teacher (by date of birth):

select * , 
       Age(now() ,(select max(Date_of_birth) from Teacher) ) as Age 
	   from Teacher 
	   where Date_of_birth = (select max(Date_of_birth) from Teacher);


-- or 

select Teacher_id , 
       first_name  ,  
	   last_name , 
	   date_of_birth 
	   from teacher 
	   order by date_of_birth desc Limit 1;


-- 18.List students who don’t have an email ID (if allowed NULL):

select * from student_details where email_id is null;

-- 19.List students who registered in 2024

select * from student_details where Extract(Year from registration_date) = 2024;


-- 20.Find users who signed up in the last 30 days


select * from user_login where signed_up_on between cast(now() AS Date) - 30 and cast(now() AS date);


-- or 


select * from user_login where signed_up_on between current_date  - Interval '30 days' and current_date;


-- 21.Find duplicate registration IDs (should return nothing)

select registration_id , count(registration_id) as No_of_times_registration_id from student_details 
group by registration_id having count(registration_id) > 1;


-- 22.Check if any student has a parent_id that doesn’t exist

select * from student_details where parent_id is null;


-- 23.Check for any orphan classes without a valid class_teacher


select * from class_details where class_teacher is null;


-- 24.List all parent emails and count of children they have 

select sd.parent_id , fathers_email_id , count(student_id) as No_of_children
from student_details as sd inner join parent_details as pd on sd.parent_id = pd.parent_id
group by sd.parent_id , fathers_email_id;

-- 25.Get all students taught by a specific teacher (e.g., T001):

select * from student_details as sd inner join tutors as t on sd.class_id = t.class_id where teacher_id in
(select Teacher_id from student_details as sd inner join tutors as t 
on sd.class_id = t.class_id group by Teacher_id
having count(distinct(sd.student_id)) = (select count(distinct(student_id)) from student_details));


-- 26.Find the top 3 students with the highest roll numbers in each class.

With Top_three_roll_numbers_in_each_class AS(

select student_id , 
       concat(first_name , ' ' , last_name) as student_name , 
	   class_id , 
	   roll_no ,
       Dense_Rank() over(partition by class_id order by roll_no desc) as Rank_roll_no
       from student_details 
	   group by student_id , 
	   concat(first_name , ' ' , last_name) , 
	   class_id , 
	   roll_no

)

select * from Top_three_roll_numbers_in_each_class where Rank_roll_no <= 3;



-- 27.Find the students who are ranked in the top 5 in terms of their registration date (earliest registered).


With Top_five_registration_students AS(

select * ,
Dense_Rank() over(order by registration_date asc) as Rank_students
from student_details

)


select * from Top_five_registration_students where Rank_students <= 5;



-- 28.Rank the teachers based on the number of subjects they are teaching, and display only 
-- those with the top 3 ranks.

With Teachers_teach_no_of_subjects AS(

select t.teacher_id , count(s.subject_id) ,
Dense_Rank() over(order by count(s.subject_id) desc) as Rank_Teacher
from tutors as t inner join subject as s on t.subject_id = s.subject_id
group by t.teacher_id

)

select * from Teachers_teach_no_of_subjects where Rank_Teacher <= 3;


-- 29.Find the students who have a unique roll number in each class and rank them within 
-- their class by their roll number.

select student_id , count(distinct roll_no) , 
       Dense_Rank() over(partition by student_id order by count(distinct roll_no)) as Rank_student_id
from student_details group by student_id;



-- or 



select student_id , count(distinct roll_no) , 
       Dense_Rank() over(partition by class_id order by count(distinct roll_no)) as Rank_student_id
from student_details group by student_id;