-- Create database  protfolio_management_system;

Create database portfolio_management_system ;

-- Use databasenme;

Use portfolio_management_system;


-- Create tables;

Create table Company_profiles(

           symbol varchar(20) primary key ,
		   company_name varchar(80) not null ,
		   sector varchar(20) not null ,
		   market_cap bigint not null,
		   paidup_capital bigint);

-- Alter table Company_profiles alter column paidup_capital bigint;
-- Alter table Company_profiles alter column market_cap bigint;


Insert into Company_profiles( symbol , company_name , sector , market_cap , paidup_capital)
       values
('KBL', 'Kumari Bank', 'Bank', 1000000000, 21212121221),
('NIL', 'Nepal Insurance Limited', 'Life Insurance', 123232332, 131321321),
('LEC', 'Libery Energy', 'Hydropower', 63233232, 61321321),
('ELEX', 'Nepal Electronics Bank', 'Bank', 32323233232, 323321321321),
('NEPP', 'Nepal Power', 'Hydropower', 102323233232, 10323321321321),
('LSL', 'Life Saver Limited', 'Life Insurance', 23233232, 21321321),
('NBL', 'Nepal Bank Limited', 'Bank', 532323233232, 5323321321321),
('HEX', 'Hotel Electronics', 'Hotels', 82323233232, 823321321321),
('HIH', 'Hotel Itahari', 'Hotels', 12323233232, 123321321321),
('BIH', 'Bank of Itahari', 'Bank', 62323233232, 623321321321);


-- Create Company_price table;

Create table Company_price(

             Symbol varchar(20) not null ,
			 LTP int not null ,
			 PC int not null , 
			 foreign key (Symbol) references Company_Profiles(Symbol)
			 );


insert into Company_price(symbol , LTP , PC) 
values
('KBL', 500, 470),
('NIL', 5800, 6000),
('LEC', 400, 410),
('ELEX', 1010, 1000),
('NEPP', 500, 480),
('LSL', 1000, 1040),
('NBL', 600, 580.5),
('HEX', 1222.3, 1220),
('HIH', 1500.5, 1499.4),
('BIH', 788, 777);

-- Create fundamental report;


Create table fundamental_report(

               symbol varchar(20) not null ,
			   report_as_of varchar(20) not null ,
			   EPS int not null ,
			   ROE float not null ,
			   book_value int not null  ,
			   foreign key (symbol) references company_profiles(symbol)
			   );


insert into fundamental_report(symbol , report_as_of , EPS , ROE , book_value)
values

('KBL', '77/78_q3', 20.5, 11.97, 120),
('KBL', '77/78_q2', 19.5, 10, 110),  
('NIL', '77/78_q3', 205, 50, 300),
('NIL', '77/78_q2', 211, 55, 310),
('LEC', '77/78_q3', 8, 4, 90),
('LEC', '77/78_q2', 7.5, 3.5, 88),
('ELEX', '77/78_q3', 34, 15, 180),
('ELEX', '77/78_q2', 31, 13, 178),
('NEPP', '77/78_q3', 21, 12, 119),
('NEPP', '77/78_q2', 20, 11, 118),
('LSL', '77/78_q3', 30, 12, 170),
('LSL', '77/78_q2', 35.4, 13, 180.5),
('NBL', '77/78_q3', 22, 13, 120),
('NBL', '77/78_q2', 21, 12, 117),
('HEX', '77/78_q3', 50, 15, 200),
('HEX', '77/78_q2', 48, 14, 199),
('HIH', '77/78_q3', 60, 20, 220),
('HIH', '77/78_q2', 55, 18, 200),
('BIH', '77/78_q3', 36, 20, 220),
('BIH', '77/78_q2', 35, 21, 200);




-- Create technical signals table

Create table technical_signals(
   
         symbol varchar(20) not null ,
		 RSI float not null ,
		 volume int not null ,
		 ADX int not null ,
		 MACD varchar(10) not null ,
		 foreign key (symbol) references Company_Profiles(symbol)
		 );

-- Alter table technical_signals drop column LTP;


insert into technical_signals(symbol , RSI , volume , ADX , MACD)
values
('KBL', 65.1, 451000, 33.3, 'bull'), 
('NIL', 50.5, 100000, 40, 'bull'), 
('LEC', 20, 12344, 15, 'bear'),
('ELEX', 70, 1200000, 30, 'bull'),
('NEPP', 45, 212000, 16.5, 'bull'),
('LSL', 53.4, 15312, 25.29, 'bull'),
('NBL', 66.41, 406121, 34.66, 'bull'),
('HEX', 40.2, 34000, 40, 'side'),
('HIH', 35, 120000, 30, 'side'),
('BIH', 75, 335000, 44, 'bull');

-- Create table dividend history;


Create table dividend_history(

           symbol varchar(20) not null ,
		   fiscal_year varchar(20) not null ,
		   bonus_dividend int not null ,
		   cash_dividend int not null ,
		   foreign key (symbol) references company_profiles(symbol)
		   
		   );



insert into dividend_history(symbol , fiscal_year , bonus_dividend , cash_dividend)
values

('KBL', '76/77', 5, 10),
('KBL', '75/76', 4, 11),
('NIL', '76/77', 10, 15),
('NIL', '75/76', 10, 13),
('LEC', '76/77', 0, 0), 
('LEC', '75/76', 0, 0),
('ELEX', '76/77', 20, 10), 
('ELEX', '75/76', 14, 10),
('NEPP', '76/77', 0, 0),
('NEPP', '75/76', 0, 0),
('LSL', '76/77', 5, 10),
('LSL', '75/76', 5, 10),
('NBL', '76/77', 11, 5),
('NBL', '75/76', 11, 0),
('HEX', '76/77', 0, 0),
('HEX', '75/76', 0, 0),
('HIH', '76/77', 0, 0),
('HIH', '75/76', 0, 0),
('BIH', '76/77', 20, 25),
('BIH', '75/76', 15, 20);






-- User


Create table User_profile(

        Username varchar(30) primary key ,
		email varchar(40) not null ,
		Phone varchar(10),
		user_password varchar(40) ,
		foreign key (username) references User_profile(Username)

		);


insert into  User_profile(Username , email , Phone , user_password)
values

('rewan', 'uni.rayone@gmail.com', 9800000001, 'rewan@123'),
('mahesh', 'uni@gmail.com', 9800000002, 'mahesh@123'),
('suman', 'uni1.rayone@gmail.com', 9800000003, 'suman@123'),
('madhu', 'uni2.rayone@gmail.com', 9800000004, 'madhu@123'),
('sobit', 'uni3.rayone@gmail.com', 9800000005, 'sobit@123'),
('ray', 'uni4.rayone@gmail.com', 9800000006, 'ray@123'),
('rayone', 'uni5.rayone@gmail.com', 9800000007, 'rayone@123'),
('ravi', 'uni6.rayone@gmail.com', 9800000008, 'ravi@123'),
('michael', 'uni7.rayone@gmail.com', 9800000009, 'michael@123'),
('hari', 'uni8.rayone@gmail.com', 9811111111, 'hari@123'),
('madan', 'uni10.rayone@gmail.com', 9800000010, 'madan@123'),
('sandeep', 'uni11.rayone@gmail.com', 9800000011, 'sandeep@123'),
('surya', 'tha0751@gmail.com', 9860000014, 'surya@123'),
('vai', 'tha0752@gmail.com', 9860000013, 'vai@123'),
('gtm', 'tha075@gmail.com', 9860000012, 'gtm@123');




-- Create table watch list;

Create table watchlist(

       username varchar(30) ,
	   symbol varchar(20) ,
	   foreign key (username) references user_profile(Username) ,
	   foreign key (symbol) references company_profiles(symbol)

	   );

select * from information_schema.table_constraints where table_name = 'watchlist';

-- Alter table watchlist drop constraint FK__watchlist__usern__628FA481;
-- Alter table watchlist drop constraint FK__watchlist__usern__628FA481;



insert into watchlist(username , symbol)
values
('sita', 'NIF'),
('sita', 'NBM'),
('bikash', 'TRH'),
('bikash', 'HOT'),
('anita', 'LAL'),
('anita', 'HOT'),
('ram', 'KBL'),
('ram', 'NIF'),
('shyam', 'LEC'),
('shyam', 'TRH'),
('gita', 'LAL'),
('gita', 'NEPP'),
('rekha', 'NBL'),
('rekha', 'HEX'),
('hari', 'BIH'),
('hari', 'NBL'),
('arjun', 'HEX'),
('arjun', 'HOT'),
('nikita', 'ELEX'),
('nikita', 'BIH'),
('anil', 'NIL'),
('anil', 'LSL'),
('susan', 'NBL'),
('susan', 'NEPP'),
('manoj', 'HIH'),
('manoj', 'BIH'),
('ramesh', 'KBL'),
('ramesh', 'LEC'),
('laxmi', 'NIF'),
('laxmi', 'LSL');


-- Create table news;

Create table news(

        news_id int identity(1,1) primary key,
		title varchar(200) not null ,
		sources varchar(20) not null ,
		News_date Date not null ,
		related_company varchar(20),
		foreign key (related_company) references Company_profiles(symbol)

		);


insert into news(title , sources , News_date , related_company)
values
('Kumari Bank announces right share of 1:1', 'myRepublica', '2021-07-01', 'KBL'),
('Liberty energy to test production soon', 'merokhabar', '2021-07-04', 'LEC'),
('Hotel itahari expands it"s area', 'itaharinews', '2021-07-05', 'HIH'),
('CEO of Nepal Insurance Limited resigns immediately', 'ekantipur', '2021-07-10', 'NIL'),
('CEO of Nepal Insurance Limited resigns immediately', 'myRepublica', '2021-07-10', 'NIL');


-- Create transaction_histort;

Create table transaction_history(

              Transaction_id int identity(1,1) primary key,
              Username varchar(30) not null , 
			  symbol varchar(20) not null,
			  transaction_date  Date not null ,
			  quantity int not null ,
			  rate int not null,
			  foreign key (Username) references  User_profile(Username) ,
			  foreign key (symbol) references Company_profiles(symbol)

			  );



insert into transaction_history(username , symbol , transaction_date , quantity , rate)
values
('rewan', 'HEX', '2021-07-01', 100, 1200),
('rewan', 'HIH', '2021-07-02', 55, 1480),
('rewan', 'HIH', '2021-07-06', -20, 1500),
('suman', 'LEC', '2021-07-10', 10, 420),
('suman', 'LEC', '2021-07-15', 10, 410),
('rewan', 'BIH', '2021-07-20', 120, 785.5),
('rewan', 'LSL', '2021-07-20', 55, 1001);


select distinct(table_name) from information_schema.columns;



-- Start Data Analysis

-- 1.List all companies with their sector and market capitalization.


select Symbol , Company_name , sector , market_cap as market_capotalization from Company_profiles;


-- 2. Find top 5 companies by market capitalization.


select 
     Top 5 company_Name , 
     market_cap 
from 
	 company_profiles 
order by
     market_cap desc;

-- or 

select 
     Top 5 company_Name , 
     sum(market_cap) as Total_market_capitalization 
from 
     company_profiles group by company_name
order by 
     Total_market_capitalization desc;

-- or 

With Top_five_company_market_cap AS(

select Company_Name , market_cap  ,
Dense_Rank() over(order by market_cap desc) as Rank_company_Name
from company_profiles

)

select * from Top_five_company_market_cap where Rank_company_name <=5;


-- 3. What is the average LTP (Last Traded Price) by sector?


select 
    sector , 
    avg(LTP) as avg_LTP 
from 
   company_price as cp 
inner join 
   company_profiles as cpr 
on 
   cp.symbol = cpr.symbol 
group by sector;


-- 4. List companies whose current LTP is higher than the previous close.

select 
    cp.symbol , 
    company_Name , 
    LTP , 
	PC 
from 
   company_price as cp 
inner join 
   company_profiles as cpr
on 
   cp.symbol = cpr.symbol 
where 
   LTP > PC;


-- 5. Show all company names and their EPS for the latest quarter.


select 
     Company_name , 
	 EPS 
from 
    fundamental_report as fr 
inner join 
    Company_profiles as cpr
on 
    fr.symbol = cpr.symbol 
where 
    report_as_of =

(

select Top 1 report_as_of as quarter_reports from fundamental_report order by quarter_reports desc

)


-- 6.List companies with LTP between 500 and 1500.

select Company_Name , 
       LTP 
from 
    Company_profiles as cpr 
inner join 
    company_price as cp
on 
  cpr.symbol = cp.symbol
where 
   LTP between 500 and 1500;


-- 7.Find the total market capitalization by sector.


select sector , 
       sum(market_cap) as Total_market_capitalization 
from 
    company_profiles 
group by 
    sector
order by 
    Total_market_capitalization desc;


-- 8.Show companies with the highest paid-up capital.


select Top 1
       company_name , 
	   paidup_capital 
from 
       company_profiles 
order by 
        paidup_capital desc;

-- or 

With Top_company_paidup_capital AS(

select company_name , paidup_capital  ,
Dense_Rank() over(order by paidup_capital desc) as Rank_company_name
from company_profiles

)

select * from Top_company_paidup_capital where Rank_company_name <=1;


-- 9.List companies with a positive change in price.


select 
    company_Name , 
	LTP , 
	PC 
from 
    Company_price as cp 
inner join 
    Company_profiles as cpr 
on 
   cp.symbol = cpr.symbol 
where 
   LTP > PC ;


-- 10.Find all sectors that have more than two companies.

select sector , 
       count(company_Name) as No_of_companies 
	   from 
	   company_profiles 
	   group by sector
	   having count(company_Name) > 2;


-- or 

With sector_more_than_two_companies AS(

select sector,Company_Name,
Dense_Rank() over(partition by sector order by company_name) as Rank_company_name
from company_profiles 

)


select distinct(sector) from sector_more_than_two_companies where Rank_company_name > 2;



-- 11.List all companies with their current LTP and latest EPS.

select 
     company_Name , 
     cp.symbol , 
	 LTP , 
	 EPS , 
	 report_as_of 
from 
    company_profiles as cp 
inner join 
    company_price as cpr on
cp.symbol = cpr.symbol 
    inner join fundamental_report as fr 
on 
   cp.symbol = fr.symbol
where 
   report_as_of = (select Top 1 report_as_of from fundamental_report order by report_as_of desc);





-- or 


With Company_Most_Latest_EPS_And_LTP AS(

select company_name , cp.symbol , LTP , EPS , report_as_of , 
Dense_Rank() over(partition by company_name order by report_as_of desc) as Rank_on_reports_as_of
from company_profiles as cpr inner join company_price as cp
on cpr.symbol = cp.symbol inner join fundamental_report as fr on cp.symbol = fr.symbol

)

select * from Company_Most_Latest_EPS_And_LTP where Rank_on_reports_as_of <=1;



-- 12.Find the average ROE by sector.


select 
    sector , 
    avg(ROE) as avg_roe 
from 
    company_profiles as cp 
inner join 
   fundamental_report as fr
on 
   cp.symbol = fr.symbol 
group by 
   sector;


-- 13.List users and how many companies are in their watchlist.


select 
    username , 
    count(w.symbol) as count_companies , 
	count(Company_name) as No_of_companies
from 
    watchlist as w 
inner join 
    company_profiles as cp 
on 
    w.symbol = cp.symbol 
group by 
    username;


-- 14.Get the total quantity of stocks bought per user.

select 
       t.username , 
       sum(quantity) as Total_quantity_stock
from 
    transaction_history as t 
inner join 
    user_profile as u 
on 
  t.username = u.username
group by 
   t.username;


-- 15.Show users who transacted in more than one company.


select 
    username , 
    count(cp.symbol) as No_of_companies , 
	count(company_name) as no_of_companies
from 
    transaction_history as th 
inner join 
   company_profiles as cp
on 
  th.symbol = cp.symbol 
group by 
  username;


-- 16.Find total investment value per user (quantity × rate).


With Total_investment_value AS(

select username , (quantity * rate) as investment_value from transaction_history

)

select 
    username , 
    sum(investment_value) as Total_investment_value 
from 
   Total_investment_value 
group by 
    username;


-- 17.List the highest transaction rate per company.

With Highest_Transaction_rate_per_company As(

select 
    Company_Name , 
    rate ,
    Dense_Rank() over(partition by Company_Name order by rate desc) as Rank_rate
from 
    transaction_history as th 
inner join 
   company_profiles as cpr 
on 
  th.symbol = cpr.symbol

)

select *  from Highest_Transaction_rate_per_company where Rank_rate <= 1;


-- 18.Show average transaction quantity per company.


select 
    company_Name , 
    avg(Quantity) as avg_quantity 
from 
   company_profiles as cpr 
inner join 
   transaction_history as th
on 
   cpr.symbol = th.symbol 
group by 
   company_Name;



-- 19.Find users who have transacted in the same company more than once.

select username , 
       company_name ,
	   count(company_name) as count_transaction_in_company
from 
       transaction_history as th 
inner join 
      company_profiles as cpr 
on th.symbol = cpr.symbol 
      group by username , company_name
having 
     count(cpr.company_name) > 1;


-- or

With user_more_than_one_trans_in_same_company AS(

select 
   username ,
   company_name ,  
   count(company_name) as No_Transaction , 
   Dense_Rank() over(partition by username order by count(company_name) desc) as Rank_company_name
from 
   transaction_history as th 
inner join 
    company_profiles as cpr 
on  
    th.symbol = cpr.symbol
group by 
     username , company_name

)

select * from user_more_than_one_trans_in_same_company where No_transaction > 1;


-- 20.Which company had the most transactions?

select 
      Top 2 
      company_Name , 
      count(th.symbol) as No_of_transactions 
from 
     transaction_history as th 
inner join 
     company_profiles as cpr
on 
     th.symbol = cpr.symbol 
group by 
     company_name
order by 
     No_of_transactions desc;


-- or 

With Company_has_most_transaction As(

select 
    Company_Name , 
    count(th.symbol) as No_of_Transactions,
    Dense_Rank() over(order by count(th.symbol) desc) as Rank_company_name
from 
    company_profiles as cpr 
inner join 
    transaction_history as th 
on
   cpr.symbol = th.symbol 
group by 
   Company_Name
)

select * from Company_has_most_transaction where Rank_company_name <= 1;


-- 21.Show companies ranked by EPS in the latest quarter.

with Company_Rank_by_EPS_in_latest_quarter AS(

select 
     report_as_of , 
     EPS , 
	 Company_Name ,
     Dense_Rank() over(partition by report_as_of order by EPS desc) as Rank_company
from 
    fundamental_report as fr 
inner join 
    company_profiles as cpr 
on 
   fr.symbol = cpr.symbol
where 
   report_as_of = 

   (select Top 1 report_as_of from fundamental_report order by report_as_of desc)

)

select * from Company_Rank_by_EPS_in_latest_quarter ;


-- 22.List the top 3 companies by trading volume.

select 
    Top 3 company_name , 
    volume 
from 
   technical_signals as t 
inner join 
   company_profiles as cpr 
on 
   t.symbol = cpr.symbol
order by 
   volume desc;



-- or 

With Top_three_volume_trade_company As(

select 
     company_name , 
	 volume , 
     Dense_Rank() over(order by volume desc) as Rank_company_name
from 
     company_profiles as cpr 
inner join 
     technical_signals as t 
on 
    cpr.symbol = t.symbol

)

select * from Top_three_volume_trade_company where Rank_company_name <= 3;


-- 23.Show the percentage change in price for each company.

select 
    company_name , 
    LTP , 
	PC ,
	case 
	    WHEN LTP > PC THEN  concat((100 - cast((cast(PC AS decimal(10,2)) * 100 / LTP) As decimal(10,2))) , ' %')
		WHEN PC > LTP THEN concat(concat('-' ,  (100 -  cast((cast(LTP AS decimal(10,2)) * 100 / PC) As decimal(10,2)))) , ' %')
   END as percentage_change
from 
   company_price as cp 
inner join 
   company_profiles as cpr 
on 
   cp.symbol = cpr.symbol;



-- 24.Show cumulative investment amount by user.


With Cumulative_investment_user AS(

select username , 
       (quantity * rate) as investment_amount 
from 
       transaction_history

)

select username , 
       sum(investment_amount) as Total_investment_amount , 
       sum(sum(investment_amount)) over(order by username) as cumulative_sumby_user
from 
        cumulative_investment_user group by username;



-- 25.Display the ROE difference between the latest two quarters.


select * from fundamental_report;




with ROE_difference_between_latest_two_quarters AS (

select company_name ,report_as_of , ROE , 
Dense_Rank() over(partition by company_name order by report_as_of desc) as Rank_on_quarter
from company_profiles as cp inner join fundamental_report as fr on cp.symbol = fr.symbol

where report_as_of in
(
select Top 2 report_as_of from 

(

select distinct(report_as_of) from fundamental_report

) AS distinct_quarter

)






)



















-- 26.Rank users based on total investment.


With investment AS(

select username , (quantity * rate) as investment from transaction_history

) 

,

Ranks_on_investment AS(

select username , sum(investment) as Total_investment from investment group by username


)


select username , Total_investment ,
Dense_Rank() over( order by Total_investment desc) as Rank_username
from Ranks_on_investment;



-- 28.Show quarterly EPS trend for each company.

select report_as_of , 
       company_name , 
	   EPS ,
       Dense_Rank() over(partition by report_as_of order by EPS desc) as Rank_on_company
from 
      fundamental_report as fr 
inner join 
      company_profiles as cpr 
on   
      fr.symbol = cpr.symbol;


-- 29.Identify companies with consistent growth in ROE.

With companies_growth_quarterwise AS(

select company_name , report_as_of  , ROE ,
Dense_Rank() over(partition by company_name order by report_as_of asc) as Rank_qurterwise
from fundamental_report as fr inner join company_profiles as cpr on fr.symbol = cpr.symbol

)

,

consistant_growth AS(

select company_name , report_as_of as current_quarter , ROE as current_quarter_ROE ,
Lead(report_as_of) over(partition by company_name order by report_as_of) as Next_quarter,
Lead(ROE) over(partition by company_name order by report_as_of asc) as Next_quarter_ROE
from companies_growth_quarterwise

)

select company_Name , current_quarter , Next_quarter , concat(current_quarter , '---->' , Next_quarter) as Tranistion , 
current_quarter_ROE , Next_quarter_ROE
from consistant_growth
where current_quarter_ROE < Next_quarter_ROE and Next_quarter_ROE is not null;



-- 31.Find companies that have not issued any dividends.


select company_name , 
       symbol 
from 
     company_profiles 
where 
     symbol 
not in 
     ( select symbol from dividend_history )


-- Logically the company will appear in dividend history table meand they issued dividend history so then above 
-- query is more logical and correct but we have data like this where company is there in dividend histort
-- but they paid 0 but its not null; so in that scenario below query is correct ;

-- so this problem statement got solved in two ways;

-- or 


select 
     distinct company_name , 
     fiscal_year , 
	 bonus_dividend , 
	 cash_dividend
from 
    dividend_history as dh 
inner join 
    company_profiles as cpr
on 
    dh.symbol = cpr.symbol 
where 
    bonus_dividend = 0 or cash_dividend = 0


-- 32.List companies with both bonus and cash dividends.

select 
     company_name , 
	 bonus_dividend , 
	 cash_dividend 
from 
    dividend_history as dh 
inner join 
    company_profiles as cpr
on 
  dh.symbol = cpr.symbol;


-- 33.Find users who have watchlisted but never transacted in a company.

select 
   distinct username 
from 
   watchlist 
where 
   username 
not in 
   ( select username from transaction_history );


-- 34.Identify companies with a decreasing EPS trend.



With company_quarterwise_eps AS(

select company_name , report_as_of , EPS ,
Dense_Rank() over(partition by company_name order by report_as_of asc) as Rank_quarterwise
from fundamental_report as fr inner join company_profiles as cpr on fr.symbol = cpr.symbol

)

,

Companies_with_decreasing_trend AS(

select company_name , report_as_of as current_quarter , EPS as current_EPS , 
Lead(report_as_of) over(partition by company_name order by report_as_of asc) as Next_quarter ,
Lead(EPS) over(partition by company_name order by report_as_of asc) as Next_quarter_EPS
from  company_quarterwise_eps

)

select company_name , current_quarter , Next_quarter , 
concat(current_quarter , ' ----> ' , Next_quarter) as Transition ,
Current_EPS , Next_quarter_EPS , 
case
    WHEN current_EPS > Next_quarter_EPS THEN 'Decresing'
END as Trend
from Companies_with_decreasing_trend
where current_EPS > Next_quarter_EPS ;



-- 35.List companies that have always had a bullish MACD signal.

select 
   company_name , 
   MACD 
from 
   technical_signals as ts 
inner join
   company_profiles as cpr 
on  
  ts.symbol = cpr.symbol 
where 
   MACD = 'bull';


-- 36.Find companies with an RSI greater than 60.


select 
   company_name , 
   RSI 
from 
   technical_signals as ts 
inner join 
   company_profiles as cpr 
on 
   ts.symbol = cpr.symbol
where 
   RSI > 60
order by 
   RSI desc;


-- or 

select 
     company_name , 
	 sum(RSI) as Total_RSI
from 
    company_profiles as cpr 
inner join 
    technical_signals as ts
on 
   cpr.symbol = ts.symbol 
group by 
    company_name
having 
   sum(RSI) > 60
order by
   Total_RSI desc;


-- 37.List users who only invested in one company.

select 
     username , 
     count(distinct(company_name)) as No_of_companies_invested 
from 
   transaction_history as th
inner join 
   company_profiles as cpr 
on 
  th.symbol = cpr.symbol
group by 
  username 
having count(distinct(company_name)) = 1;



-- 38.Identify companies that appear in more than 3 users’ watchlists.

select 
   company_name , 
   count(username) as No_of_users_watchlist 
from 
    watchlist as w 
inner join 
    company_profiles as cpr
on 
    w.symbol = cpr.symbol 
group by 
    company_name 
having  
    count(username) > 3
order by 
    No_of_users_watchlist desc;



-- or 

With company_more_than_three_watchlist AS(

select 
    company_name ,
    username , 
	Row_number() over(partition by company_name order by username asc) as Row_number_username
from 
    company_profiles as cpr  
inner join 
    watchlist as w 
on 
  cpr.symbol = w.symbol

)

select 
    company_name , 
    count(Row_number_username) as no_of_users 
from 
   company_more_than_three_watchlist
group by 
   company_name 
having 
   count(Row_number_username) > 3;




-- 40.List users who have invested in all banks.

With user_have_investment_in_all_banks AS(

select 
   username , 
   count(distinct(company_name)) as No_of_companies_invested ,
   (select count(distinct(company_name)) from company_profiles)  as Total_companies
from 
   transaction_history as t 
inner join
   company_profiles as cpr 
on 
   t.symbol = cpr.symbol 
group by 
    username

)

select 
    username 
from 
   user_have_investment_in_all_banks 
where 
   No_of_companies_invested = Total_companies;


-- 42.Which companies had news articles from more than one source?

select related_company , 
       count(sources) as No_of_sources 
from
       news 
group by 
        related_company 
having count(sources) > 2;


-- select * from company_profiles where company_name = 'NIL';


-- 43.List companies with the highest ADX values.


select 
      Top 1 company_name , 
	  sum(ADX) as Adx_value 
from 
      technical_signals as ts 
inner join 
      company_profiles as cpr
on    ts.symbol = cpr.symbol 
group by 
      company_name 
order by 
      Adx_value desc;



-- or 


With Company_with_Most_ADX As(

select 
       company_name , 
       ADX , 
       Dense_Rank() over(order by ADX desc) as Rank_adx_value
from 
       company_profiles as cpr 
inner join 
      technical_signals as ts
on 
      cpr.symbol = ts.symbol

)

select * from Company_with_Most_ADX where Rank_adx_value <= 1;

-- 44.Find all companies with an ROE higher than 15%.

select distinct company_name, 
       concat(ROE ,' %') as ROE_in_percentage 
from 
       fundamental_report as fr 
inner join 
       company_profiles as cpr
on 
      fr.symbol = cpr.symbol 
where ROE > 15;


-- 45.Which companies improved their book value in the latest quarter?


With company_improved_value AS(

select company_Name , 
       report_as_of ,
	   book_value ,
	   Dense_Rank() over(partition by company_Name order by report_as_of desc ) as Rank_on_quarter
from 
    fundamental_report as fr 
inner join 
    company_profiles as cpr 
on 
    fr.symbol = cpr.symbol

)
 , 

Next_quarter_value As(

select 
   company_Name , 
   report_as_of as Latest_quarter , 
   book_value as latest_quarter_book_value ,
   Lead(report_as_of) over(partition by company_Name order by report_as_of desc) as previous_quarter ,
   Lead(book_value) over(partition by Company_Name order by report_as_of desc) as previous_quarter_book_value
from 
   fundamental_report as fr 
inner join 
   company_profiles as cpr 
on fr.symbol = cpr.symbol


)

select * from Next_quarter_value where latest_quarter_book_value > previous_quarter_book_value and
previous_quarter_book_value is not null;


-- 47.List companies whose volume is above the average market volume.


select company_Name ,
       avg(volume) as avg_per_company ,
	   (select avg(volume) from technical_signals) as overall_avg_volume
	   from technical_signals as ts inner join company_profiles as cpr
	   on ts.symbol = cpr.symbol group by company_Name
	   having avg(volume) > (select avg(volume) from technical_signals)

-- or 

with avg_volume_greater_than_overall_avg As(

select company_Name ,
       avg(volume) as avg_per_company ,
	   (select avg(volume) from technical_signals) as overall_avg_volume
	   from technical_signals as ts inner join company_profiles as cpr
	   on ts.symbol = cpr.symbol group by company_Name
)

select company_Name ,avg_per_company , overall_avg_volume from avg_volume_greater_than_overall_avg
where avg_per_company > overall_avg_volume;


-- 48.Which company had the earliest and latest transaction?


select company_name , Transaction_date as Earliest_transaction_date  from transaction_history as th inner join 
company_profiles as cpr on th.symbol = cpr.symbol
where transaction_date = 
(select min(Transaction_date) from transaction_history)

union 

select company_Name , Transaction_date as Latest_transaction_date from transaction_history as th inner join company_profiles as cpr
on th.symbol = cpr.symbol where transaction_date = 
( select max(transaction_date) from transaction_history )


-- or 



With earliest_and_latest_transactions AS(

select company_Name , 
       Transaction_date ,
	   Dense_Rank() over( order by Transaction_Date asc) as Rank_transaction_date
	   from transaction_history as th inner join company_profiles as cpr
	   on th.symbol = cpr.symbol

) 


select company_Name , Transaction_date from earliest_and_latest_transactions where Rank_Transaction_date =
 ( select min(Rank_transaction_date) from earliest_and_latest_transactions )



union 


select company_Name , transaction_date from earliest_and_latest_transactions where Rank_transaction_date
= (select max(Rank_transaction_date) from earliest_and_latest_transactions)





-- 49.List users who invested after a news article was published about that company.


select 
    username,related_company , 
    news_date , 
	transaction_date 
from 
    news as n 
inner join 
    transaction_history as th
on 
    n.related_company = th.symbol
where 
    news_date <
    All (select transaction_date from transaction_history where n.related_company = symbol);

