-- Create database;

create database pharma_ERP;


-- Use database;

use pharma_ERP;


-- creation of tables;


Create table Drug(

           DrugID int primary key ,
		   DrugName varchar(100) Not null ,
		   Manufacturer varchar(50) Not null ,
		   ExpiryDate Date Not null ,
		   StockQuantity int Not null ,
		   Unitprice float not null ,
		   Dosage varchar(50) Not null ,
		   Description varchar(200) Not null

		   );


create table Supplier(

           SupplierID int primary key ,
		   SupplierName varchar(100) Not null ,
		   ContactPerson varchar(100) Not null ,
		   PhoneNumber_supplier varchar(20) Not null ,
		   Email_supplier varchar(30) Not Null

		 );



create table Customer(

           CustomerID int primary key ,
		   FirstName varchar(30) Not null ,
		   LastName varchar(30) Not null ,
		   Address varchar(300) Not null ,
		   PhoneNumber_customer varchar(20) Not null ,
		   Email_customer varchar(30) Not null 

		);



create table Doctor(

           DoctorID int primary key ,
		   DoctorName varchar(30) Not null ,
		   Specialization varchar(30) Not null ,
		   PhoneNumber_Doctor varchar(20) Not null ,
		   Email_doctor varchar(30) not null ,
		   HospitalName varchar(30) Not null

		   );



create table prescription(


           PrescriptionID int primary key ,
		   CustomerID int Not null ,
		   DoctorID int Not null ,
		   IssueDate Date Not null ,
		   ExpiryDate_prescription Date Not null ,
		   Diagnosis  int Not null ,
		   foreign key (customerID) references Customer(CustomerID),
		   foreign key (DoctorID) references  Doctor(DoctorID)

		   );

           

Create table Prescriptiondetail(


             DetailID int primary key ,
			 PrescriptionID int Not null ,
			 DrugID int not null ,
			 Quantity int not null ,
			 foreign key (PrescriptionID) references Prescription(PrescriptionID),
			 foreign key (DrugID) references Drug(DrugID)

			 );


Create table Sale(


             SaleID int primary key ,
			 CustomerID int Not null ,
			 SaleDate Date Not null ,
			 TotalAmount float not null ,
			 foreign key (CustomerID) references Customer(CustomerID)

			 );

-- drop table saledetail;


Create table SaleDetail(

             DetailID int primary key ,
			 SaleID int Not Null ,
			 DrugID int Not null ,
			 Quantity int Not null ,
			 unitPrice float Not Null ,
			 Subtotal float Not null ,
			 foreign key (SaleID) references Sale(SaleID),
			 foreign key (DrugID) references Drug(DrugID)

			 );


Create table StockTransaction(


             TransactionID int primary key ,
			 DrugID int Not null ,
			 Transaction_Type varchar(30) Not null ,
			 TransactionDate Date Not null ,
			 Quantity int Not null ,
			 RemainingStock int Not null,
			 foreign key (DrugID) references Drug(DrugID)

			 );




--- Check all tables are clearly placed in database;



select Distinct(table_name) from information_schema.columns;


-- Data Analysis


-- 1. Monthly/weekly/daily total sales and revenue breakdown.


-- daily;


select 
   SaleDate , 
   sum(TotalAmount) as Total_Amount
from 
   sale 
group by 
   saleDate
order by 
   saleDate asc;


-- Monthly

select 
   Datename(month , saleDate) as Month ,
   Datename(year ,  saleDate) as Year ,
   sum(TotalAmount) as Total_Amount
from 
   sale
group by 
   Datename(month , saleDate),
   Datename(year , SaleDate)
order by 
   year asc;


-- yearly

select 
    Datename(year , saleDate) as Year ,
	cast(sum(TotalAmount) AS decimal(10,2)) as Total_Amount 
from 
    sale
group by 
    Datename(year , saleDate)
order by 
    Year asc;


-- 2. Top 10 best-selling drugs by revenue and volume.


With Top_10_selling_drugs AS(

select 
    D.DrugID , 
	DrugName , 
	sum(sd.unitprice * Quantity) as Total_revenue , 
	sum(Quantity) as volume ,
    Dense_Rank() over(order by sum(sd.unitprice * quantity) desc , sum(quantity) desc) as Rank_revenue_volume
from 
    Drug as D 
inner join 
    saledetail as sd 
on 
    D.drugID = sd.DrugID
inner join 
    sale as s 
on 
    s.saleID = sd.saleID 
group 
    by D.drugID , DrugName

)

select * from Top_10_selling_drugs where Rank_revenue_volume <= 10;


-- or 


select 
   Top 10 D.DrugID , 
   DrugName , 
   sum(sd.unitprice * Quantity) as Total_revenue , 
   sum(Quantity) as volume
from 
   Drug as D 
inner join 
  saledetail as sd 
on 
  D.drugID = sd.DrugID
inner join 
  sale as s 
on 
  s.saleID = sd.saleID 
group by 
  D.drugID , DrugName
order by 
  Total_revenue desc , volume desc;



-- 3.Identify slow-moving drugs (bottom 10% sales).



With slow_moving_drugs AS(

select 
    sd.DrugID , 
	DrugName , 
	sum(subtotal) as Drug_Total_amount 
from 
    SaleDetail 
as 
  sd 
inner join 
  drug as d 
on 
  sd.DrugID = d.DrugID
group by 
  sd.DrugID , DrugName

)

,

sale_percentage_drug AS(

select 
    DrugID , 
	DrugName , 
	Drug_Total_amount , 
	(select sum(subtotal) from saledetail) as Total_amount ,
    cast(Drug_Total_amount AS decimal(10,2)) * 100 / (select sum(subtotal) from saledetail) 
as 
    overall_Drug_Sale_percentage
from 
    slow_moving_drugs

)

,

bottom_10_percentage_drugs_sale AS(

select * ,
    sum(overall_Drug_Sale_percentage) over(order by overall_Drug_Sale_percentage asc) 
as 
    cummulative_Sales_percentage
from 
     sale_percentage_drug

)


select * from bottom_10_percentage_drugs_sale where cummulative_Sales_percentage <= 10;



-- 4.Year-over-year growth in sales and revenue.


With Sales_growth_over_year AS(

select 
   year(SaleDate) as Year , 
   sum(TotalAmount) as Total_Amount 
from 
   sale group by year(SaleDate)
)

,

Next_year_Sales AS(

select year , Total_Amount , Lead(Total_Amount) over(order by year asc) as Next_year_Sale
from Sales_growth_over_year

)
,

Growth AS(

select * , cast(Next_year_Sale - Total_Amount AS decimal(10,2)) as Growth from Next_year_Sales

)


select * , 
      case
      WHEN Total_Amount is not null and Next_year_Sale is not null THEN  cast(growth AS decimal(10,2)) * 100 / Total_Amount
	  END AS Growth_percentage from Growth;



-- 7. Customer repeat purchase rate.


With customer_repetation_rate AS(


select CustomerID ,  DrugID , count(customerID) as Number_of_times_repeated_purchase
 from sale as s inner join saledetail as sd on s.saleID = sd.saleID
 group by CustomerID , DrugID 

 )
,

Drug_total_purchase AS(

select CustomerID , cr.DrugID  , Number_of_times_repeated_purchase  ,  (select count(DrugID) from saledetail
where DrugID = cr.DrugID) 
as Total_Customer_puchase_current_drug
from customer_repetation_rate  as cr

) 

select * , cast(Number_of_times_repeated_purchase AS decimal(10,2)) * 100 / Total_Customer_puchase_current_drug
as customer_repetation_rate 
from Drug_total_purchase


-- 8. Cohort analysis: retention rate by first month of purchase.

select * from sale;
select * from saledetail;


With first_purchase AS(

select customerID , concat(min(Datename(month , SaleDate)) ,'   ' , min(Datename(Year , SaleDate))) as first_purchase
from sale 
group by customerID 

)


select customerID from first_purchase where first_purchase = 'January  2024'
and customerID in (select customerID from sale where Datename(month , saledate) = 'February' 
and Datename(year , saledate) = '2024')



select first_purchase , count(customerID) as No_of_customers from first_purchase group by first_purchase;



-- or 

with first_purchasing AS(

select customerID  , saledate , 
Dense_Rank() over(partition by customerID order by saledate asc) as Rank_date
from sale
)

select * from first_purchasing where Rank_date <= 1;



-- 9.Identify black-sheep customers (very low or high spenders).

-- very low spenders

select 
    CustomerID , 
	sum(subtotal) as Total_Sales 
from 
   sale 
as 
  s 
inner join 
  saledetail 
as 
  sd
on 
  s.saleID = sd.saleID
group by 
  CustomerID 
having 
  sum(subtotal) < (select avg(subtotal) as avg_sale from saledetail);



-- or 


With customer_total_sales As(

select 
    CustomerID , 
	sum(subtotal) as Total_Sales 
from 
   sale 
as 
  s 
inner join 
  saledetail 
as 
  sd
on 
  s.saleID = sd.saleID
group by 
  CustomerID 

)

select customerid , total_Sales from customer_total_Sales where total_Sales < (select avg(subtotal) from saledetail)


-- very high spenders

select 
    CustomerID , 
	sum(subtotal) as Total_Sales 
from saledetail 
as 
  sd 
inner join 
   sale 
as 
  s 
on 
  sd.saleID = sd.saleID
group by 
  customerID 
having 
     sum(subtotal) > (select avg(subtotal) from saledetail);


-- or 


With high_spenders AS(
select 
    CustomerID , 
	sum(subtotal) as Total_Sales 
from saledetail 
as 
  sd 
inner join 
   sale 
as 
  s 
on 
  sd.saleID = sd.saleID
group by 
  customerID 

)


select customerID , Total_Sales from high_spenders where Total_Sales > (select avg(subtotal) from saledetail)



-- 1.Top-selling drugs overall by revenue (SaleDetail).

select 
    Top 5
    D.DrugID , 
	DrugName , 
	sum(subtotal) as Total_revenue 
from 
    drug  as D
inner join 
    saledetail 
as 
    sd 
on 
D.drugID = sd.drugID 
    group by 
D.DrugID , DrugName
order by 
    Total_revenue desc;


-- or 

With Top_5_selling_drug AS(

select 
    D.DrugID ,
	DrugName ,
	sum(subtotal) as Total_revenue ,
	Dense_Rank() over(order by sum(subtotal) desc) as Rank_revenue
from 
    drug 
as 
    d 
inner join 
    saledetail 
as 
    sd 
on 
    d.drugID = sd.drugID
group by 
    D.DrugID , DrugName

)

select * from Top_5_selling_drug where Rank_revenue <= 5;

-- 2.Top-selling drugs by quantity sold.


select 
    Top 7
    DrugID , 
	sum(quantity) as quantity_sold 
from 
   saledetail 
group by 
   DrugID
order by
   quantity_sold desc;


-- or 

With Top_5_quantity_sold_drugs AS(

select D.DrugID , DrugName , sum(Quantity) as Total_quantity ,
Dense_Rank() over(order by sum(Quantity) desc) as Rank_total_quantity
from Drug as D inner join saledetail as sd on
D.drugID = sd.drugID group by D.DrugID , DrugName

)

select * from Top_5_quantity_sold_drugs where Rank_total_quantity <= 5;


-- 3.Monthly sales trend across all drugs.


select 
     concat(Datename(month , saledate) , '  ' , Datename(Year , SaleDate)) as month_year ,
     sum(subtotal) as Total_Sales 
from 
     saledetail as sd 
inner join 
     sale 
as 
     s 
on 
     s.saleID = sd.saleID
group by 
     concat(Datename(month , saledate) , '  ' , Datename(year , saledate))
order by 
     Total_Sales desc;


-- 4.Daily or hourly peak sales times

select 
    SaleDate , 
	sum(subtotal) as Total_Sales 
from 
    sale as s 
inner join 
    saledetail as sd 
on 
    s.saleID = sd.saleID 
group by 
    SaleDate 
order by 
    Total_Sales desc;


-- If u want high Sale Date just put Top 1;


-- or 


select 
    SaleDate ,
    sum(subtotal) as Total_Sales,
	Dense_Rank() over(order by sum(subtotal) desc) as Rank_SaleDate
from 
    Sale 
as  
     s 
inner join 
    Saledetail 
as  
   sd
on 
    s.saleID = sd.saleID
group by 
    SaleDate

-- if u want to high sale date then just put CTE and put where clause and extract Rank 1;


-- 5.Sales breakdown by OTC vs. Prescription drugs

-- Non Prescribed Drugs Sale

With Non_prescribed_sale AS(


select 
  DrugID 
from 
  Drug 
where 
  drugID not in (select Distinct(drugID) from prescriptiondetail)

)


select 
   Nps.DrugID , 
   sum(subtotal) as Total_Sales 
from 
   Non_prescribed_sale as nps 
left join 
   saledetail as sd
on 
   nps.DrugID = sd.DrugID 
group by 
   Nps.DrugID;


-- Prescribed_Drug_Sale;


select 
   pd.DrugID  , 
   sum(subtotal) as Total_Sale 
from 
   prescriptiondetail as pd 
left join 
   saledetail as sd
on 
   pd.drugID = sd.drugID 
group by 
   pd.DrugID;



-- 6.Average transaction size** per sale (`Sale.TotalAmount`).


With avg_transaction_size AS(

select 
   SaleID , 
   sum(subtotal) as Total_Sales 
from 
   saledetail 
group by 
   SaleID 

)

select avg(Total_Sales) as avg_total_Sales from avg_transaction_size;


-- 7.Number of sales per customer** over a given period.

select * from saledetail;

select 
    customerID , 
	count(sd.SaleID) as Total_Sales 
from 
    saledetail as sd 
inner join 
   sale as s 
on 
   sd.saleID = s.saleID
where 
    saleDate between '2024-02-01'
and  
    '2024-08-24'
group by 
   customerID 


-- 8.Customer lifetime value (LTV)** — total spend per customer.


select 
   c.customerID ,
   sum(subtotal) as Total_Sales
from 
   customer as c inner join sale as s
on 
   c.customerID = s.customerID
inner join 
   saledetail as sd 
on 
   s.saleID = sd.saleID
group by 
   c.customerID;


-- 9.Repeat purchase rate** — % of sales from returning customers.

-- we calculate repeat purchasing rate based on overall customers not about any product


With customer_repetation_rate AS(

select 
     customerID , 
	 count(customerID) as No_of_customers_purchase_more_than_one from sale
group by 
     customerID
having 
     count(customerID) > 1

)
,

more_than_one_purchase_customer AS(

select count(customerID) as No_of_customers from customer_repetation_rate

)


select 
    cast(No_of_customers AS decimal(10,2)) * 100 / (select count(distinct customerID) from sale) 
from more_than_one_purchase_customer;




-- 10.Average days between repeat purchases** per customer.



With customer_purchase_date AS(


select customerID ,
       SaleDate ,
	   Dense_Rank() over(partition by customerID order by saledate asc) as Rank_saledate
	   from sale

)
,

Next_purchase_Date AS(

select customerID , saleDate as First_saleDate ,
       Lead(SaleDate) over(partition by customerID order by saledate asc) as Next_purchase_date
	   from customer_purchase_date

)

,


Avg_days_between_purchase AS(


select customerID ,
       Datediff(Day , First_Saledate  , Next_purchase_date) as difference_days
	   from Next_purchase_date where Next_purchase_date is not null

)


select customerID ,
       avg(difference_days) as difference_days
	   from avg_days_between_purchase 
	   group by customerID;



-- 11.Top-prescribed drugs

select 
   Top 15
   DrugID , 
   count(DrugID) as No_of_times_prescribed 
from 
    prescriptiondetail 
group by 
    DrugID 
order by 
    No_of_times_prescribed desc;


-- or 

With Top_prescribed_drug AS(

select DrugName , 
     count(prescriptionID) as No_of_prescription,
	 Dense_Rank() over(order by count(prescriptionID) desc) as Rank_drug_prescription
	 from prescriptiondetail as p inner join Drug as d on p.drugID = d.drugID
	 group by DrugName

)

select * from Top_prescribed_drug where Rank_drug_prescription <= 3;



-- 12.Top-prescribing doctors** by prescription count.

select 
     Top 3
     D.DoctorName , 
	 count(p.DoctorID) as No_of_times_doctor_prescribed 
from 
     prescription as p 
inner join 
     Doctor as d
on 
     p.doctorID = d.doctorID
group by 
     D.DoctorName
order by 
     No_of_times_doctor_prescribed desc;


-- or 

With Top_prescribed_doctors AS(

select 
   DoctorName ,
   count(p.DoctorID) as No_of_times_prescribed_doctors,
   Dense_Rank() over(order by count(p.DoctorID) desc) as Rank_doctor
   from Doctor as d inner join prescription as p on d.doctorID = p.doctorID
   group by DoctorName

)

select * from Top_prescribed_doctors where Rank_doctor <= 3;


-- 13.Total sales from prescription orders


select 
    p.DrugID , 
	p.Quantity , 
	UnitPrice , 
	(p.Quantity *unitPrice) as Total_Sales 
from 
    prescriptiondetail 
as 
    p 
inner join 
    saledetail as sd 
on 
    p.drugID = sd.drugID
order by 
    Total_Sales desc;


-- or 



select 
     p.DrugID , 
	 p.Quantity , 
	 UnitPrice , 
	 (p.Quantity * UnitPrice) as Total_Sales_prescried_drugs,
     Dense_Rank() over(order by (p.Quantity * UnitPrice) desc) as Rank_prescribed_drug_sales
from 
     prescriptiondetail as p 
inner join 
     saledetail as sd 
on 
     p.drugID = sd.drugID


-- 14.Average prescription size** (quantity of drugs per prescription).

with Quantity_drugs_per_prescription AS(

select 
    PrescriptionID , 
	sum(Quantity) as Total_Quantity , 
	Dense_Rank() over(order by sum(Quantity) desc) as Rank_drugsize
from 
    prescriptiondetail 
group by 
    PrescriptionID

)

select avg(Total_Quantity) as avg_prescription_size from Quantity_drugs_per_prescription;


-- 15.Prescription fulfillment rate** — how many prescriptions resulted in a sale.

With prescribed_quantity AS(

select 
    DrugID , 
	sum(Quantity) as Total_quantity_prescribed 
from 
    prescriptiondetail group by DrugID

)
,

Total_Quantity_buy AS(

select 
    DrugID , 
	sum(Quantity) as Total_quantity_buy 
from 
    saledetail group by DrugID

)


select 
    pq.DrugID , 
	Total_quantity_buy , 
	Total_quantity_prescribed , 
    concat(cast(Total_quantity_buy AS decimal(10,2)) * 100 / Nullif(Total_quantity_prescribed ,0) , ' %') AS prescription_fulfil_rate
from 
    prescribed_quantity as pq
inner join 
    Total_Quantity_buy as tqb 
on 
    pq.DrugID = tqb.drugID


-- 16. Average time between prescription issue and sale

With Avg_time_between_prescription_issue_and_sale AS(

select 
    p.prescriptionID , 
	pd.DrugID , 
	IssueDate , 
	SaleDate , 
	Datediff(Day , IssueDate , SaleDate) as Datedifference
from 
    prescription as p 
inner join 
    prescriptiondetail as pd 
on 
    p.prescriptionID = pd.prescriptionID
inner join 
    saledetail as sd 
on 
    pd.DrugID = sd.DrugID 
inner join 
    sale as s 
on 
    sd.saleID = s.saleID

)

-- if looking for overall avg

--select avg(Datedifference) as avg_time from avg_time_between_prescription_issue_and_sale;

-- if looking for per perscription;

select prescriptionID , avg(Datedifference) from Avg_time_between_prescription_issue_and_sale
group by prescriptionID;


-- 17. Expired prescriptions** — prescriptions past expiry date.


select 
    distinct DrugID , 
	expiryDate 
from 
    prescriptiondetail as pd 
inner join 
    prescription as p
on 
    pd.prescriptionID = p.prescriptionID
where 
    expiryDate < Getdate() and
    DrugID not in (select DrugID from saledetail)


-- 18.Top OTC drugs** by sales and quantity

select Top 5
    D.DrugID , 
    sum(Quantity) as Total_quantity , 
	sum(Subtotal) as Total_Sale 
from 
    Drug as d 
inner join 
    saledetail as sd 
on 
    d.drugID = sd.drugID 
where 
    D.DrugID not in 
   (select Distinct DrugID from prescriptiondetail) 
group by 
    D.DrugID
order by 
     Total_Quantity desc , Total_Sale desc;


-- 19.OTC-only customers** — who never use prescriptions.

With Customer_never_use_prescription AS(

select 
    customerId , 
	concat(FirstName , ' ' , LastName) as Name  
from 
    customer 
where 
    customerID 
not in
    (select customerID from prescription)

)

select 
    distinct c.customerID  , 
	DrugID , 
	subtotal 
from 
    customer_never_use_prescription 
as 
    c 
inner join 
    sale 
as 
    s 
on 
    c.customerID = s.customerID
inner join 
   saledetail 
as 
   sd 
on 
   s.saleID = sd.saleID;



-- 20.Current stock levels** — `StockTransaction.RemainingStock` for each drug.


select 
    D.DrugID , 
	DrugName , 
	sum(RemainingStock) as Total_remaining_stock
from 
    Drug 
as 
    d 
inner join  
    stocktransaction 
as 
    st 
on
    D.drugID = st.DrugID 
group by 
    D.drugID , DrugName;



-- 21.Fastest-moving stock items** — highest turnover rate.


With Stock_Details AS(

select 
   st.DrugID , 
   sum(st.Quantity) as Transaction_quantity_or_recieved_quantity , 
   sum(sd.Quantity) as Sold_quantity , 
   sum(RemainingStock) as RemainingStock
from 
   stocktransaction as st 
left join 
   saledetail 
as 
   sd 
on 
   st.DrugID =  sd.DrugID
group by 
   st.DrugID 

)

,

Highest_moving_rate AS(

select 
    DrugID , 
	Transaction_quantity_or_recieved_quantity , 
	sold_quantity , 
	RemainingStock , 
    cast(Sold_Quantity AS decimal(10,2)) * 100 / Transaction_quantity_or_recieved_quantity as Turnover_rate ,
    Dense_Rank() over(order by cast(Sold_Quantity AS decimal(10,2)) * 100 / Transaction_quantity_or_recieved_quantity desc)
as 
    Rank_turnover_rate
from 
    stock_details 
where
    Transaction_quantity_or_recieved_quantity != 0


)


select * from Highest_moving_rate where Rank_turnover_rate  <= 1;


-- 25.Stock run-outs** — times when stock dropped to zero.

select 
    * 
from 
    stockTransaction 
where 
    Remainingstock = 0
order by 
    TransactionDate asc;


-- 26.Expired stock report** — drugs past `ExpiryDate` still in stock.


select 
    pd.DrugID  , 
	ExpiryDate , 
	RemainingStock  
from 
    prescription 
as 
    p 
inner join 
    prescriptiondetail 
as 
    pd 
on 
    p.prescriptionID = pd.prescriptionID 
inner join 
    StockTransaction 
as 
    st 
on  pd.DrugID = st.DrugID
where 
    ExpiryDate < Getdate()
and 
    RemainingStock > 0;


-- 27.High-value customers** (top spenders) and their purchase behavior.

select 
    c.customerID , 
	concat(FirstName , ' ' , LastName) as Name , 
	sum(Subtotal) as Total_Sale 
from 
   customer 
as 
   c 
left join 
   Sale 
as 
   s 
on 
   c.customerID = s.customerID
left join 
   saledetail 
as 
   sd 
on 
   s.saleID = sd.saleID
group by 
   c.customerID ,
   concat(FirstName , ' ', LastName)
order by 
   Total_Sale desc;


-- Here basically inner join is appropriate because we want those customers . Which have sales so we need to mention inner join 
-- but we intentionally mention left join for understanding how it works and how many customers are not make sale
-- but inner join is right option for this . we make inentionally left join so don't use left join here.


-- 30.Low-value/One-time customers

select 
    c.customerID , 
	concat(FirstName , '  ' , LastName) as Name,
	count(SaleID) as No_of_times_customer_purchase 
from 
   sale 
as 
   s 
inner join 
   customer 
as 
   c
on 
   s.customerID = c.customerID
group by 
   c.customerID  , 
   FirstName , 
   LastName
having 
   count(SaleID) = 1;




-- 31.Customer segmentation** by spend and frequency.


With customer_Segmentattion AS(

select 
    c.customerID , 
	concat(FirstName , '  ' , lastName) as Name ,
    count(Distinct(sd.SaleID)) as Total_purchase_times , 
	sum(Subtotal) as Total_Sales ,

case
    WHEN count(Distinct (sd.SaleID)) = 1 THEN '1'
	WHEN count(Distinct(sd.SaleID)) between 2 and 10 THEN '2-10'
	WHEN count(Distinct(sd.SaleID)) > 10 THEN '10+'
END as purchase_segmentation ,

case 
    WHEN sum(Subtotal) < 100 THEN '< 100'
	WHEN sum(subtotal) between 100 and 1000 THEN '100 - 1000'
	WHEN sum(subtotal) between 1001 and 10000 THEN '1001 - 10000'
	WHEN sum(subtotal) > 10000 THEN '10000 +'
END as Total_Sales_Segmentation
from 
   customer 
as 
   c 
inner join 
   sale 
as 
   s 
on
   c.customerID = s.CustomerID 
inner join 
   Saledetail 
as 
   sd 
on 
   s.saleID = sd.saleID
group by 
   c.customerID , FirstName , lastName


)

select 
   purchase_segmentation , 
   Total_Sales_Segmentation ,
   count(customerID) as No_of_customers
from 
   customer_segmentattion 
group by 
   purchase_segmentation , Total_Sales_Segmentation;


-- 32.Geographical purchase patterns (if `Address` or region data available).


select 
    Address , 
	sum(Subtotal) as Total_Sales
from 
    customer 
as 
    c 
inner join 
    sale 
as 
    s 
on 
    c.customerID = s.customerID
inner join 
    saledetail 
as 
    sd 
on  
    s.saleID = sd.saleID 
group by 
    Address;


-- 33.Average price per unit sold**, by drug.


select 
    D.DrugID , 
	avg(subtotal) as avg_total_sales 
from 
    Drug 
as 
    d 
inner join 
   saledetail 
as 
   sd 
on 
   d.drugID = sd.drugID
inner join 
   sale 
as 
   s 
on 
   sd.saleID = s.saleID 
group by 
   D.DrugID;


-- 34.Sales growth month-over-month** across all products.


with Sales_per_month As(

select 
    month(SaleDate) as Month ,
	Year(SaleDate) as Year,
	sum(subtotal) as Total_Sale_month
from 
    sale 
as 
    s 
inner join 
    saledetail 
as 
    sd 
on 
    s.saleID = sd.saleID
group by 
   Month(SaleDate) ,
   Year(SaleDate)
--order by Year asc , month asc

)

,

Growth_Sales AS(


select 
    Month , 
	Year , 
	Total_Sale_month as Current_month_Sale ,
    Lead(Total_Sale_month) over(order by Year asc , Month asc ) as Next_month_Sale
from 
    Sales_per_month 

)


select Month , Year , Current_month_Sale , Next_month_Sale , 
Next_month_Sale - Current_month_Sale as Total_growth_monthwise
from Growth_Sales;



-- 35.Year-over-year growth** for prescription.

with No_of_prescription AS(

select  Year(IssueDate) as Year , count(PrescriptionID) as Total_no_of_prescriptions from prescription group by 
Year(IssueDate)

)
,
Year_wise_prescriptions AS(

select Year , sum(Total_no_of_prescriptions) as No_of_prescriptions from No_of_prescription group by Year

)
,
Growth_prescriptions AS(

select Year , No_of_prescriptions as Current_year_prescriptions , 
Lead(No_of_prescriptions) over(order by year asc) as Next_year_prescriptions
from Year_wise_prescriptions
)
,

Growth_prescriptions_percentage AS(

select * , Next_year_prescriptions - Current_year_prescriptions as No_of_Growth_prescriptions ,
case
    WHEN Next_year_prescriptions - Current_year_prescriptions > 0 THEN 'Growth'
    WHEN Next_year_prescriptions - Current_year_prescriptions < 0 THEN 'Decline Growth'
	Else 'No Change'

END AS Growth_Status
from Growth_prescriptions where Next_year_prescriptions is not null

)


select * , Round(No_of_growth_prescriptions * 100 / Nullif(Current_year_prescriptions , 0) , 2)
AS Growth_percentage
from Growth_prescriptions_percentage;


-- 36.Customer cohort analysis -- track first-purchase month cohorts and retention.


With customer_Saledate_Analysis AS(

select customerID , SaleID ,
Dense_Rank() over(partition by customerID order by SaleID asc) as Rank_saleID
from sale

)
,
customer_min_and_max_occurance AS(

select customerID ,  
min(Rank_SaleID) as min_time_occurance , max(Rank_SaleID) as max_time_occurance
from customer_saledate_Analysis group by customerID

) 

,

Retention_Rate AS(

select customerID ,  min_time_occurance , max_time_occurance , 
case
    WHEN min_time_occurance = max_time_occurance THEN 0
	WHEN min_time_occurance != max_time_occurance THEN max_time_occurance - min_time_occurance
END AS Repeat_visit
from customer_min_and_max_occurance

)

select customerID , min_time_occurance , max_time_occurance ,Repeat_visit ,
Round(Repeat_visit * 100 / max_time_occurance  , 2)
AS Retention_Rate
from Retention_Rate order by Retention_Rate desc;
