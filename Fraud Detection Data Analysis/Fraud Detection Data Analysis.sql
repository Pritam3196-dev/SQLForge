-- Create database ;

create database Fraud_detection_sql;


-- Use Fraud detection sql project;

Use Fraud_detection_sql ;


--- Create tables 


create table card_holder(

             id int primary key ,
			 Name varchar(50) NOT NULL 


) , 




create table credit_card(


             card int primary key , 
			 card_holder_id int NOT NULL , 
			 foreign key (card_holder_id) references card_holder(id)

) ,






create table Merchant_category(

             Merchant_category_id int primary key ,
			 Merchant_Category_Name varchar(30) not null 

) ,




create table Merchant(


              merchant_id int primary key , 
			  name varchar(260) NOT NULL ,
			  merchant_category_id int not null ,
			  foreign key (merchant_category_id) references Merchant_Category(Merchant_Category_id)

) ,





Create table Transaction(



             Transaction_id int primary key ,
			 Transaction_Date TIMESTAMP NOT NULL ,
			 amount float NOT NULL , 
			 card int NOT NULL ,
			 merchant_id int not null , 
			 foreign key (card) references credit_card(card) ,
			 foreign key (merchant_id) references Merchant(merchant_id)

);


-- Now insert into transaction table
INSERT INTO transaction (Transaction_id, Transaction_Date, amount, card, merchant_id)
VALUES (1, now(), 100.50, '3561954487988605', 1);



--  Check tables 

