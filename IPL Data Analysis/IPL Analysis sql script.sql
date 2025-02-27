------ Create table ipl_matches_2008_2022;

----- This Table contains IPL Matches from 2008 to 2022 . so for everytime write table name to lenthy
-- we just make that table name is from ipl_matches_2008_2022 to ipl_matches

create table ipl_matches

    (id	 int primary key , 
	 city varchar(50) , 
	 match_date Date , 
	 season	varchar(50) , 
	 match_number varchar(50),
	 team1 varchar(50),
	 team2 varchar(50) ,
	 venue varchar(100),
	 toss_winner varchar(50),
	 toss_decision varchar(10),
	 superover varchar(5) , 
	 winning_team varchar(50),
	 won_by varchar(15),
	 margin varchar(10) ,
	 method varchar(5) , 
	 player_of_match varchar(30) , 
	 umpire1 varchar(30),
	 umpire2 varchar(30));


--Insert the data from local system to table

copy ipl_matches from 'C:\\Users\\Lenovo\\Downloads\\ipl_matches_2008_2022.csv' 
DELIMITER ',' CSV HEADER;

select * from ipl_matches;




-- Create Table ipl_ball_by_ball_2008_2022;

-- Again we samething doing here , it contains data of ball by from 2008 to 2022 . so to avoid
-- lengthy name we give ball_by_ball name from ipl_ball_by_ball_2008_2022;

create table ball_by_ball(
         id int  ,
		 innings int ,
		 overs int , 
		 ball_number int , 
		 batter varchar(30),
		 bowler varchar(30),
		 non_striker varchar(30),
		 extra_type varchar(10),
		 batsman_run int,
		 extras_run int,
		 total_run int,
		 non_boundary int,
		 iswicket_delivery int,
		 player_out varchar(50) , 
		 dismisal_kind varchar(50),
		 fielders_involved varchar(50),
		 batting_team varchar(30),
		 foreign key (id) references ipl_matches(id));



select * from  ball_by_ball;

/*

---- Rename the Table

Alter table ipl_matches_2008_2022 rename to ipl_matches;

Alter table ipl_ball_by_ball_2008_2022 rename to ball_by_ball;

*/




--------------------- Set correct names for sunrisers Hyderabad --------------------

--- ball_by_ball Table

Update ball_by_ball set batting_team = 'Sunrisers Hyderabad' 
                 where batting_team = 'Deccan Chargers';


--- Ipl_matches

Update ipl_matches set team1 ='Sunrisers Hyderabad' where team1 = 'Deccan Chargers';
Update ipl_matches set team2 ='Sunrisers Hyderabad' where team2 = 'Deccan Chargers';
Update ipl_matches set toss_winner ='Sunrisers Hyderabad' where toss_winner = 'Deccan Chargers';
Update ipl_matches set winning_team ='Sunrisers Hyderabad' where winning_team = 'Deccan Chargers';



--------------------- Set correct names for Gujrat Titans ---------------------------

--- ball_by_ball Table

Update ball_by_ball set batting_team = 'Gujarat Titans"' 
                 where batting_team = 'Gujarat Lions';


--- Ipl_matches

Update ipl_matches set team1 ='Gujarat Titans' where team1 = 'Gujarat Lions';
Update ipl_matches set team2 ='Gujarat Titans' where team2 = 'Gujarat Lions';
Update ipl_matches set toss_winner ='Gujarat Titans' where toss_winner = 'Gujarat Lions';
Update ipl_matches set winning_team ='Gujarat Titans' where winning_team = 'Gujarat Lions';



--------------------- Set correct names for Delhi Capitals ---------------------------


--- ball_by_ball Table

Update ball_by_ball set batting_team = 'Delhi Capitals' 
                 where batting_team = 'Delhi Daredevils';


--- Ipl_matches

Update ipl_matches set team1 ='Delhi Capitals' where team1 = 'Delhi Daredevils';
Update ipl_matches set team2 ='Delhi Capitals' where team2 = 'Delhi Daredevils';
Update ipl_matches set toss_winner ='Delhi Capitals' where toss_winner = 'Delhi Daredevils';
Update ipl_matches set winning_team ='Delhi Capitals' where winning_team = 'Delhi Daredevils';


--------------------- Set correct names for Delhi Capitals ---------------------------


--- ball_by_ball Table

Update ball_by_ball set batting_team = 'Delhi Capitals' 
                 where batting_team = 'Delhi Daredevils';


--- Ipl_matches

Update ipl_matches set team1 ='Delhi Capitals' where team1 = 'Delhi Daredevils';
Update ipl_matches set team2 ='Delhi Capitals' where team2 = 'Delhi Daredevils';
Update ipl_matches set toss_winner ='Delhi Capitals' where toss_winner = 'Delhi Daredevils';
Update ipl_matches set winning_team ='Delhi Capitals' where winning_team = 'Delhi Daredevils';


--------------------- Set correct names for Kings XI Punjab ---------------------------


--- ball_by_ball Table

Update ball_by_ball set batting_team = 'Kings XI Punjab' 
                 where batting_team = 'Punjab Kings';


--- Ipl_matches

Update ipl_matches set team1 ='Kings XI Punjab' where team1 = 'Punjab Kings';
Update ipl_matches set team2 ='Kings XI Punjab' where team2 = 'Punjab Kings';
Update ipl_matches set toss_winner ='Kings XI Punjab' where toss_winner = 'Punjab Kings';
Update ipl_matches set winning_team ='Kings XI Punjab' where winning_team = 'Punjab Kings';


--------------------- Set correct names for Rising Pune Supergiants ---------------------------


--- ball_by_ball Table

Update ball_by_ball set batting_team = 'Rising Pune Supergiants' 
                 where batting_team = 'Pune Warriors' or batting_team = 'Rising Pune Supergiant';


--- Ipl_matches

Update ipl_matches set team1 ='Rising Pune Supergiants' 
                  where team1 = 'Pune Warriors' or team1 = 'Rising Pune Supergiant';
				  
Update ipl_matches set team2 ='Rising Pune Supergiants' 
                 where team2 = 'Pune Warriors' or team2 = 'Rising Pune Supergiant';

Update ipl_matches set toss_winner ='Rising Pune Supergiants' 
                where toss_winner = 'Pune Warriors' or toss_winner = 'Rising Pune Supergiant';

Update ipl_matches set winning_team ='Rising Pune Supergiants' 
              where winning_team = 'Pune Warriors' or winning_team= 'Rising Pune Supergiant';



--------------- Update some values of season



update ipl_matches set season = 2020 where season = '2020/21';
update ipl_matches set season = 2010 where season = '2009/10';
Update ipl_matches set season = 2008 where season = '2007/08';



----------------------------- DML Statements ----------------------

--------------------- Data Analysis Starts --------------------------------------------

-- 1.Basic Level 

-- 1.List all the matches that took place in a specific city.


select city , id from ipl_matches where city in 
      (select city from ipl_matches where city ='Ahmedabad');

-- or

select distinct id , city  from ipl_matches where city = 'Ahmedabad';


-- 2. Find the number of matches played in each season.


select season , 
       count(id) as Total_no_of_matches 
	   from ipl_matches group by season order by count(id) desc;


-- 3. Retrieve all details of matches where a specific team won.

select * from ipl_matches where winning_team in 
                 (select winning_team from ipl_matches where winning_team = 'Mumbai Indians');


-- 4. Show the details of the first 10 matches in the dataset.


select * from ipl_matches order by id asc Limit 10;

-- or

With matches AS(

         select * , 
		        Rank() over(order by id asc) as match_id_rank 
				from ipl_matches order by id asc
)


select * from matches where match_id_rank <= 10;



-- 5. Find the total number of boundaries hit by all players in a specific match.

select id , 
       sum(CASE  
	   
                WHEN non_boundary = 1 THEN 1
			    ELSE 0
				
	   END) as Boundary from ball_by_ball
       where id in (select id from ball_by_ball where id = 1304101)
	   group by id order by Boundary desc;


-- 6. Which player was the "Player of the Match" in the most number of games?

select player_of_match, 
       count(id) as No_of_Times_Player_of_Match from ipl_matches 
	   group by player_of_match order by count(id) desc Limit 1;


---- or

With player_of_match AS(

         select player_of_match , 
		        count(id) as No_times_player_of_match , 
		        Rank() over(order by count(id) desc) as Rank_count
		        from ipl_matches group by player_of_match order by count(id) desc

)

select * from player_of_match where Rank_count <= 1;


-- 7. List all the matches that were decided by a Super Over.


select * from ipl_matches where superover = 'Y'


-- 8. Retrieve all the matches where a team won by more than 50 runs.


select * from ipl_matches where margin :: int > 50 and won_by = 'Runs';

-- 9. List all players who were dismissed as a 'bowled' in any match.


select  distinct batter , 
       dismisal_kind from ball_by_ball 
	   where dismisal_kind = 'bowled';


--------- Intermediate Level Queries -----------------------------------


-- 1. Find the total runs scored by a specific team in all matches they played.

select * from ipl_matches;
select * from ball_by_ball;

select batting_team  ,
       sum(total_run) as Total_Runs from ball_by_ball 
	   where batting_team = 'Mumbai Indians' 
	   group by batting_team 
	   order by sum(total_run) desc;


-- 2. Which teams have played the maximum number of matches in a season?


With combo_table AS(
          (select team1 as Team_first , count(id) as Count_team_first
           from ipl_matches group by team1
           order by count(id) desc) 
		   
           union
		   
         (select team2 as Team_second , count(id) as count_team_second
         from ipl_matches group by team2
         order by count(id) desc)
		 )

select team_first , sum(count_team_first) from combo_table 
group by team_first order by sum(count_team_first) desc;


-- 3. Find the average margin of victory for each team in the entire dataset.

select winning_team , 
       cast(avg(margin :: int) As decimal(10,2)) as average_margin_of_victory from ipl_matches 
	   where margin != 'NA'
       group by winning_team
       order by avg(margin :: int) desc;


-- 4. Retrieve all the details of matches played at a particular venue.

select * from ipl_matches as m 
         inner join ball_by_ball as b on m.id = b.id
         where venue in (select venue from ipl_matches where venue = 'Wankhede Stadium, Mumbai');


-- 5. List the top 5 players with the most number of runs scored in a single match.


select id , 
       batter , 
       sum(batsman_run) as batsman_run 
	   from ball_by_ball group by id , batter
       order by sum(batsman_run) desc Limit 5;


-- or


With batsman_run_single_match AS (

         select id , 
		        batter , 
				sum(batsman_run) as batsman_run , 
				Rank() over(order by sum(batsman_run) desc) as Rank_batsman_run
				from ball_by_ball
				group by id , batter
				order by sum(batsman_run) desc

)


select * from batsman_run_single_match where Rank_batsman_run <= 5;



-- 6. Find the number of times a specific player was dismissed as 'caught'.


select batter , sum(
                    case
					
					      When  dismisal_kind = 'caught' Then 1
						  
					      ELSE 0

				    END ) as No_of_times_dismisal_by_caught
                from ball_by_ball where 
				batter in (select batter from ball_by_ball where batter = 'V Kohli')
                group by batter order by No_of_times_dismisal_by_caught  desc;


-- 7. Which umpire officiated the most number of matches?

With Umpire_Matches AS(

                   (select umpire1 as Umpire_Name , 
                           count(id) as No_of_Matches from ipl_matches 
						   group by umpire1 order by count(id) desc)
                   union
    
	              (select umpire2 as Umpire_Name , 
                          count(id) as No_of_Matches from ipl_matches 
						  group by umpire2 order by count(id) desc)

)

select umpire_name , 
       sum(No_of_Matches) from Umpire_Matches group by Umpire_name 
	   order by sum(No_of_Matches) desc;


-- 8. Find the total number of extras given in all matches by each bowling team.


select 
       case
            WHEN batting_team = team1 THEN team2 
		    WHEN batting_team = team2 THEN team1
	   END as bowling_team , 
	   sum(extras_run) as extras_run
	   from ball_by_ball as b inner join ipl_matches as m
	   on b.id = m.id group by bowling_team
	   order by extras_run desc;


-- 9. Find all the matches where a team won after losing the toss.

select * from ipl_matches
       where winning_team != toss_winner;


------- Advance Level Queries 


-- 1. Find the total number of wickets taken by each bowler in the dataset.


select bowler , 
       sum(
	       case   
		        WHEN iswicket_delivery = 1 THEN 1
				ELSE 0
		   END) as wickets
		from ball_by_ball group by bowler order by wickets desc;


-- 2. Find the highest run-scorer in each season and the number of runs they scored.

With highest_scorer AS(
               select season , 
			           batter , 
					   sum(batsman_run) as runs  , 
                       Rank() over(partition by season order by sum(batsman_run) desc) 
					   as Rank_on_runs
                       from ipl_matches as m 
                       inner join ball_by_ball as b
                       on m.id = b.id group by season , batter order by runs desc 
)

select * from highest_scorer where Rank_on_runs <= 1 order by season desc;



-- 3. For each match, find the team with the highest run rate.


With overs_run AS(
select id,
       batting_team , 
       count(distinct(overs))  as Total_overs ,
       sum(total_run) as Total_runs,
	   cast(sum(total_run) / count(distinct(overs)) AS decimal(10,2)) as Runrate ,
	   Rank() over(partition by id order by (sum(total_run) / count(distinct(overs))) desc) as Rank_runrate
	   from ball_by_ball group by id , batting_team
	   order by id  
)

select * from overs_run where Rank_runrate <= 1;




-- 6. Calculate the batting strike rate for each batsman and identify the top 5 batsmen with 
-- the highest strike rates.

select batter , 
       sum(batsman_run) as Batsman_Runs , 
	   count(ball_number) as Balls_played,
       cast(cast(sum(batsman_run)AS decimal(10,2)) / count(ball_number) * 100 AS decimal(10,2)) 
       as strike_rate from ball_by_ball
       group by batter order by strike_rate desc Limit 5;

-- or 

With strike_rate_table AS(

             select batter , 
			        sum(batsman_run) as Batsman_runs, 
					count(ball_number) as Balls_played , 
                    cast(cast(sum(batsman_run) AS decimal(10,2)) / count(ball_number) * 100 
				    As decimal(10,2)) as strike_rate , Rank() over(order by 
				    cast(cast(sum(batsman_run) AS decimal(10,2)) / count(ball_number) * 100 
				    As decimal(10,2)) desc) as Rank_strike_rate from ball_by_ball 
				    group by batter order by strike_rate desc)

select * from strike_rate_table where Rank_strike_rate <=5;


-- 7. Find the number of matches that went into a Super Over, and in how many of 
-- those matches the batting team won.


select distinct m.id , 
       superover  , 
	   batting_team , 
	   winning_team from ipl_matches as m 
       inner join ball_by_ball as b on m.id = b.id
       where superover = 'Y' and winning_team = batting_team;

-- or

select m.id , 
       superover , 
	   batting_team , 
	   winning_team
       from ipl_matches as m inner join ball_by_ball as b on m.id = b.id
       where superover = 'Y' and batting_team = winning_team
       group by m.id , superover , batting_team , winning_team;



-- 8. For each season, calculate the win percentage of each team.


With team_matches AS(

(select team1 as team1 , 
       count(team1) as no_of_matches_played , 
	   sum(
           case
               WHEN team1 = winning_team THEN 1
               ELSE 0
		   END) as No_of_wins 
	  from ipl_matches group by team1)

union

(select team2 as team2 , 
       count(team2) as no_of_matches_played , 
	   sum(
           case
               WHEN team2 = winning_team THEN 1
               ELSE 0
		   END) as No_of_wins
	  from ipl_matches group by team2)

)

select team1 , 
       sum(No_Of_Matches_Played) as Total_Matches_Played, 
       sum(no_of_wins) as Total_Matches_Win , 
       concat(cast(cast(sum(no_of_wins) AS decimal(10,2)) / sum(No_Of_Matches_Played) * 100 AS decimal(10,2)) , '%')
       as Win_Percentage from team_matches group by team1 order by Win_Percentage desc;
			


-- 9. Analyze the impact of the toss winner on the outcome of matches. 
-- Did the team winning the toss win more often?

With Win_percentage_and_Loss_percentage_when_toss_win AS(

(select team1 , 
        count(team1) as matches_played,
        sum(
            case 
				WHEN team1 = winning_team THEN 1
				ELSE 0
			END) as no_of_wins , 
		sum(case
			    WHEN team1 = toss_winner THEN 1
				ELSE 0
		END) as no_of_toss_winner , 
		sum(
		    case 
			    WHEN (team1 = toss_winner and team1 =  winning_team) THEN 1
				ELSE 0
			END) as toss_win_match_win , 
		concat(cast(cast(sum(
		    case 
			    WHEN (team1 = toss_winner and team1 =  winning_team) THEN 1
				ELSE 0
			END) As decimal(10,2)) / sum(case
			    WHEN team1 = toss_winner THEN 1
				ELSE 0
		END) * 100 AS decimal(10,2)) , '%')
        as win_percentange_when_toss_win
        from ipl_matches group by team1)

union

(select team2 , 
        count(team2) as matches_played,
        sum(
            case 
				WHEN team2 = winning_team THEN 1
				ELSE 0
			END) as no_of_wins , 
	    sum(case
			    WHEN team2 = toss_winner THEN 1
			    ELSE 0
			END) as no_of_toss_winner , 
		sum(
			case 
			    WHEN (team2 = toss_winner and team2 =  winning_team) THEN 1
				ELSE 0
			END) as toss_win_match_win, 

		concat(cast(cast(sum(
			case 
			    WHEN (team2 = toss_winner and team2 =  winning_team) THEN 1
				ELSE 0
			END) As decimal(10,2)) / sum(case
			    WHEN team2 = toss_winner THEN 1
			    ELSE 0
			END) * 100 AS decimal(10,2)) , '%')
        as win_percentange_when_toss_win
        from ipl_matches group by team2)

)


select team1 as team , 
       sum(matches_played) as matches_played , 
	   sum(no_of_wins) as no_of_wins, 
       sum(no_of_toss_winner) as no_of_times_toss_win,
       sum(toss_win_match_win) as toss_win_when_match_win  , 
       concat(cast(cast(sum(toss_win_match_win) AS decimal(10,2)) / sum(no_of_toss_winner) * 100 
       AS decimal(10,2)) , '%') as win_percentage_when_toss_win , 
       concat(100 - cast(cast(sum(toss_win_match_win) AS decimal(10,2)) / sum(no_of_toss_winner) * 100 
       AS decimal(10,2)) , '%') as Loss_percentage_when_toss_win
       from Win_percentage_and_Loss_percentage_when_toss_win
	   group by team1;



-- 10. Identify all matches where the margin of victory was less than 10 runs and find out how many of 
--them ended with a bowler taking the last wicket.



With bowler_name AS(

                     select m.id as match_id , 
                            batting_team, count(batter) as Total_wickets_of_batting_team , 
	                        bowler as last_wicket_bowler ,
	                        winning_team as bowler_team,
                            max(overs) as last_wicket_over,
	                        won_by , 
	                        margin as win_margin,
	                        winning_team,
                            Rank() over(partition by m.id , batting_team order by max(overs) desc) as Rank_last_wicket_over
                            from ball_by_ball as b inner join ipl_matches as m on m.id = b.id
                            where (player_out != 'NA' and iswicket_delivery = 1)
                            group by m.id , batting_team,bowler , won_by , margin , winning_team)  


select * from bowler_name where Rank_last_wicket_over <= 1 and won_by = 'Runs' and (win_margin :: int) <= 10
and batting_team != winning_team;








	   