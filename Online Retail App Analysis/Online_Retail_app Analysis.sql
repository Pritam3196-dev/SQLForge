-- Create database ;

Create database online_retail_app;

-- Use database

Use online_retail_app;


-- Create tables;

Create table user_login( User_id varchar(10) primary key ,
                         User_password varchar(20),
						 First_name varchar(20),
						 Last_name varchar(20),
						 sign_up_on Date ,
						 Email_id varchar(30));


Create table Customers(customer_id varchar(10) primary key ,
                       customer_password varchar(20) ,
					   First_name varchar(20),
					   Last_name varchar(20),
					   sign_up_on Date ,
					   Email_id varchar(20),
					   contact varchar(10),
					   last_login Datetime);

--Alter table Customers alter column Email_id varchar(50);


Create table Employment_Type(Employment_type_id varchar(10) primary key ,
                             Employment_type varchar(20),
							 Internal_Employee BIT ,
							 vendor_name varchar(20));



Create table Employees(Employee_id varchar(10) primary key ,
                       Employee_type_id varchar(10),
					   First_name varchar(20),
					   Last_name varchar(20),
					   registered_on Date ,
					   Email_id varchar(30),
					   contact varchar(10),
					   contract_expiry Date,
					   Foreign key (Employee_type_id) references Employment_Type(Employment_type_id));


-- Alter table Employees alter column Email_id varchar(50);




Create table payment(payment_id varchar(10) primary key ,
                     Total_amount float ,
					 Payment_mode varchar(20),
					 paid_on Datetime ,
					 IS_successful BIT);



Create table Orders(Order_id varchar(10) primary key ,
                    Ordered_by varchar(10) ,
					payment_id varchar(10),
					IS_delivered BIT ,
					Delivery_date Date ,
					delivered_by varchar(10),
					Foreign key (Ordered_by) references customers(customer_id),
					Foreign key (payment_id) references payment(payment_id),
					Foreign key (delivered_by) references Employees(Employee_id));



Create table Product_items(Item_id varchar(10) primary key ,
                         item_code varchar(10) ,
						 Item_name varchar(20),
						 Item_type varchar(30),
						 Item_description varchar(100),
						 sold_by varchar(10) ,
						 amount float ,
						 Discount Float ,
						 Stock_count INT);


-- Exec sp_rename 'Product_items.Stock_acount' , 'Stock_amount';



Create table Order_items(Order_Item_id int IDENTITY(1,1) primary key ,
                         item_id varchar(10) ,
						 order_id varchar(10),
						 Foreign key (Item_id) references Product_Items(Item_id) ,
						 Foreign key (order_id) references orders(order_id));




Create table Order_delivery(Row_id int identity(1,1) primary key ,
                            order_id varchar(10) ,
							delivery_stage varchar(20),
							foreign key (order_id) references orders(order_id));
                         
                         



--- Check Table;


Select distinct(Table_name) from information_schema.columns;
select * from user_login;



Insert into User_login(User_id , User_password , First_name ,Last_name ,sign_up_on , Email_id)
            values
('U001', 'pass1234', 'John', 'Doe', '2023-01-10', 'john.doe@example.com'),
('U002', 'abc5678', 'Jane', 'Smith', '2023-02-12', 'jane.smith@example.com'),
('U003', 'hello1234', 'Emily', 'Brown', '2023-03-05', 'emily.brown@example.com'),
('U004', 'mypassword', 'Michael', 'Johnson', '2023-04-10', 'michael.johnson@example.com'),
('U005', 'securepass1', 'Sarah', 'Davis', '2023-05-15', 'sarah.davis@example.com'),
('U006', 'securepassword2', 'James', 'Miller', '2023-06-01', 'james.miller@example.com'),
('U007', 'mypassword456', 'Lily', 'Taylor', '2023-06-02', 'lily.taylor@example.com'),
('U008', 'qwerty123', 'Jack', 'Wilson', '2023-06-05', 'jack.wilson@example.com'),
('U009', 'password1234', 'Grace', 'Moore', '2023-06-08', 'grace.moore@example.com'),
('U010', 'abc1234pass', 'Lucas', 'Martinez', '2023-06-10', 'lucas.martinez@example.com'),
('U011', 'strongpass1', 'Olivia', 'Hernandez', '2023-06-12', 'olivia.hernandez@example.com'),
('U012', '1234abcd', 'William', 'Lopez', '2023-06-13', 'william.lopez@example.com'),
('U013', 'securepass123', 'Sophia', 'Gonzalez', '2023-06-15', 'sophia.gonzalez@example.com'),
('U014', 'password7890', 'Ethan', 'Jackson', '2023-06-16', 'ethan.jackson@example.com'),
('U015', 'mypassword987', 'Chloe', 'Adams', '2023-06-18', 'chloe.adams@example.com'),
('U016', 'abc12345', 'Mason', 'Nelson', '2023-06-20', 'mason.nelson@example.com'),
('U017', 'qwerty5678', 'Harper', 'Lee', '2023-06-22', 'harper.lee@example.com'),
('U018', 'securekey1234', 'Daniel', 'Perez', '2023-06-24', 'daniel.perez@example.com'),
('U019', 'strong12345', 'Ella', 'King', '2023-06-25', 'ella.king@example.com'),
('U020', 'mypassword678', 'Henry', 'Carter', '2023-06-27', 'henry.carter@example.com'),
('U021', 'securepass321', 'Charlotte', 'Scott', '2023-06-29', 'charlotte.scott@example.com'),
('U022', 'topsecret123', 'Sebastian', 'Roberts', '2023-06-30', 'sebastian.roberts@example.com'),
('U023', 'passwordqwerty', 'Amelia', 'Morris', '2023-07-01', 'amelia.morris@example.com'),
('U024', 'strongpass234', 'Aiden', 'Wright', '2023-07-03', 'aiden.wright@example.com'),
('U025', 'securepassword12', 'Isabella', 'Hughes', '2023-07-04', 'isabella.hughes@example.com'),
('U026', 'abc4567', 'James', 'Ward', '2023-07-05', 'james.ward@example.com'),
('U027', 'securekey5678', 'Zoe', 'Cameron', '2023-07-07', 'zoe.cameron@example.com'),
('U028', 'strongpass789', 'David', 'Gray', '2023-07-08', 'david.gray@example.com'),
('U029', 'password2023', 'Maya', 'Jenkins', '2023-07-09', 'maya.jenkins@example.com'),
('U030', 'mypassword1234', 'Liam', 'Kim', '2023-07-10', 'liam.kim@example.com'),
('U031', 'securepass2023', 'Olivia', 'Martinez', '2023-07-12', 'olivia.martinez@example.com'),
('U032', 'strongpassword987', 'Sophia', 'Sullivan', '2023-07-13', 'sophia.sullivan@example.com'),
('U033', 'topsecret456', 'Evan', 'Taylor', '2023-07-14', 'evan.taylor@example.com'),
('U034', 'securekey1234!', 'Daniel', 'Parker', '2023-07-15', 'daniel.parker@example.com'),
('U035', 'mypassword321', 'Natalie', 'Diaz', '2023-07-16', 'natalie.diaz@example.com'),
('U036', 'strongpass000', 'Lucas', 'Baker', '2023-07-17', 'lucas.baker@example.com'),
('U037', 'securepass2023#', 'Ava', 'Evans', '2023-07-18', 'ava.evans@example.com'),
('U038', 'qwerty0987', 'Isaac', 'Hill', '2023-07-19', 'isaac.hill@example.com'),
('U039', 'passwordqwerty123', 'Charlotte', 'Garcia', '2023-07-20', 'charlotte.garcia@example.com'),
('U040', 'strongpassword789!', 'James', 'Cameron', '2023-07-21', 'james.cameron@example.com'),
('U041', 'mypassword987!@#', 'Sophia', 'Foster', '2023-07-22', 'sophia.foster@example.com'),
('U042', 'abc12345password', 'Isabella', 'Grant', '2023-07-23', 'isabella.grant@example.com'),
('U043', 'strongpassword!234', 'Oliver', 'Ross', '2023-07-24', 'oliver.ross@example.com'),
('U044', 'passwordXyZ123', 'Grace', 'Cole', '2023-07-25', 'grace.cole@example.com'),
('U045', 'mypasswordXyZ456', 'Aiden', 'Gonzalez', '2023-07-26', 'aiden.gonzalez@example.com'),
('U046', 'securepass!1234', 'Lily', 'Diaz', '2023-07-27', 'lily.diaz@example.com'),
('U047', 'strongpasswordXyZ', 'Ethan', 'Hill', '2023-07-28', 'ethan.hill@example.com'),
('U048', 'password321pass', 'Mason', 'Fisher', '2023-07-29', 'mason.fisher@example.com'),
('U049', 'secureXyZpassword', 'Amelia', 'Lee', '2023-07-30', 'amelia.lee@example.com'),
('U050', 'mypasswordXyZ@123', 'Henry', 'Kim', '2023-08-01', 'henry.kim@example.com');


-- Insert into Customers table;

INSERT INTO Customers (customer_id, customer_password, First_name, Last_name, sign_up_on, Email_id, contact, last_login)
VALUES
('C001', 'custpass123', 'Alice', 'Johnson', '2023-01-10', 'alice.johnson@example.com', '9876543210', '2023-05-01 10:30:00'),
('C002', 'custpass456', 'Bob', 'Smith', '2023-02-12', 'bob.smith@example.com', '1234567890', '2023-05-02 11:00:00'),
('C003', 'custpass789', 'Charlie', 'Brown', '2023-03-05', 'charlie.brown@example.com', '2345678901', '2023-05-03 12:00:00'),
('C004', 'custpass101', 'David', 'Williams', '2023-04-10', 'david.williams@example.com', '3456789012', '2023-05-04 13:15:00'),
('C005', 'custpass112', 'Eva', 'Moore', '2023-05-15', 'eva.moore@example.com', '4567890123', '2023-05-05 14:30:00'),
('C006', 'custpass12345', 'James', 'Miller', '2023-06-01', 'james.miller@example.com', '5678901234', '2023-06-02 15:00:00'),
('C007', 'custpass6789', 'Lily', 'Taylor', '2023-06-10', 'lily.taylor@example.com', '6789012345', '2023-06-11 16:00:00'),
('C008', 'custpass2345', 'Jack', 'Wilson', '2023-06-15', 'jack.wilson@example.com', '7890123456', '2023-06-16 17:30:00'),
('C009', 'custpass3456', 'Grace', 'Moore', '2023-06-20', 'grace.moore@example.com', '8901234567', '2023-06-21 18:00:00'),
('C010', 'custpass4567', 'Lucas', 'Martinez', '2023-06-25', 'lucas.martinez@example.com', '9012345678', '2023-06-26 19:00:00'),
('C011', 'custpass5678', 'Mia', 'Taylor', '2023-07-01', 'mia.taylor@example.com', '0123456789', '2023-07-02 20:00:00'),
('C012', 'custpass6789', 'Oliver', 'Johnson', '2023-07-02', 'oliver.johnson@example.com', '1023456789', '2023-07-03 21:00:00'),
('C013', 'custpass7890', 'Ella', 'Martin', '2023-07-03', 'ella.martin@example.com', '2023456789', '2023-07-04 22:00:00'),
('C014', 'custpass8901', 'Aiden', 'White', '2023-07-04', 'aiden.white@example.com', '3023456789', '2023-07-05 23:00:00'),
('C015', 'custpass9012', 'Amelia', 'Walker', '2023-07-05', 'amelia.walker@example.com', '4023456789', '2023-07-06 10:00:00'),
('C016', 'custpass0123', 'Liam', 'Hernandez', '2023-07-06', 'liam.hernandez@example.com', '5023456789', '2023-07-07 11:00:00'),
('C017', 'custpass1234', 'Chloe', 'King', '2023-07-07', 'chloe.king@example.com', '6023456789', '2023-07-08 12:00:00'),
('C018', 'custpass2345', 'Mason', 'Lee', '2023-07-08', 'mason.lee@example.com', '7023456789', '2023-07-09 13:00:00'),
('C019', 'custpass3456', 'Isabella', 'Harris', '2023-07-09', 'isabella.harris@example.com', '8023456789', '2023-07-10 14:00:00'),
('C020', 'custpass4567', 'Jackson', 'Young', '2023-07-10', 'jackson.young@example.com', '9023456789', '2023-07-11 15:00:00'),
('C021', 'custpass5678', 'Sophia', 'Brown', '2023-07-11', 'sophia.brown@example.com', '1034567890', '2023-07-12 16:00:00'),
('C022', 'custpass6789', 'Benjamin', 'Evans', '2023-07-12', 'benjamin.evans@example.com', '2034567890', '2023-07-13 17:00:00'),
('C023', 'custpass7890', 'Charlotte', 'Wright', '2023-07-13', 'charlotte.wright@example.com', '3034567890', '2023-07-14 18:00:00'),
('C024', 'custpass8901', 'William', 'Carter', '2023-07-14', 'william.carter@example.com', '4034567890', '2023-07-15 19:00:00'),
('C025', 'custpass9012', 'Zoe', 'Green', '2023-07-15', 'zoe.green@example.com', '5034567890', '2023-07-16 20:00:00'),
('C026', 'custpass0123', 'Sebastian', 'Garcia', '2023-07-16', 'sebastian.garcia@example.com', '6034567890', '2023-07-17 21:00:00'),
('C027', 'custpass1234', 'Harper', 'Adams', '2023-07-17', 'harper.adams@example.com', '7034567890', '2023-07-18 22:00:00'),
('C028', 'custpass2345', 'Elijah', 'Morris', '2023-07-18', 'elijah.morris@example.com', '8034567890', '2023-07-19 23:00:00'),
('C029', 'custpass3456', 'Luna', 'Roberts', '2023-07-19', 'luna.roberts@example.com', '9034567890', '2023-07-20 10:00:00'),
('C030', 'custpass4567', 'Jack', 'Nelson', '2023-07-20', 'jack.nelson@example.com', '1035678901', '2023-07-21 11:00:00'),
('C031', 'custpass5678', 'Ella', 'Martinez', '2023-07-21', 'ella.martinez@example.com', '2035678901', '2023-07-22 12:00:00'),
('C032', 'custpass6789', 'Liam', 'Brown', '2023-07-22', 'liam.brown@example.com', '3035678901', '2023-07-23 13:00:00'),
('C033', 'custpass7890', 'Scarlett', 'Taylor', '2023-07-23', 'scarlett.taylor@example.com', '4035678901', '2023-07-24 14:00:00'),
('C034', 'custpass8901', 'Mason', 'Davis', '2023-07-24', 'mason.davis@example.com', '5035678901', '2023-07-25 15:00:00'),
('C035', 'custpass9012', 'Benjamin', 'Lopez', '2023-07-25', 'benjamin.lopez@example.com', '6035678901', '2023-07-26 16:00:00'),
('C036', 'custpass0123', 'Aiden', 'Perez', '2023-07-26', 'aiden.perez@example.com', '7035678901', '2023-07-27 17:00:00'),
('C037', 'custpass1234', 'Lily', 'Martinez', '2023-07-27', 'lily.martinez@example.com', '8035678901', '2023-07-28 18:00:00'),
('C038', 'custpass2345', 'Emily', 'Scott', '2023-07-28', 'emily.scott@example.com', '9035678901', '2023-07-29 19:00:00'),
('C039', 'custpass3456', 'Lucas', 'Young', '2023-07-29', 'lucas.young@example.com', '1036789012', '2023-07-30 20:00:00'),
('C040', 'custpass4567', 'Megan', 'Martinez', '2023-07-30', 'megan.martinez@example.com', '2036789012', '2023-07-31 21:00:00'),
('C041', 'custpass5678', 'Ava', 'Davis', '2023-07-31', 'ava.davis@example.com', '3036789012', '2023-08-01 22:00:00'),
('C042', 'custpass6789', 'Caleb', 'Wilson', '2023-08-01', 'caleb.wilson@example.com', '4036789012', '2023-08-02 10:00:00'),
('C043', 'custpass7890', 'Ella', 'Lee', '2023-08-02', 'ella.lee@example.com', '5036789012', '2023-08-03 11:00:00'),
('C044', 'custpass8901', 'James', 'King', '2023-08-03', 'james.king@example.com', '6036789012', '2023-08-04 12:00:00'),
('C045', 'custpass9012', 'Mason', 'Hernandez', '2023-08-04', 'mason.hernandez@example.com', '7036789012', '2023-08-05 13:00:00'),
('C046', 'custpass0123', 'Scarlett', 'Miller', '2023-08-05', 'scarlett.miller@example.com', '8036789012', '2023-08-06 14:00:00'),
('C047', 'custpass1234', 'Oliver', 'Walker', '2023-08-06', 'oliver.walker@example.com', '9036789012', '2023-08-07 15:00:00'),
('C048', 'custpass2345', 'Aiden', 'Martinez', '2023-08-07', 'aiden.martinez@example.com', '1037890123', '2023-08-08 16:00:00'),
('C049', 'custpass3456', 'Amelia', 'Young', '2023-08-08', 'amelia.young@example.com', '2037890123', '2023-08-09 17:00:00'),
('C050', 'custpass4567', 'Liam', 'Nelson', '2023-08-09', 'liam.nelson@example.com', '3037890123', '2023-08-10 18:00:00');



-- Insert data into Employment_type;

INSERT INTO Employment_Type (Employment_type_id, Employment_type, Internal_Employee, vendor_name)
VALUES
('ET001', 'Full-Time', 1, NULL),
('ET002', 'Part-Time', 1, NULL),
('ET003', 'Contract', 0, 'TechCorp'),
('ET004', 'Intern', 1, NULL),
('ET005', 'Consultant', 0, 'ConsultingFirm'),
('ET006', 'Freelancer', 0, 'DesignPro'),
('ET007', 'Temporary', 0, 'TempServices'),
('ET008', 'Full-Time', 1, NULL),
('ET009', 'Part-Time', 1, NULL),
('ET010', 'Contract', 0, 'CloudWorks');



-- Insert into Employees;


select * from Employees;



Insert into Employees(Employee_id , Employee_type_id , First_name , Last_name , registered_on , Email_id , contact , 
contract_expiry)
values

('E001', 'ET001', 'John', 'Doe', '2023-01-15', 'john.doe@company.com', '9876543210', NULL),
('E002', 'ET002', 'Jane', 'Smith', '2023-02-20', 'jane.smith@company.com', '8765432109', NULL),
('E003', 'ET003', 'Michael', 'Brown', '2023-03-10', 'michael.brown@techcorp.com', '7654321098', '2024-03-10'),
('E004', 'ET004', 'Emily', 'Davis', '2023-04-05', 'emily.davis@company.com', '6543210987', NULL),
('E005', 'ET005', 'David', 'Wilson', '2023-05-12', 'david.wilson@consultingfirm.com', '5432109876', '2024-05-12'),
('E006', 'ET006', 'Sarah', 'Miller', '2023-06-01', 'sarah.miller@designpro.com', '4321098765', NULL),
('E007', 'ET007', 'James', 'Taylor', '2023-06-25', 'james.taylor@tempservices.com', '3210987654', '2023-12-25'),
('E008', 'ET001', 'Sophia', 'Martinez', '2023-07-15', 'sophia.martinez@company.com', '2109876543', NULL),
('E009', 'ET002', 'Oliver', 'Garcia', '2023-08-10', 'oliver.garcia@company.com', '1098765432', NULL),
('E010', 'ET003', 'Liam', 'Hernandez', '2023-08-20', 'liam.hernandez@techcorp.com', '9876543120', '2024-08-20');


-- Insert data into payment;

select * from payment;


Insert into payment(payment_id , Total_amount , payment_mode , paid_on , Is_successful)
values
('P001', 1500.00, 'UPI', '2023-01-15 10:45:00', 1),
('P002', 2999.99, 'Credit Card', '2023-01-20 11:30:00', 1),
('P003', 450.50, 'Cash on Delivery', '2023-01-25 12:15:00', 1),
('P004', 6700.75, 'Net Banking', '2023-02-02 13:45:00', 1),
('P005', 1200.00, 'Debit Card', '2023-02-10 14:00:00', 1),
('P006', 999.99, 'UPI', '2023-02-15 15:20:00', 0),
('P007', 1599.00, 'Credit Card', '2023-02-18 16:10:00', 1),
('P008', 849.50, 'Cash on Delivery', '2023-02-22 17:05:00', 1),
('P009', 5000.00, 'UPI', '2023-03-01 18:00:00', 1),
('P010', 7499.25, 'Net Banking', '2023-03-05 10:30:00', 1),
('P011', 2200.00, 'Debit Card', '2023-03-07 12:00:00', 1),
('P012', 325.00, 'Cash on Delivery', '2023-03-10 14:30:00', 0),
('P013', 2750.99, 'Credit Card', '2023-03-15 15:15:00', 1),
('P014', 12000.00, 'Net Banking', '2023-03-20 16:45:00', 1),
('P015', 399.99, 'UPI', '2023-03-25 17:00:00', 1),
('P016', 800.00, 'Debit Card', '2023-04-01 18:30:00', 1),
('P017', 1349.75, 'UPI', '2023-04-05 10:15:00', 1),
('P018', 6400.00, 'Credit Card', '2023-04-10 11:45:00', 0),
('P019', 299.99, 'Cash on Delivery', '2023-04-12 13:20:00', 1),
('P020', 2599.50, 'Net Banking', '2023-04-18 14:50:00', 1),
('P021', 4550.00, 'Debit Card', '2023-05-01 09:30:00', 1),
('P022', 1850.75, 'UPI', '2023-05-05 11:00:00', 1),
('P023', 3999.99, 'Credit Card', '2023-05-10 12:30:00', 1),
('P024', 700.00, 'Cash on Delivery', '2023-05-14 14:00:00', 1),
('P025', 8999.00, 'Net Banking', '2023-05-20 15:45:00', 1),
('P026', 500.00, 'Debit Card', '2023-06-01 17:10:00', 1),
('P027', 620.25, 'UPI', '2023-06-05 18:30:00', 0),
('P028', 2750.00, 'Credit Card', '2023-06-10 10:00:00', 1),
('P029', 1450.00, 'Cash on Delivery', '2023-06-15 11:30:00', 1),
('P030', 5600.00, 'Net Banking', '2023-06-20 13:00:00', 1),
('P031', 3299.99, 'Debit Card', '2023-07-01 14:30:00', 1),
('P032', 880.00, 'UPI', '2023-07-04 16:00:00', 1),
('P033', 1600.00, 'Credit Card', '2023-07-08 17:15:00', 0),
('P034', 940.50, 'Cash on Delivery', '2023-07-12 18:30:00', 1),
('P035', 10250.00, 'Net Banking', '2023-07-15 10:45:00', 1),
('P036', 2400.00, 'Debit Card', '2023-07-20 12:00:00', 1),
('P037', 730.00, 'UPI', '2023-07-25 13:15:00', 1),
('P038', 3250.50, 'Credit Card', '2023-07-30 14:45:00', 1),
('P039', 480.00, 'Cash on Delivery', '2023-08-01 15:50:00', 1),
('P040', 15499.00, 'Net Banking', '2023-08-05 16:30:00', 1),
('P041', 650.00, 'Debit Card', '2023-08-10 17:15:00', 0),
('P042', 3900.00, 'UPI', '2023-08-15 18:30:00', 1),
('P043', 1700.00, 'Credit Card', '2023-08-20 10:15:00', 1),
('P044', 800.00, 'Cash on Delivery', '2023-08-25 11:45:00', 1),
('P045', 7600.00, 'Net Banking', '2023-09-01 13:30:00', 1),
('P046', 1099.99, 'Debit Card', '2023-09-05 14:10:00', 1),
('P047', 240.00, 'UPI', '2023-09-10 15:45:00', 1),
('P048', 5250.00, 'Credit Card', '2023-09-15 17:00:00', 1),
('P049', 990.00, 'Cash on Delivery', '2023-09-20 18:30:00', 1),
('P050', 6000.00, 'Net Banking', '2023-09-25 19:45:00', 1);




-- Insert into orders;


select * from orders;


Insert into orders(order_id , ordered_by , payment_id , Is_delivered , Delivery_Date , delivered_by)
values

('O001', 'C001', 'P001', 1, '2023-01-16', 'E001'),
('O002', 'C002', 'P002', 1, '2023-01-21', 'E002'),
('O003', 'C003', 'P003', 1, '2023-01-26', 'E003'),
('O004', 'C004', 'P004', 1, '2023-02-03', 'E004'),
('O005', 'C005', 'P005', 1, '2023-02-11', 'E005'),
('O006', 'C006', 'P006', 0, NULL, NULL),
('O007', 'C007', 'P007', 1, '2023-02-19', 'E006'),
('O008', 'C008', 'P008', 1, '2023-02-23', 'E007'),
('O009', 'C009', 'P009', 1, '2023-03-02', 'E008'),
('O010', 'C010', 'P010', 1, '2023-03-06', 'E009'),
('O011', 'C001', 'P011', 1, '2023-03-08', 'E010'),
('O012', 'C002', 'P012', 0, NULL, NULL),
('O013', 'C003', 'P013', 1, '2023-03-16', 'E001'),
('O014', 'C004', 'P014', 1, '2023-03-21', 'E002'),
('O015', 'C005', 'P015', 1, '2023-03-26', 'E003'),
('O016', 'C006', 'P016', 1, '2023-04-02', 'E004'),
('O017', 'C007', 'P017', 1, '2023-04-06', 'E005'),
('O018', 'C008', 'P018', 0, NULL, NULL),
('O019', 'C009', 'P019', 1, '2023-04-13', 'E006'),
('O020', 'C010', 'P020', 1, '2023-04-19', 'E007'),
('O021', 'C001', 'P021', 1, '2023-05-02', 'E008'),
('O022', 'C002', 'P022', 1, '2023-05-06', 'E009'),
('O023', 'C003', 'P023', 1, '2023-05-11', 'E010'),
('O024', 'C004', 'P024', 1, '2023-05-15', 'E001'),
('O025', 'C005', 'P025', 1, '2023-05-21', 'E002'),
('O026', 'C006', 'P026', 1, '2023-06-02', 'E003'),
('O027', 'C007', 'P027', 0, NULL, NULL),
('O028', 'C008', 'P028', 1, '2023-06-11', 'E004'),
('O029', 'C009', 'P029', 1, '2023-06-16', 'E005'),
('O030', 'C010', 'P030', 1, '2023-06-21', 'E006'),
('O031', 'C001', 'P031', 1, '2023-07-02', 'E007'),
('O032', 'C002', 'P032', 1, '2023-07-05', 'E008'),
('O033', 'C003', 'P033', 0, NULL, NULL),
('O034', 'C004', 'P034', 1, '2023-07-13', 'E009'),
('O035', 'C005', 'P035', 1, '2023-07-16', 'E010'),
('O036', 'C006', 'P036', 1, '2023-07-21', 'E001'),
('O037', 'C007', 'P037', 1, '2023-07-26', 'E002'),
('O038', 'C008', 'P038', 1, '2023-07-31', 'E003'),
('O039', 'C009', 'P039', 1, '2023-08-02', 'E004'),
('O040', 'C010', 'P040', 1, '2023-08-06', 'E005'),
('O041', 'C001', 'P041', 0, NULL, NULL),
('O042', 'C002', 'P042', 1, '2023-08-16', 'E006'),
('O043', 'C003', 'P043', 1, '2023-08-21', 'E007'),
('O044', 'C004', 'P044', 1, '2023-08-26', 'E008'),
('O045', 'C005', 'P045', 1, '2023-09-02', 'E009'),
('O046', 'C006', 'P046', 1, '2023-09-06', 'E010'),
('O047', 'C007', 'P047', 1, '2023-09-11', 'E001'),
('O048', 'C008', 'P048', 1, '2023-09-16', 'E002'),
('O049', 'C009', 'P049', 1, '2023-09-21', 'E003'),
('O050', 'C010', 'P050', 1, '2023-09-26', 'E004');


-- Insert into product_items;

select * from product_items;

Insert into product_items(Item_id , item_code , Item_name , Item_type , Item_description , sold_by , amount , Discount , Stock_count)
values

('I001', 'ELEC001', 'Smartphone X', 'Electronics', '5G Android smartphone with AMOLED display', 'E001', 18999.99, 10, 50),
('I002', 'ELEC002', 'Bluetooth Speaker', 'Electronics', 'Portable Bluetooth speaker with deep bass', 'E002', 2999.50, 5, 70),
('I003', 'ELEC003', 'Laptop Pro 15', 'Electronics', '15-inch lightweight laptop with SSD storage', 'E003', 54999.00, 15, 30),
('I004', 'APP001', 'Mens Jacket', 'Apparel', 'Water-resistant winter jacket', 'E004', 2499.99, 20, 45),
('I005', 'APP002', 'Womens Kurti', 'Apparel', 'Cotton printed kurti for daily wear', 'E005', 999.00, 5, 80),
('I006', 'APP003', 'Denim Jeans', 'Apparel', 'Stretch-fit jeans for men', 'E006', 1499.50, 10, 60),
('I007', 'HOME001', 'Air Fryer', 'Home Appliance', 'Oil-less fryer for healthy cooking', 'E007', 6999.99, 25, 25),
('I008', 'HOME002', 'Mixer Grinder', 'Home Appliance', '750W powerful mixer with 3 jars', 'E008', 3499.00, 15, 35),
('I009', 'HOME003', 'Electric Kettle', 'Home Appliance', '1.5L stainless steel electric kettle', 'E009', 1499.00, 5, 90),
('I010', 'GROC001', 'Basmati Rice 5kg', 'Groceries', 'Long-grain aromatic basmati rice', 'E010', 599.00, 0, 100),

('I011', 'GROC002', 'Sunflower Oil 1L', 'Groceries', 'Refined sunflower oil for cooking', 'E001', 149.00, 0, 120),
('I012', 'GROC003', 'Instant Coffee 200g', 'Groceries', 'Premium blend instant coffee powder', 'E002', 349.00, 10, 70),
('I013', 'GROC004', 'Almonds 500g', 'Groceries', 'Premium quality whole almonds', 'E003', 699.00, 5, 40),
('I014', 'TOYS001', 'Remote Car', 'Toys', 'Rechargeable remote-controlled car', 'E004', 1199.00, 20, 50),
('I015', 'TOYS002', 'Puzzle Game', 'Toys', '500-piece puzzle for all ages', 'E005', 499.00, 15, 65),
('I016', 'TOYS003', 'Building Blocks', 'Toys', 'Creative blocks set for kids', 'E006', 899.00, 10, 40),
('I017', 'BOOK001', 'Data Science 101', 'Books', 'Beginner guide to data science concepts', 'E007', 599.00, 0, 35),
('I018', 'BOOK002', 'SQL Mastery', 'Books', 'Advanced SQL with real-world examples', 'E008', 749.00, 10, 20),
('I019', 'BOOK003', 'Python Cookbook', 'Books', 'Tips and tricks for Python developers', 'E009', 899.00, 0, 25),
('I020', 'BOOK004', 'Leadership Habits', 'Books', 'Improve leadership and productivity', 'E010', 499.00, 5, 40),

('I021', 'FIT001', 'Yoga Mat', 'Fitness', 'Anti-slip yoga mat for all exercises', 'E001', 1299.00, 20, 60),
('I022', 'FIT002', 'Dumbbells 5kg', 'Fitness', 'Pair of dumbbells for home workouts', 'E002', 1799.00, 10, 30),
('I023', 'FIT003', 'Resistance Bands', 'Fitness', 'Set of 3 resistance bands', 'E003', 699.00, 15, 50),
('I024', 'BEAUTY01', 'Face Cream', 'Beauty', 'Anti-aging cream with SPF', 'E004', 799.00, 5, 75),
('I025', 'BEAUTY02', 'Shampoo 400ml', 'Beauty', 'Paraben-free daily shampoo', 'E005', 349.00, 0, 90),
('I026', 'ELEC004', 'Smartwatch Z', 'Electronics', 'Fitness tracker with notifications', 'E006', 4299.00, 25, 40),
('I027', 'ELEC005', 'Tablet 10"', 'Electronics', 'WiFi + LTE Android tablet', 'E007', 9999.00, 15, 15),
('I028', 'HOME004', 'Vacuum Cleaner', 'Home Appliance', 'Bagless vacuum for dry surfaces', 'E008', 5999.00, 10, 20),
('I029', 'APP004', 'Womens Dress', 'Apparel', 'Floral summer dress', 'E009', 1599.00, 10, 55),
('I030', 'GROC005', 'Honey 500g', 'Groceries', 'Pure natural honey', 'E010', 349.00, 5, 100);



-- Insert into order_items;

select * from order_items;

Insert into order_items(item_id , order_id) 
values

('I001', 'O001'),
('I002', 'O001'),
('I003', 'O002'),
('I004', 'O003'),
('I005', 'O004'),
('I006', 'O004'),
('I007', 'O005'),
('I008', 'O005'),
('I009', 'O006'),
('I010', 'O007'),
('I011', 'O008'),
('I012', 'O008'),
('I013', 'O009'),
('I014', 'O009'),
('I015', 'O010'),
('I016', 'O011'),
('I017', 'O012'),
('I018', 'O013'),
('I019', 'O014'),
('I020', 'O015'),
('I021', 'O015'),
('I022', 'O016'),
('I023', 'O016'),
('I024', 'O017'),
('I025', 'O017'),
('I026', 'O018'),
('I027', 'O019'),
('I028', 'O020'),
('I029', 'O021'),
('I030', 'O022'),
('I001', 'O023'),
('I002', 'O024'),
('I003', 'O025'),
('I004', 'O026'),
('I005', 'O027'),
('I006', 'O028'),
('I007', 'O029'),
('I008', 'O030'),
('I009', 'O031'),
('I010', 'O031'),
('I011', 'O032'),
('I012', 'O033'),
('I013', 'O034');


-- Insert into order_delivery;


select * from order_delivery;

Insert into order_delivery(order_id , delivery_stage)
values

('O001', 'Packed'),
('O001', 'Shipped'),
('O001', 'Out for Delivery'),
('O001', 'Delivered'),

('O002', 'Packed'),
('O002', 'Shipped'),
('O002', 'Delivered'),

('O003', 'Packed'),
('O003', 'Shipped'),
('O003', 'Out for Delivery'),
('O003', 'Delivered'),

('O004', 'Packed'),
('O004', 'Delivered'),

('O005', 'Packed'),
('O005', 'Shipped'),
('O005', 'Out for Delivery'),
('O005', 'Delivered'),

('O007', 'Packed'),
('O007', 'Shipped'),
('O007', 'Delivered'),

('O008', 'Packed'),
('O008', 'Shipped'),
('O008', 'Out for Delivery'),
('O008', 'Delivered'),

('O009', 'Packed'),
('O009', 'Shipped'),
('O009', 'Out for Delivery'),
('O009', 'Delivered'),

('O010', 'Packed'),
('O010', 'Shipped'),
('O010', 'Delivered'),

('O011', 'Packed'),
('O011', 'Shipped'),
('O011', 'Delivered'),

('O013', 'Packed'),
('O013', 'Delivered'),

('O014', 'Packed'),
('O014', 'Shipped'),
('O014', 'Out for Delivery'),
('O014', 'Delivered'),

('O015', 'Packed'),
('O015', 'Shipped'),
('O015', 'Delivered'),

('O016', 'Packed'),
('O016', 'Shipped'),
('O016', 'Out for Delivery'),
('O016', 'Delivered'),

('O017', 'Packed'),
('O017', 'Delivered'),

('O019', 'Packed'),
('O019', 'Shipped'),
('O019', 'Delivered'),

('O020', 'Packed'),
('O020', 'Shipped'),
('O020', 'Out for Delivery'),
('O020', 'Delivered'),

('O021', 'Packed'),
('O021', 'Shipped'),
('O021', 'Out for Delivery'),
('O021', 'Delivered'),

('O022', 'Packed'),
('O022', 'Shipped'),
('O022', 'Delivered'),

('O023', 'Packed'),
('O023', 'Shipped'),
('O023', 'Delivered'),

('O024', 'Packed'),
('O024', 'Shipped'),
('O024', 'Out for Delivery'),
('O024', 'Delivered'),

('O025', 'Packed'),
('O025', 'Shipped'),
('O025', 'Out for Delivery'),
('O025', 'Delivered'),

('O026', 'Packed'),
('O026', 'Shipped'),
('O026', 'Delivered'),

('O028', 'Packed'),
('O028', 'Shipped'),
('O028', 'Delivered'),

('O029', 'Packed'),
('O029', 'Shipped'),
('O029', 'Out for Delivery'),
('O029', 'Delivered'),

('O030', 'Packed'),
('O030', 'Shipped'),
('O030', 'Delivered'),

('O031', 'Packed'),
('O031', 'Shipped'),
('O031', 'Out for Delivery'),
('O031', 'Delivered'),

('O032', 'Packed'),
('O032', 'Delivered'),

('O034', 'Packed'),
('O034', 'Shipped'),
('O034', 'Out for Delivery'),
('O034', 'Delivered'),

('O035', 'Packed'),
('O035', 'Shipped'),
('O035', 'Delivered'),

('O036', 'Packed'),
('O036', 'Shipped'),
('O036', 'Delivered'),

('O037', 'Packed'),
('O037', 'Shipped'),
('O037', 'Delivered'),

('O038', 'Packed'),
('O038', 'Shipped'),
('O038', 'Out for Delivery'),
('O038', 'Delivered'),

('O039', 'Packed'),
('O039', 'Shipped'),
('O039', 'Delivered'),

('O040', 'Packed'),
('O040', 'Delivered'),

('O042', 'Packed'),
('O042', 'Shipped'),
('O042', 'Delivered'),

('O043', 'Packed'),
('O043', 'Shipped'),
('O043', 'Out for Delivery'),
('O043', 'Delivered'),

('O044', 'Packed'),
('O044', 'Shipped'),
('O044', 'Delivered'),

('O045', 'Packed'),
('O045', 'Delivered'),

('O046', 'Packed'),
('O046', 'Shipped'),
('O046', 'Delivered'),

('O047', 'Packed'),
('O047', 'Shipped'),
('O047', 'Out for Delivery'),
('O047', 'Delivered'),

('O048', 'Packed'),
('O048', 'Shipped'),
('O048', 'Delivered'),

('O049', 'Packed'),
('O049', 'Shipped'),
('O049', 'Delivered'),

('O050', 'Packed'),
('O050', 'Shipped'),
('O050', 'Out for Delivery'),
('O050', 'Delivered');




-- Data Analysis

-- 1.*List all orders** with customer names and order dates.

select order_id , 
       o.ordered_by , 
	   c.customer_id , 
	   concat(first_name , ' ' , last_name) as customer_names , 
	   delivery_date as delivery_date
       from customers as c 
	   inner join orders as o 
	   on o.ordered_by = c.customer_id;

-- 2.**Get product names** along with the employee (seller) who listed them.

select item_id , 
       item_code , 
	   item_name , 
	   item_type , 
	   item_description , 
	   p.sold_by as seller , 
	   amount , 
	   discount , 
	   stock_amount ,
       e.Employee_id , 
	   concat(first_name , ' ' , Last_name) as Employee_name , 
	   Email_id 
	   from product_items as p 
	   inner join Employees as e
       on p.sold_by = e.Employee_id;


-- 3.**Get all orders** that were not delivered.

select * 
       from orders where is_delivered in 
	   (select is_delivered from orders where is_delivered = 0);


-- 4.Show **customers and their last login date** where login was after `2023-06-01`.

select * from customers where last_login in (select last_login from customers where last_login > '2023-06-01');


-- 5.List **products** with no discount.

select * from product_items where discount is null or discount = 0;


-- 6.Show orders along with their **payment amount and mode**.

select order_id , 
	   o.payment_id as order_table_payment_id , 
	   p.payment_id as payment_table_payment_id , 
	   Total_amount , 
	   payment_mode,
       paid_on, 
	   is_successful
       from orders as o 
	   inner join payment as p 
	   on o.payment_id = p.payment_id ;


-- 7.Find **employees** along with their employment type.

select Employee_id ,
       Employee_type_id , 
	   concat(First_name , ' ' ,last_name) as Employee_name , 
	   Email_id ,
       Employment_type 
	   from Employees as E 
	   inner join Employment_type as ET 
	   on E.Employee_type_id = ET.Employment_Type_id;


-- 8.List customers who have never placed an order.

select customer_id , 
       concat(First_name , ' ' , last_name) as customer_name 
       from customers 
	   where customer_id not in 
	   (select ordered_by from orders);

-- From C001 to C010 customers are just placed the orders others are not;

-- 9.List orders where the **delivery was handled by a vendor**

select order_id , 
      ordered_by , 
	  payment_id , 
	  is_delivered , 
	  ET.Employment_type_id as delivered_by_id  , 
	  Employment_type , 
	  internal_Employee ,
      vendor_name ,
	  concat(First_name ,' ' , last_name) as devlivered_by_name 
	  from employment_type as ET inner join 
      Employees as E on ET.Employment_type_id = E.Employee_type_id 
	  inner join orders as o 
	  on E.Employee_id = o.delivered_by
      where Internal_Employee = 0;


-- 10.Show **employees** whose **contract expires in the next 3 months**.

select Employee_id , 
       E.Employee_type_id , 
	   Employment_type , 
	   concat(First_name , ' ' , Last_name) as Employee_name,
       contract_expiry from Employees as E 
	   inner join Employment_type as ET 
	   on E.Employee_type_id = ET.Employment_type_id
       where Employment_type = 'Contract' 
	   and contract_expiry between getdate() and  cast(Dateadd(month , 3 , getdate()) AS Date);


-- 11.Show the **number of orders placed by each customer**.

select ordered_by as customer_id , 
       count(order_id) as count_orders 
	   from orders group by ordered_by 
	   order by count_orders desc;

-- 12.List the **top 3 most frequently sold items**.



select Top 30 oi.item_id  , 
       Item_name , 
	   count(order_id) as count_sold 
	   from order_items as oi 
	   inner join product_items as pi 
       on oi.item_id = pi.item_id 
	   group by oi.item_id , Item_name;


-- or 


With Top_three_Sold_items AS(

select oi.item_id  , 
       Item_name , 
	   count(order_id) as count_sold ,
	   Dense_Rank() over(order by count(order_id) desc) as Rank_item_id
	   from order_items as oi 
	   inner join product_items as pi 
       on oi.item_id = pi.item_id 
	   group by oi.item_id , Item_name

)

select * from Top_three_sold_items where Rank_item_id <= 3;






-- 13.Find total **revenue collected by payment mode**.

select payment_mode , 
       sum(Total_amount) as Total_revenue 
	   from payment group by payment_mode 
       order by Total_revenue desc;

-- 14.Count how many **distinct products** were sold in total.


select count(distinct(item_id)) as count_product_sold from order_items;


-- 15.Calculate **average discount** applied on products grouped by `Item_type`.

select Item_type , 
       avg(Discount) as avg_discount
	   from product_items 
	   group by Item_type 
	   order by avg_discount;


-- 16.Show **total number of items sold** per order.

select order_id , 
       count(item_id) as count_items_sold 
	   from order_items 
	   group by order_id  
	   order by count_items_sold desc;


-- 17.Display **order count by delivery stage**

select delivery_stage , 
       count(order_id) as No_of_orders 
	   from order_delivery 
	   group by delivery_stage 
	   order by No_of_orders desc;




-- 18.Find **stock value per item** (`amount * Stock_account`) where stock > 0.

select item_name , sum( (amount * stock_count)) as stock_value from product_items
where stock_count > 0
group by item_name;

-- Exec sp_rename 'product_items.Stock_amount' , 'Stock_Count';

select * from product_items;

-- 19.List all **customers who placed more than 2 orders**

select ordered_by , 
       concat(first_name , ' ' ,last_name) as customer_name  , 
	   count(order_id) as no_of_orders
       from orders as o 
	   inner join customers as c 
	   on o.ordered_by = c.customer_id 
	   group by ordered_by , concat(first_name,' ' , last_name)
       order by no_of_orders desc;


-- 20.Find the **most ordered product** .

select Top 13 pit.item_id , 
       Item_name , 
	   count(o.order_id) as No_of_orders 
	   from order_items as oi 
	   inner join product_items as pit
       on oi.item_id = pit.item_id 
	   inner join orders as o 
	   on oi.order_id = o.order_id 
	   group by pit.item_id , Item_name order by  No_of_orders desc;


-- or 


-- most ordered product


With Most_ordered_product AS(

select pi.item_id , 
       item_name , 
	   count(o.order_id) as No_of_orders , 
       Dense_Rank() over(order by count(o.order_id) desc) as Rank_item 
	   from product_items as pi inner join order_items as oi
       on pi.item_id  = oi.item_id 
	   inner join orders as o 
	   on oi.order_id = o.order_id 
	   group by pi.item_id , item_name 
	   
)

select * from Most_ordered_product where Rank_item <= 1;

-- 21. Get names of customers who placed **highest number of orders**.

select ordered_by , 
       concat(First_name , ' ' , Last_name) as customer_name , 
	   count(o.order_id) as No_of_orders
       from customers as c 
	   inner join orders as o 
	   on c.customer_id = o.ordered_by 
	   group by ordered_by , concat(First_name , ' ' , Last_name)
       order by No_of_orders desc;

-- or

With Customer_placed_highest_orders AS(

select c.customer_id , 
       concat(First_name , ' ' , last_name) as customer_name , 
	   count(order_id) as No_of_order ,
       Dense_Rank() over(order by count(order_id) desc) as Rank_customer_id 
	   from customers as c 
	   inner join orders as o
       on c.customer_id = o.ordered_by 
	   group by c.customer_id  , concat(First_name , ' ' , last_name)

)

select * from customer_placed_highest_orders where Rank_customer_id <= 1;


-- 23. List products that were **never ordered**.

select Item_id , 
       Item_name 
	   from product_items 
	   where item_id not in 
	   (select Item_id from order_items);

-- There is no single product which is not ordered;


-- 24.Using a subquery, list orders that **used payments > ₹10,000**.


select order_id  , 
       sum(Total_amount)  
	   from payment as p 
	   inner join orders as o 
	   on p.payment_id = o.payment_id
       group by order_id having sum(Total_amount) > 10000;

-- or 

select order_id  , 
       Total_amount  
	   from payment as p 
	   inner join orders as o 
	   on p.payment_id = o.payment_id
       where Total_amount > 10000;


-- 25.find the **first item ordered by each customer**.

With first_buy_each_customer AS(

select ordered_by , Item_name ,
Dense_Rank() over(partition by ordered_by order by o.order_id asc) as Rank_order_id
from orders as o inner join order_items as oi on o.order_id = oi.order_id
inner join product_items as pi on oi.item_id = pi.item_id

)

select * from first_buy_each_customer where Rank_order_id <= 1;


-- 26.Get employees whose **contract has already expired**.

select * from employees where contract_expiry < (select cast(getdate() AS Date));


-- 27.Find all orders where the delivery stage **skipped 'Out for Delivery'**

select order_id from order_delivery group by order_id having
sum(
    case 

	    WHEN delivery_stage = 'Out for delivery' THEN 1 ELSE 0
	END) = 0;



-- 28.Find **top 5 customers** by total spending using a subquery.

With Top_five_customers AS(

select customer_id , 
       sum(amount) as Total_amount  , 
       Dense_Rank() over(order by sum(amount) desc) as Rank_customer_id
       from customers as c 
	   inner join orders as o 
	   on c.customer_id = o.ordered_by 
	   inner join order_items as oi 
	   on o.order_id = oi.order_id 
	   inner join product_items as pi 
	   on oi.item_id = pi.item_id 
	   group by customer_id

)

select * from Top_five_customers where Rank_customer_id <= 5;

-- 29.List orders with **more than one item** using a `HAVING` clause.


select order_id , 
       count(item_id) as No_of_items 
	   from order_items 
	   group by order_id 
	   having count(item_id) > 1;


-- 30.Using CTE, find employees who have **delivered more than 5 orders**


With employee_delivered_more_than_five_orders AS(

select Employee_id , count(item_id) as No_of_ietms from employees as e inner join product_items as pi
on e.employee_id = pi.sold_by group by Employee_id having count(item_id) > 5

)

select * from employee_delivered_more_than_five_orders ;


-- 31.Use `RANK()` to rank customers by total number of orders.

With Customers_per_order AS(

select ordered_by , 
       count(order_id) as No_of_orders ,
       Dense_Rank() over(order by count(order_id) desc) as Rank_customer_id
       from orders as o 
	   inner join customers as c 
       on o.ordered_by = c.customer_id 
	   group by ordered_by

)

select * from customers_per_order;


-- 32.Use `DENSE_RANK()` to rank products by **total sales** amount.

select item_id , 
       item_name , 
       sum(amount) as Total_Sales  , 
       Dense_Rank() over(order by sum(amount) desc) as Rank_item_id
       from  product_items 
	   group by item_id  , item_name;


-- 33.Use `ROW_NUMBER()` to get the **latest order per customer**.

select customer_id , 
       order_id , 
       Row_number() over(order by order_id desc) as Row_number_customer_id
       from orders as o 
	   inner join customers as c 
	   on o.ordered_by = c.customer_id;

-- 34.For each employee, list their **nth contract expiry** using `ROW_NUMBER()`.


select employee_id ,
       concat(First_name , ' ' ,last_name) as Employee_name,contract_expiry , 
       Row_number() over(partition by employee_id order by contract_expiry asc) as Row_number_employee_id
       from employees;



-- 35.Show cumulative total revenue by order date using `SUM() OVER(...)`.

select delivery_date, sum(amount) as Total_amount , 
sum(sum(amount)) over(order by delivery_date asc) as sum_over_date
from orders as o inner join order_items as oi on o.order_id = oi.order_id
inner join product_items as pi on pi.item_id = oi.item_id 
where delivery_date is not null
group by delivery_date 
order by delivery_date;


-- 36.Get the **previous order amount per customer** using `LAG()`.

select c.customer_id , 
       o.order_id , 
	   amount as current_order_amount , 
       LAG(amount) over(order by o.order_id asc) as previous_order_amount
       from customers as c 
	   inner join orders as o 
	   on c.customer_id = o.ordered_by 
	   inner join order_items as oi 
	   on o.order_id = oi.order_id 
	   inner join product_items as pi 
	   on oi.item_id = pi.item_id 
	   group by c.customer_id , o.order_id , amount;



-- 37.Compare current and previous **stock levels** using `LAG()` or `LEAD()`


select item_id , 
       item_name ,
       Stock_Count as current_stock ,
       LAG(Stock_Count) over(order by item_id) as previous_Stock_Count ,
	   Stock_Count - LAG(Stock_Count) over(order by item_id asc) as Stock_Count_Change
	   from product_items;


-- 38.Find products with **increasing price trend** using `LEAD()` (assuming amount changes).

With increasing_price_trend AS(

select Item_id , 
       Item_name , 
	   amount as current_item_amount , 
       LEAD(amount) over(order by item_id asc) as amount_next_item 
from product_items 

)

select * from increasing_price_trend where amount_next_item > current_item_amount;


-- 39.Rank orders by amount within each payment mode using `PARTITION BY`.
 
select o.order_id , 
       payment_mode , 
	   amount , 
       Dense_Rank() over(partition by payment_mode order by amount desc) as Rank_on_amount_within_payment_mode_on_order
       from orders as o inner join order_items as oi on o.order_id = oi.order_id 
       inner join product_items as pi on oi.item_id = pi.item_id 
       inner join payment as p on o.payment_id = p.payment_id
       group by o.order_id , payment_mode , amount;



-- 40.Use `NTILE(4)` to divide orders into revenue-based quartiles.

select o.order_id , 
       sum(amount) as Total_revenue , 
       NTILE(4) over(order by sum(amount) desc) as revenue_based_quartiles
       from orders as o 
	   inner join order_items as oi 
	   on o.order_id = oi.order_id 
	   inner join product_items as pi
       on oi.item_id = pi.item_id 
	   group by o.order_id;



-- 41.Use `CASE` to label orders: `'High Value'` if amount > ₹10,000, else `'Standard'`.


select o.order_id  , 
       pi.item_id , 
	   item_name , 
	   amount ,
       case
           WHEN amount > 10000 THEN 'High Value' ELSE 'Standard'
       END as label_orders
       from product_items as pi 
	   inner join order_items as oi 
	   on pi.item_id = oi.item_id 
       inner join orders as o 
	   on oi.item_id = pi.item_id ;


-- 42.Use `CASE` to label contracts: `'Expired'`, `'Expiring Soon'`, or `'Valid'`.

select Employee_id , contract_expiry ,
case
    WHEN getDate() > contract_expiry THEN 'Expired'
	WHEN Year(contract_expiry) = Year(getdate()) and Month(contract_expiry) = Month(Getdate()) THEN 'Expiring Soon'
	ELSE 'Valid'
END as Label_contracts
from Employees where contract_expiry is not null;


-- 43. Create a monthly revenue report: total payment grouped by `MONTH(paid_on)`.

select Year(delivery_date) as Year , 
       Month(delivery_date) as Month ,
       sum(amount) as Total_payment 
	   from orders as o 
	   inner join order_items as oi 
	   on o.order_id = oi.order_id
       inner join product_items as pi 
	   on oi.item_id = pi.item_id 
	   group by Year(delivery_date) , Month(delivery_date);


-- 44.List customer emails where email domain is `@gmail.com`.


select * from customers where Email_id  like '%@gmail.com';


-- 45.List products priced between ₹1,000 and ₹5,000 and still in stock.

select * from product_items where (amount between 1000 and 5000) and stock_count > 0;


-- 46.Use `CASE` to bucket customers by last login (active in last 30 days, last 90, or inactive).


select Customer_id  , 
       last_login,
case
    WHEN last_login between cast(dateadd(day , -30 , Getdate()) AS Date) and  cast( Dateadd(day , 0 , getdate()) AS date) THEN 'Active in last 30 days'
	WHEN last_login between cast(dateadd(day , -90 , getdate()) AS Date) and cast(Dateadd(day , -31 , getdate()) AS Date) THEN 'Active in last 90 days'
	ELSE 'Inactive'
END as customer_activness
from customers;


-- 47.Calculate days since last login for each customer.

select * , 
       datediff(day , last_login , getdate()) as days_since_last_login 
	   from customers;


-- 48.Show average order value per customer and flag if it is **above overall average**.


With above_overall_average AS(

select customer_id , 
       (select cast(avg(amount) AS decimal(10,2)) from product_items) as overall_avg_amount ,
       avg(amount) as avg_amount_per_customer 
	   from customers as c 
	   inner join orders as o 
	   on c.customer_id = o.ordered_by
       inner join order_items as oi 
	   on o.order_id = oi.order_id 
	   inner join product_items as pi 
	   on oi.item_id = pi.item_id
       group by customer_id

)

select * ,
case
    WHEN avg_amount_per_customer > overall_avg_amount  THEN 'Above overall average'
	ELSE 'Below overall average'
END as label_
from above_overall_average;


-- 49.List vendors and **number of products sold by them** (filter by external employees).

select vendor_name , 
       Sold_by , 
	   count(item_id) as No_of_products 
	   from product_items as pi 
	   inner join  employees as e
       on pi.sold_by = e.employee_id 
	   inner join employment_type as et 
	   on e.employee_type_id = et.employment_type_id
       group by vendor_name , sold_by;


-- 50.List the **top 2 most sold items per category** using `RANK()` and `PARTITION BY`.

With Top_two_sold_items_per_category AS(

          select Item_type , 
		         Item_name , 
				 count(Item_name) as count_item_name , 
                 Dense_Rank() over(partition by Item_type order by count(item_name) desc) as Rank_item_name
                 from product_items group by Item_type , Item_name 

)

select * from Top_two_sold_items_per_category where Rank_item_name <= 2;

































-- stored procedure
-- functions
-- cumulative query
