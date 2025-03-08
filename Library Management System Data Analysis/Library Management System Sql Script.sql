-- Create Database 

Create Database Library ;


-- Use Library database

use library;


-- Creating Tables

-- Books Table

Create table Books(
        
	 	  BookID INT IDENTITY(1,1) PRIMARY KEY,
          Title VARCHAR(255) not null,
          Author varchar(100),
		  Genre varchar(50),
          PublishedYear int,
          CopiesAvailable INT Default 1);


-- Members Table

Create table Members(

         MemberID int IDENTITY(1,1) primary key ,
		 Name varchar(100) not null,
		 Email varchar(100) , 
		 PhoneNumber varchar(15) , 
		 JoinDate Date Default GETDATE()); 


-- Borrowhistory Table


Create table BorrowHistory(
      
	     BorrowID int Identity(1,1) primary key ,
		 BookID int ,
		 MemberID int , 
		 BorrowDate Date ,
		 ReturnDate Date ,
		 foreign key (BookID) references Books(BookID),
		 foreign key (MemberID) references Members(MemberID));


--- Insert Data into Books Table 

Insert into Books(Title , Author , Genre , PublishedYear , CopiesAvailable)
            values('The great mall','scott','fiction',1988, 3),
			      ('horror house','george','fiction',1942,4),
				  ('to kill someone','lee','classic',2001,6),
				  ('the catcher','dharma','fiction',2010,2);


--- Insert data into Members table


Insert into Members(Name , Email , PhoneNumber , JoinDate)
            values('KRISHNA' , 'krishna@gmail.com' , 9185632566, '2010-06-15'),
			      ('Pranay' ,'Pranay25@gmail.com' , 9156785623,'2020-05-11'),
				  ('Sujoy' , 'Sujoy2@gmail.com',9189455623,'2021-06-13');


-- Insert into BorrowHistory 

Insert into BorrowHistory(BookID,MemberID,BorrowDate,ReturnDate)
            values(1,3,'2023-05-12','2023-05-20'),
			      (3,2,'2024-04-15','2024-04-29'),
				  (2,1,'2024-04-12','2024-06-12');


-- After Insertion of Data check once how data is look like

select * from books;
select * from members;
select * from Borrowhistory;


------ Data Analysis 


-- 1.View all Books

select * from books;

-- 2.Find the books by its genre(Give fiction Genre Books)

select BookID , 
       title , 
	   Author 
	   from  books where Genre = 'fiction';


-- 3.Find the members who borrowed books(along with titles of books);

select m.memberID ,
       Name as MemberName,
	   Title as book_title,
	   Email,
	   PhoneNumber,
       BorrowDate , 
	   ReturnDate from borrowhistory as b inner join members as m 
	   on b.memberID = m.memberID 
	   inner join Books as bk on b.BookID = bk.BookID
	   order by memberID asc;


-- 4.We have check the books with low availability


select BookID , 
       Title , 
	   copiesavailable 
	   from books where copiesavailable < 3
       order by copiesavailable desc ;


-- 5.Update books copies of 'the catcher' by 1;

Update Books set copiesavailable = copiesavailable - 1  
       where Title = 'the catcher';


-- 6.Delete member 5;

delete from borrowhistory where memberID = 1;  

delete from members where memberID = 1;

      -- memberID is primary key in members table so it can not be delete directly so 
	  -- first we should be deleted from froreign key table like here borrowhisory table
	  -- After delete from foreign key table (borrowhistory) then we can delete from members(primary key table) table


-- 7.Find the overdue books;

select bk.bookID , 
       Title , 
	   M.memberID , 
	   Name  as MemberName,
	   BorrowDate , 
	   ReturnDate , 
	   Cast(GETDATE() AS Date) as Todays_Date,
	   Datediff(day , Cast(BorrowDate AS Date) , cast(returndate AS Date)) as No_of_days_book_not_Returned
	   from books as bk inner join borrowhistory as b on bk.bookID = b.bookID
       inner join members as m on b.memberID = m.memberID
       where (returnDate is Null and (Datediff(day , cast(GETDATE() AS Date) ,BorrowDate)) > 7) -- when ReturnDate is null as well difference R and Current date > 7
	         or (returnDate is not null and Datediff(day , cast(borrowDate AS Date) , cast(ReturnDate AS Date)) > 7);   -- when returndate  and borrowdate difference is greater than 7;




-- 8.Find all books that have been borrowed at least once.

select bk.bookID , 
       Title , 
	   count(borrowID) as No_of_Times_Book_borrow 
	   from books as bk inner join borrowhistory as b
       on bk.bookID = b.bookID 
	   group by bk.bookID , Title 
	   having count(borrowID) >= 1
       order by bk.bookID;


-- 9.Find the number of books each member has borrowed.


select m.MemberID ,
       Name as membername,
       count(bookID) as No_of_books_each_member_borrowed  
	   from borrowhistory as b inner join Members as m on m.memberID = b.memberID
       group by m.MemberID , Name
	   order by No_of_books_each_member_borrowed desc;


-- 10.Find the member who has borrowed the most books.

select TOP 1 b.MemberID , 
             Name as memberName , 
			 count(b.bookID) as No_of_books 
			 from borrowhistory as b inner join members as m
             on b.MemberID = m.MemberID 
			 group by b.MemberID , Name 
			 order by No_of_books desc;

-- or 

With member_borrowed_most_books AS(

                              select b.memberID , 
							         Name as membername , 
									 count(b.bookID) as No_of_books,
                                     Dense_Rank() over(order by count(b.bookID) desc) as Dense_Rank_no_of_books
                                     from borrowhistory as b inner join members as m 
									 on b.memberID = m.memberID group by b.memberID , Name 

             )

select * from member_borrowed_most_books where Dense_Rank_no_of_books <= 1;


-- 11.Find books that have not been borrowed (i.e., books with no entries in the BorrowHistory table).

select bookID , 
       Title 
	   from books where bookID not in (
                        select b.bookID from books as bk inner join borrowhistory as b on bk.bookID = b.bookID 
						group by b.bookID);


-- 12.Most borrowed book

select Top 1 bk.bookID , 
             Title , 
	         count(borrowID) as No_of_times 
	         from borrowhistory as b inner join books as bk on bk.bookID = b.bookID 
             group by bk.bookID , Title 
             order by no_of_times desc;  
			 
-- or

With Most_borrowed_book AS (

                            select b.bookID , 
							       Title , 
								   count(borrowID) as No_of_times_borrow_book,
                                   Dense_Rank() over(order by count(borrowID) desc) as dense_Rank_on_borrow_books
                                   from borrowhistory as bk inner join books as b 
								   on bk.bookID = b.bookID
                                   group by b.bookID , Title

)

select * from Most_borrowed_book where Dense_Rank_on_borrow_books <= 1;


-- Insert more data for more analysis

Insert into Books (Title , Author , Genre , PublishedYear , CopiesAvailable)
            values('The Silent Wave', 'Mira', 'Mystery', 2015, 5),
                  ('Journey to the Stars', 'Maxwell', 'Sci-Fi', 2018, 7),
                  ('The Lost City', 'Samuel', 'Adventure', 1995, 4),
                  ('Moonlit Dreams', 'Ava', 'Romance', 2020, 6),
                  ('Into the Depths', 'Ravi', 'Thriller', 2017, 8),
                  ('A Walk in the Park', 'Emily', 'Drama', 2010, 5),
                  ('The Ancient Path', 'Raj', 'Historical Fiction', 2002, 4),
                  ('The Golden Hour', 'Parker', 'Mystery', 2021, 6),
                  ('The Dark Abyss', 'Claire', 'Horror', 2016, 3),
                  ('The Final Countdown', 'Timothy', 'Sci-Fi', 2019, 2),
                  ('The Return of the King', 'J.R.R. Tolkien', 'Fantasy', 2003, 10),
                  ('Beyond the Horizon', 'Sophia', 'Adventure', 2022, 5),
                  ('Silent Whispers', 'Oliver', 'Romance', 2014, 7),
                  ('The Road Less Traveled', 'Robert Frost', 'Poetry', 1999, 2);


insert into Members(Name , Email , PhoneNumber , JoinDate)
            values('Aditi', 'aditi@gmail.com', '9173627584', '2022-02-01'),
                  ('Vikram', 'vikram@yahoo.com', '9164758390', '2023-01-18'),
                  ('Nina', 'nina@gmail.com', '9198527689', '2024-03-04'),
                  ('Rajesh', 'rajesh@yahoo.com', '9167452387', '2019-08-10'),
                  ('Sneha', 'sneha@outlook.com', '9182458374', '2020-06-30'),
                  ('Ananya', 'ananya@gmail.com', '9123475678', '2021-11-25'),
                  ('Sidharth', 'sidharth@live.com', '9134567890', '2018-12-15'),
                  ('Maya', 'maya@yahoo.com', '9145678901', '2022-05-03'),
                  ('Ankush', 'ankush@gmail.com', '9198765432', '2020-09-20'),
                  ('Priya', 'priya@outlook.com', '9209876543', '2021-04-15'),
                  ('Neha', 'neha@gmail.com', '9198965432', '2023-02-10'),
                  ('Karthik', 'karthik@gmail.com', '9162345789', '2024-03-10');



insert into Borrowhistory(BookID , MemberID , BorrowDate , ReturnDate)
            values(1, 4, '2024-01-10', '2024-01-20'),
                  (2, 5, '2024-02-15', '2024-03-01'),
                  (3, 6, '2024-03-10', '2024-03-20'),
                  (4, 1, '2024-03-12', '2024-03-22'),
                  (1, 2, '2024-04-01', '2024-04-15'),
                  (3, 3, '2024-04-18', '2024-05-02'),
                  (5, 7, '2024-01-05', '2024-01-15'),
                  (6, 8, '2024-03-10', '2024-03-20'),
                  (7, 9, '2024-02-18', '2024-03-01'),
                  (8, 10, '2024-04-05', '2024-04-18'),
                  (9, 11, '2024-01-10', '2024-01-25'),
                  (10, 12, '2024-02-15', '2024-03-01'),
                  (2, 5, '2024-04-01', '2024-04-10'),
                  (11, 6, '2024-03-01', '2024-03-15'),
                  (12, 7, '2024-03-10', '2024-03-30'),
                  (13, 3, '2024-02-20', '2024-03-05'),
                  (14, 4, '2024-01-12', '2024-01-25'),
                  (1, 8, '2024-03-25', '2024-04-05'),
                  (5, 9, '2024-03-12', '2024-03-30');



-- 13.Update the availability of a book when it is returned.(for bookID  = 10)


Update Books set CopiesAvailable = CopiesAvailable + 1 where bookID = 10;


-- 14.Find books that are currently borrowed


select * from borrowhistory where ReturnDate is Null;


-- 15.List all books borrowed by a specific member


select * from borrowhistory where MemberID in 
                         (select memberID from members where memberID = 3);


-- 16.Find the total number of books borrowed within a specific date range (e.g., between '2024-01-01' and '2024-04-01').**


select * from borrowhistory where BorrowDate in  
                (select BorrowDate from borrowhistory where BorrowDate between '2024-01-01' and '2024-04-01');


-- 17.Display the number of books available in each genre.

select Genre , 
       count(bookID) as No_of_books_in_Genre 
	   from books 
       group by Genre 
	   order by No_of_books_in_genre desc;


-- 18.Find the books borrowed by a member in a specific time period


select b.bookID , 
       Title , 
	   b.MemberID , 
	   Name as MemberName from borrowhistory as b inner join Members as M 
	   on b.MemberID = M.MemberID
	   inner join books as bk on bk.bookID = b.bookID
       where b.MemberID = 9 and borrowDate between '2024-01-01' and '2024-05-01';


-- 19.List all members who have borrowed a specific book

select M.MemberID , 
       Name as MemberName , 
	   b.bookID , 
	   Title  from borrowhistory as b inner join members as m 
       on b.MemberID = m.MemberID 
       inner join books as bk on b.bookID = bk.bookID
       where b.bookID = (select bookID from books where bookID = 1);


-- 20.Check for books that have low availability (less than 3 copies left).

select bookID , 
       Title,
       sum(copiesAvailable) as No_of_Copies_Available
	   from books group by bookID , Title having sum(CopiesAvailable) <= 3;

-- or 

select bookID , 
       Title ,
       CopiesAvailable 
	   from books 
	   where copiesAvailable <= 3 
	   group by bookID , Title , CopiesAvailable;


-- 21.Delete a book from the library (if it's not borrowed).

Delete from books where bookID in 
       (select bookID from books where bookID not in (select bookID from borrowhistory));


-- 22.List all books borrowed by a member along with their overdue days(if any).

select b.MemberID , 
       Name as Membername ,
	   b.BookID , 
	   Title , 
	   BorrowDate , 
	   ReturnDate  
	   from borrowhistory as b inner join books as bk
       on b.bookID = bk.bookID 
       inner join Members as m on M.memberID = b.MemberID
       where b.MemberID = 3 and (
       (ReturnDate is Null and Datediff(Day , cast(BorrowDate AS Date) , cast(Returndate AS Date)) > 7)
        or
       (ReturnDate is not null and Datediff(Day , Cast(BorrowDate AS Date) , cast(ReturnDate AS Date)) > 7))
        group by b.MemberID , Name , b.BookID , Title , BorrowDate , ReturnDate;



-- 23.Update the member's email address.

Update members set email ='maya16@gmail.com'  where memberID = 11;


-- 24.Find all members who joined after a certain date

select memberID , 
       Name as MemberName, 
	   Email, 
	   joinDate 
	   from members where joindate > '2021-01-01';

-- 25.Count the total number of members in the library.

select count(memberID) as No_of_members from members;