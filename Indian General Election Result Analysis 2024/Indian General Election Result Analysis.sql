--------------------------- DDL Statments -----------------------------------------


------ Create States Table ------------

Create table States
                   (State_ID varchar(10) primary key,
				   State varchar(50));




----------------  create partywise results table---------------------------------------------------------

create table partywise_results
                   (Party varchar(100) , 
				   Won INT , 
				   Party_ID INT primary key);



-------------------------------------------  create table constituencywise details ----------------------------

create table constituencywise_details
                     (Sr_No INT , 
					 candidate varchar(100) ,
					 party varchar(100),
					 EVM_Votes INT ,
					 postal_votes INT, 
					 Total_votes INT , 
					 Percentage_Votes float , 
					 Constituency_ID varchar(20),
					 foreign key (Constituency_ID) references constituencywise_results(Constituency_ID));

--drop table constituencywise_details;


------------------------------------- create constituencywise results -------------------------------------

create table constituencywise_results
                 (Sr_No int , 
				 parlimentry_constituency varchar(100) , 
				 constituency_Name varchar(100), 
				 winning_candidate varchar(100),
				 Total_votes INT , 
				 Margin INT, 
				 Constituency_ID varchar(20) primary key , 
				 party_ID INT , 
				 foreign key (parlimentry_constituency) references Statewise_results(parlimentry_constituency),
				 foreign key (party_ID) references partywise_results(Party_ID));




	------------------------ Create table Statewise results ---------------------------

create table Statewise_results
                 (Constituency varchar(70), 
				  Const_No  INT , 
				  parlimentry_constituency varchar(70) primary key , 
				  Leading_candidate varchar(100) , 
				  Trailing_candidate varchar(100),
				  Margin INT, 
				  Status varchar(40), 
				  State_ID varchar(10), 
				  StateName varchar(50)  ,  
				  foreign key (State_ID) references States(state_ID));


--Alter table constituencywise_results rename partlimentry_constituency to parlimentry_constituency;



------------------------------------------ DDL statments completed -------------------

select * from partywise_results;
select * from constituencywise_details;
select * from constituencywise_results;
select * from states;




--------------------------------------- Problem Statements -------------------------------

--1) Total Seats

select distinct(count(parlimentry_constituency)) as Total_seats 
       from constituencywise_results;

---- or 

select count(distinct constituency_ID) as Total_seats 
        from constituencywise_details;


-- 2) What is the total number of seats available for elections in each state


select s.state_id , 
       s.state ,  
	   count(cr.parlimentry_constituency) 
	   from constituencywise_results as cr inner join
       statewise_results as sr on
       cr.parlimentry_constituency = sr.parlimentry_constituency
       inner join states as s on sr.state_id = s.state_id
       group by s.state_id , s.state;

--- Why we consider ? constituency_results and states table because we want distinct parlimentry
--- constituency so it get from constituency_results because primary key and state also we want
--- distinct so we take it states table (primary)

--3. Total Seats won by NDA Alliance  


select 
sum(case
        WHEN party IN( 'Bharatiya Janata Party - BJP', 
                       'Telugu Desam - TDP', 
				        'Janata Dal  (United) - JD(U)',
                        'Shiv Sena - SHS', 
                        'AJSU Party - AJSUP', 
                        'Apna Dal (Soneylal) - ADAL', 
                        'Asom Gana Parishad - AGP',
                        'Hindustani Awam Morcha (Secular) - HAMS', 
                        'Janasena Party - JnP', 
				        'Janata Dal  (Secular) - JD(S)',
                        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                        'Nationalist Congress Party - NCP',
                        'Rashtriya Lok Dal - RLD', 
                        'Sikkim Krantikari Morcha - SKM')

	   THEN won
	   else 0

   END) AS NDA_seats from partywise_results;


-- 4.Total Seats Won by I.N.D.I.A. Allianz

select 
sum(case   

      When party IN ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
	  THEN won
	  else 0


END) AS INDIA_Alliance_seats from partywise_results;


-- 5.Seats won by NDA alliance parties

select party , won as seats from partywise_results
where party in ('Bharatiya Janata Party - BJP', 
                       'Telugu Desam - TDP', 
				        'Janata Dal  (United) - JD(U)',
                        'Shiv Sena - SHS', 
                        'AJSU Party - AJSUP', 
                        'Apna Dal (Soneylal) - ADAL', 
                        'Asom Gana Parishad - AGP',
                        'Hindustani Awam Morcha (Secular) - HAMS', 
                        'Janasena Party - JnP', 
				        'Janata Dal  (Secular) - JD(S)',
                        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                        'Nationalist Congress Party - NCP',
                        'Rashtriya Lok Dal - RLD', 
                        'Sikkim Krantikari Morcha - SKM')
group by party , won
order by won desc;

-- 6. Seats won by I.N.D.I.A alliance parties

select party , won as seats  from partywise_results where
party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
group by party , won
order by won desc;



--7.Add new column field in table partywise_results to get the Party Allianz as 
--NDA, I.N.D.I.A and OTHER

Alter table partywise_results add column Allianz varchar(30);
select * from partywise_results;

----- NDA ALLIANZ

Update partywise_results set Allianz  = 'NDA ALLIANZ'
where party in ('Bharatiya Janata Party - BJP', 
                       'Telugu Desam - TDP', 
				        'Janata Dal  (United) - JD(U)',
                        'Shiv Sena - SHS', 
                        'AJSU Party - AJSUP', 
                        'Apna Dal (Soneylal) - ADAL', 
                        'Asom Gana Parishad - AGP',
                        'Hindustani Awam Morcha (Secular) - HAMS', 
                        'Janasena Party - JnP', 
				        'Janata Dal  (Secular) - JD(S)',
                        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                        'Nationalist Congress Party - NCP',
                        'Rashtriya Lok Dal - RLD', 
                        'Sikkim Krantikari Morcha - SKM')


------- I.N.D.I.A Allianz


Update partywise_results set Allianz = 'I.N.D.I.A ALLIANZ'
where party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
						

------ OTHERS------


Update partywise_results set Allianz = 'OTHER'
where party not in ('Bharatiya Janata Party - BJP', 
                       'Telugu Desam - TDP', 
				        'Janata Dal  (United) - JD(U)',
                        'Shiv Sena - SHS', 
                        'AJSU Party - AJSUP', 
                        'Apna Dal (Soneylal) - ADAL', 
                        'Asom Gana Parishad - AGP',
                        'Hindustani Awam Morcha (Secular) - HAMS', 
                        'Janasena Party - JnP', 
				        'Janata Dal  (Secular) - JD(S)',
                        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                        'Nationalist Congress Party - NCP',
                        'Rashtriya Lok Dal - RLD', 
                        'Sikkim Krantikari Morcha - SKM',
						'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')




-- 8.Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?


select allianz , 
       sum(won) as "Won Seats" from partywise_results
       group by allianz 
	   order by sum(won) desc limit 1;

-- or

with seats_won_by_allianz AS(

      select allianz , 
	          sum(won) as "Won Seats" , 
	          Rank() over(order by sum(won) desc) as "Ranks_Won_Seats"
			  from partywise_results
			  group by allianz
			  order by sum(won) desc
)

select * from seats_won_by_allianz where "Ranks_Won_Seats" <= 1;


-- 9.Winning candidate's name, their party name, total votes, and the margin of victory 
--for a specific state and constituency?


select winning_Candidate , 
       pr.party , 
	   total_votes , 
	   cr.margin,
	   s.state
       from constituencywise_results as cr inner join partywise_results as pr
       on cr.party_id = pr.party_id
       inner join statewise_results as sr 
	   on cr.parlimentry_constituency = sr.parlimentry_constituency
       inner join states as s on sr.state_id = s.state_id
       where cr.constituency_name = (select constituency_name from constituencywise_results 
       where constituency_name = 'PUNE' and 
	   s.state = (select state from states where state = 'Maharashtra'))
       group by cr.constituency_name , winning_Candidate , 
	   pr.party,total_votes,cr.margin,s.state;



-- 10.What is the distribution of EVM votes versus postal votes for candidates in 
--a specific constituency?

with evm_postal_votes AS (
                         Select cr.constituency_name , 
						         cd.candidate , 
								 cd.evm_votes as EVM_Votes , 
                                cd.postal_votes as Postal_votes , 
								 cd.total_votes
                                from constituencywise_details as cd 
                                inner join constituencywise_results as cr
                                on cd.constituency_id = cr.constituency_id
                                where constituency_name = 'PUNE'
                                group by cr.constituency_name , 
								cd.candidate , 
								cd.evm_votes , 
								cd.postal_votes , 
								cd.total_votes
                                order by cd.total_votes desc)
select * from evm_postal_votes;


-- or 
--- create function for dynamic

create function dbo.get_evm_postal_votes(@constituency_name varchar(100))
Returns Table
AS
Return(
       Select cr.constituency_name , 
						         cd.candidate , 
								 cd.evm_votes as EVM_Votes , 
                                cd.postal_votes as Postal_votes , 
								 cd.total_votes
                                from constituencywise_details as cd 
                                inner join constituencywise_results as cr
                                on cd.constituency_id = cr.constituency_id
                                where constituency_name = @constituency_name
                                group by cr.constituency_name , 
								cd.candidate , 
								cd.evm_votes , 
								cd.postal_votes , 
								cd.total_votes
                                order by cd.total_votes desc
								
);

select * from get_evm_postal_votes('PUNE')

-- 11.Which parties won the most seats in State, and how many seats did each party win?

select s.state , 
       party , 
	   count(cr.parlimentry_constituency) as "won_parlimentry_comsttituencies" 
       from partywise_results as pr inner join constituencywise_results as cr
       on pr.party_id = cr.party_id
       inner join statewise_results as sr on cr.parlimentry_constituency = sr.parlimentry_constituency
       inner join states as s on sr.state_id = s.state_id
       where s.state = (select state from states where state = 'Maharashtra')
       group by s.state , party 
       order by count(cr.parlimentry_constituency) desc;

--- or


with seats_in_state AS (

             select s.state , 
			         party,
					 count(cr.parlimentry_constituency) as "won_parlimentry_seats",
					 Dense_Rank() over(partition by s.state order by count(party) desc) as "party_Rank"
					 from partywise_results as pr inner join constituencywise_results as cr
					 on pr.party_id = cr.party_id
					 inner join statewise_results as sr
					 on cr.parlimentry_constituency = sr.parlimentry_constituency
					 inner join states as s 
					 on sr.state_id = s.state_id
					 where s.state = (select state from states where state = 'Maharashtra')
					 group by s.state , party
					 order by count(cr.parlimentry_constituency) desc
					 
)


-- won most seats in state;
select * from seats_in_state where "party_Rank" <=1;



--12. Which Candidate recieved the highest number of EVM votes in each constituency(Top 10) ?

select constituency_name , 
       candidate , 
	   evm_votes as "Evm Votes" from 
       constituencywise_results as cr inner join constituencywise_details as cd
       on cr.constituency_id = cd.constituency_id
       group by parlimentry_constituency , constituency_name , candidate , evm_votes
       order by  evm_votes desc limit 10;

-- or
with evm_votes_each_constituency AS
(
select constituency_name , 
       candidate , 
	   evm_votes as "Evm Votes",
	   Rank() over (partition by cr.constituency_id order by evm_votes desc) as "Rank_evm_votes"
	   from constituencywise_results as cr inner join constituencywise_details as cd
	   on cr.constituency_id = cd.constituency_id
	   group by cr.constituency_id , candidate , evm_votes
	   order by evm_votes desc
)

select * from evm_votes_each_constituency where "Rank_evm_votes" <=1 limit 10;

--13.What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) 
--in each state for the India Elections 2024

select s.state , 
       allianz , 
	   count(cr.parlimentry_constituency) as "Won Seats" 
       from partywise_results as pr
       inner join constituencywise_results as cr
       on pr.party_id = cr.party_id
       inner join statewise_results as sr
       on cr.parlimentry_constituency = sr.parlimentry_constituency
       inner join states as s on sr.state_id = s.state_id
       group by s.state , allianz
       order by s.state asc , count(cr.parlimentry_constituency) desc;


--or 

with Statewise_seats AS(

           select s.state , allianz , count(cr.parlimentry_constituency) as "Won Seats" ,
		   Rank() over(partition by s.state order by count(cr.parlimentry_constituency) desc) 
		   as "Rank_seatwise"
           from partywise_results as pr
           inner join constituencywise_results as cr
           on pr.party_id = cr.party_id
           inner join statewise_results as sr
           on cr.parlimentry_constituency = sr.parlimentry_constituency
           inner join states as s on sr.state_id = s.state_id
           group by s.state , allianz
           order by s.state asc , count(cr.parlimentry_constituency) desc
)

select * from statewise_seats;


-- 14.Which candidate received the highest number of Postal_Votes votes in 
-- each constituency (Top 10)?


select cr.parlimentry_constituency , 
       candidate , 
	   Postal_votes from constituencywise_details as cd 
       inner join constituencywise_results as cr
       on cd.constituency_id = cr.constituency_id
       group by cr.parlimentry_constituency , candidate , postal_votes
       order by postal_votes desc limit 10;

-- or

with postal_votes AS(

                 select cr.parlimentry_constituency , 
				        candidate , 
						postal_votes , 
				        Rank() over(order by postal_votes desc) as "Rank_postal_votes"
				        from constituencywise_details as cd 
				        inner join constituencywise_results as cr
				        on cd.constituency_id = cr.constituency_id
				        group by cr.parlimentry_constituency , candidate , postal_votes
				        order by postal_votes desc
)

select * from postal_votes where "Rank_postal_votes" <= 10;


-- 15.Which candidate won and which candidate was the runner-up in each constituency of 
-- State for the 2024 elections?

with winning_runnerup_candidate_constituency AS(
             select s.state , cr.parlimentry_constituency ,candidate , cd.total_votes ,
			 Rank() over(partition by s.state , cr.parlimentry_constituency order by cd.total_votes desc) 
             from constituencywise_details as cd
             inner join constituencywise_results as cr
             on cd.constituency_id = cr.constituency_id
			 inner join statewise_results as sr
			 on cr.parlimentry_constituency = sr.parlimentry_constituency
			 inner join states as s on sr.state_id = s.state_id
             where s.state = 'Maharashtra'
             group by s.state , cr.parlimentry_constituency , candidate , cd.total_votes
             order by cr.parlimentry_constituency , cd.total_votes desc
)

select parlimentry_constituency,
      max(case
	       WHEN Rank = 1 THEN candidate END) AS "Winner Candidate",
	  max(case
	       WHEN Rank = 2 THEN candidate END) AS "Runner UP Candidate"
		from winning_runnerup_candidate_constituency
		Group by parlimentry_constituency;


-- Dyanamic store procedure;

create procedure Get_win_runnerup (@state_Name varchar(50))
AS
BEGIN

     with winning_runnerup_candidate_constituency AS(
             select s.state , cr.parlimentry_constituency ,candidate , cd.total_votes ,
			 Rank() over(partition by s.state , cr.parlimentry_constituency order by cd.total_votes desc) 
             from constituencywise_details as cd
             inner join constituencywise_results as cr
             on cd.constituency_id = cr.constituency_id
			 inner join statewise_results as sr
			 on cr.parlimentry_constituency = sr.parlimentry_constituency
			 inner join states as s on sr.state_id = s.state_id
             where s.state = @state_Name
             group by s.state , cr.parlimentry_constituency , candidate , cd.total_votes
             order by cr.parlimentry_constituency , cd.total_votes desc
)

    select parlimentry_constituency,
           max(case
	               WHEN Rank = 1 THEN candidate END) AS "Winner Candidate",
	       max(case
	               WHEN Rank = 2 THEN candidate END) AS "Runner UP Candidate"
		   from winning_runnerup_candidate_constituency
		   Group by parlimentry_constituency;

END;

Excec Get_win_runnerup 'Maharashtra'


--16.For the state of Maharashtra, what are the total number of seats, 
--total number of candidates, total number of parties, total votes (including EVM and postal), 
--and the breakdown of EVM and postal votes?



select count(distinct(cr.parlimentry_constituency)) as "Total_no_seats_in_state" , 
       count(distinct(candidate)) as "Total_no_of_candidates",
	   count(distinct(pr.party_id)) as "count_of_party",
	   sum(cd.total_votes) as "Total_Votes_in_state",
	   sum(postal_votes) as "Total_postal_votes_in_state",
	   sum(EVM_votes) as "Total_EVM_votes_in_state"
	   from constituencywise_details as cd inner join constituencywise_results as cr
	   on cd.constituency_id = cr.constituency_id
	   inner join partywise_results as pr
	   on cr.party_id = pr.party_id
	   inner join statewise_results as sr
	   on cr.parlimentry_constituency = sr.parlimentry_constituency
	   inner join states as s on sr.state_id = s.state_id
	   where s.state = 'Maharashtra'

--16.For the state of Maharashtra, what are the total number of seats, 
--total number of candidates, total number of parties, total votes (including EVM and postal), 
--and the breakdown of EVM and postal votes?


select count(distinct(cr.parlimentry_constituency)) as constitunecy_count , 
count(distinct(cd.candidate)) as candidate_count, 
count(distinct(pr.party)) as party_count , 
sum(cd.total_votes) as Total_votes,
sum(cd.evm_votes) as evm_votes,
sum(cd.postal_votes) as postal_votes
from constituencywise_results as cr inner join 
statewise_results as sr
on cr.parlimentry_constituency = sr.parlimentry_constituency
inner join states as s on sr.state_id = s.state_id
inner join constituencywise_details as cd on cd.constituency_id = cr.constituency_id
inner join partywise_results as pr on cr.party_id = pr.party_id
where s.state = 'Maharashtra';
