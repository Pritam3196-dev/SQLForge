----- Advance Set


/* Q1: Find how much amount spent by each customer on most sell artist? Write a query to 
return customer name, artist name and total spent */

with Most_sell_artist AS (

             select a.artist_id , 
			        a.name  , 
					sum(il.unit_price * quantity) as Sell_price
					from artist as a
					inner join 
					album as ab
					on a.artist_id = ab.artist_id
					inner join track as t
					on ab.album_id = t.album_id
					inner join invoice_line as il
					on t.track_id = il.track_id
					inner join invoice as i
					on il.invoice_id = i.invoice_id
					inner join customer as c
					on i.customer_id = c.customer_id
					group by a.artist_id , a.name
					order by sell_price desc 
					Limit 1

)


select c.customer_id , 
       first_name , 
	   last_name,
	   country , 
	   m.artist_id , 
	   m.name as Artist_name,
	   sum(il.unit_price * quantity) as Total_spent_on_most_sell_artist
	   from customer as c
	   inner join invoice as i
	   on c.customer_id = i.customer_id
	   inner join invoice_line as il
	   on i.invoice_id = il.invoice_id
	   inner join track as t
	   on il.track_id = t.track_id
	   inner join album as ab
	   on t.album_id = ab.album_id
	   inner join Most_sell_artist as m
	   on ab.artist_id = m.artist_id
	   group by c.customer_id , first_name , last_name , country , m.artist_id , m.name
	   order by Total_spent_on_most_sell_artist desc;




/* Q2: We want to find out the most popular music Genre for each country. We determine the most 
popular genre as the genre with the highest amount of purchases. Write a query that 
returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres. */


-- most poppular music genre for each country (we decide that genre purchase how much time)
-- most poppular genre means most time quantity of genre 


--- first we will make CTE of genre_of_each_country

with Genre_of_each_country AS (
        select billing_country,
		       g.genre_id,
			   g.name as genre_name,
		       count(quantity) as No_of_purchases_genre_for_country ,
			   Rank() over (partition by billing_country order by count(quantity) desc)
			   as Rank_count
		       from invoice as i
			   inner join invoice_line as il
			   on i.invoice_id = il.invoice_id
			   inner join track as t
			   on il.track_id = t.track_id
			   inner join genre as g
			   on t.genre_id = g.genre_id
			   group by billing_country , genre_name , g.genre_id
			   order by billing_country
)


select  * from Genre_of_each_country where rank_count <=1 ;
		
	   

/* Q3: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */


-- customer spent most on music of each country
--- country , top customer , total    (top customer who paid most in country)

-- First we find most_spent_customer

with spent_customer_each_country AS (
                             select c.customer_id , 
							         billing_country,
							         sum(total) as Total_spent,
							         first_name , 
									 last_name ,
									 Rank() over(partition by billing_country order by sum(total) desc)
									 as Rank_customer
									 from customer as c
									 inner join invoice as i
									 on c.customer_id = i.customer_id
									 group by c.customer_id,first_name , last_name,billing_country
									 order by  total_spent desc
									 
							 
)

select * from  spent_customer_each_country where Rank_customer <= 1;





/* Question Set 2 - Moderate */

/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */


select * from genre;

with Rock_music_listeners AS ( 

			      select c.customer_id ,
				         first_name ,
						 last_name ,
						 email,
						 g.name
						 from customer as c
						 inner join invoice as i
						 on c.customer_id = i.customer_id
						 inner join invoice_line as il
						 on i.invoice_id = il.invoice_id
						 inner join track as t
						 on il.track_id = t.track_id
						 inner join genre as g
						 on t.genre_id = g.genre_id
						 where g.genre_id = (select genre_id from genre where name = 'Rock')
						 group by c.customer_id , first_name , last_name , email , g.name
						 order by email asc

)

select * from Rock_music_listeners;


/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */


with Top_10_rock_bands AS (

                 select a.artist_id ,
				        a.name as Name_of_artist ,
						count(g.genre_id) as count_rock_songs
						from artist as a
						inner join album as ab
						on a.artist_id = ab.artist_id
						inner join track as t
						on ab.album_id = t.album_id
						inner join genre as g
						on t.genre_id = g.genre_id
						where g.genre_id = (select genre_id from genre where name = 'Rock')
						group by a.artist_id , a.name
						order by count_rock_songs desc
						Limit 10
)


select * from Top_10_rock_bands;



/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */



with longest_songs_than_avg_length AS (

                          select  track_id ,
						          name as track_name,
								  milliseconds as Length_of_song
								  from track
								  where milliseconds > (select avg(milliseconds) from track)
								  order by Length_of_song desc

)

select * from longest_songs_than_avg_length;
								  


/*	Question Set 1 - Easy */

/* Q1: Who is the senior most employee based on job title? */


select * from employee where levels = (select max(levels) from employee);


/* Q2: Which countries have the most Invoices? */

select billing_country , 
       count(invoice_id) as count_of_invoice from invoice 
       group by billing_country 
	   order by count_of_invoice desc;


/* Q3: What are top 3 values of total invoice? */


select total 
       from invoice 
       order by total 
	   desc Limit 3;

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in
the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals.  */


select billing_city,
       sum(total) as Total_spent_city
       from invoice 
	   group by billing_city
	   order by Total_spent_city desc
	   Limit 1;


