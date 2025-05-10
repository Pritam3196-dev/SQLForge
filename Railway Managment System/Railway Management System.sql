-- Create database Reailway Managerment System;

Create database railway_management_system;


-- Use railay_management_system database;

Use railway_management_system;



-- create tables ;


Create table user_login(user_id varchar(20) primary key ,
                        User_password varchar(30) , 
						first_name varchar(50) ,
						last_name varchar(50),
						sign_up_on Date  ,
						email_id varchar(50)

)

-- Insert data into table;

Insert into user_login(user_id, user_password , first_name , last_name , sign_up_on , email_id)
            values
('USR001', 'V1kr@m@2023', 'Vikram', 'Singh', '2023-01-01', 'vikram.singh@email.com'),
('USR002', 'Aditi123$', 'Aditi', 'Gupta', '2022-02-15', 'aditi.gupta@email.com'),
('USR003', 'Rajesh@2021', 'Rajesh', 'Sharma', '2021-05-20', 'rajesh.sharma@email.com'),
('USR004', 'hello12345', 'Suresh', 'Kumar', '2022-11-25', 'suresh.kumar@email.com'),
('USR005', 'Pr@kar!2023', 'Prakash', 'Reddy', '2020-06-10', 'prakash.reddy@email.com'),
('USR006', 'N1k@z123', 'Nikita', 'Sharma', '2021-04-05', 'nikita.sharma@email.com'),
('USR007', 'S@mple@2023', 'Samir', 'Singh', '2023-03-30', 'samir.singh@email.com'),
('USR008', 'Abhi@pass1', 'Abhishek', 'Yadav', '2022-01-01', 'abhi.yadav@email.com'),
('USR009', 'Siddh@pass2', 'Siddharth', 'Mehta', '2022-07-15', 'siddharth.mehta@email.com'),
('USR010', 'P@ssw0rd123', 'Ravi', 'Iyer', '2022-12-12', 'ravi.iyer@email.com'),
('USR011', 'C@rol!1234', 'Carol', 'Patel', '2022-06-21', 'carol.patel@email.com'),
('USR012', 'Manish!2023', 'Manish', 'Soni', '2021-08-30', 'manish.soni@email.com'),
('USR013', 'Deepak#2021', 'Deepak', 'Chaudhary', '2020-03-18', 'deepak.chaudhary@email.com'),
('USR014', 'Shivani2022', 'Shivani', 'Joshi', '2022-09-20', 'shivani.joshi@email.com'),
('USR015', 'S@lk!ra124', 'Salman', 'Khan', '2023-02-10', 'salman.khan@email.com'),
('USR016', 'G@urav@2023', 'Gaurav', 'Bansal', '2021-10-01', 'gaurav.bansal@email.com'),
('USR017', 'Radhika&2023', 'Radhika', 'Sharma', '2022-12-01', 'radhika.sharma@email.com'),
('USR018', 'Virendra@123', 'Virendra', 'Kumar', '2021-07-15', 'virendra.kumar@email.com'),
('USR019', 'T@runk@123', 'Trisha', 'Verma', '2020-05-05', 'trisha.verma@email.com'),
('USR020', 'Punit@#2023', 'Punit', 'Singh', '2021-09-25', 'punit.singh@email.com'),
('USR021', 'Ajay@22pass', 'Ajay', 'Rathore', '2022-11-11', 'ajay.rathore@email.com'),
('USR022', 'Meenal#@2023', 'Meenal', 'Agarwal', '2023-01-01', 'meenal.agarwal@email.com'),
('USR023', 'R$@y@!pass', 'Ravi', 'Verma', '2021-12-05', 'ravi.verma@email.com'),
('USR024', 'D3v@2023!pass', 'Deven', 'Sahu', '2022-05-15', 'deven.sahu@email.com'),
('USR025', 'T@ndon@123', 'Tanvi', 'Bhatnagar', '2021-04-07', 'tanvi.bhatnagar@email.com'),
('USR026', 'Harsh@2023!Q', 'Harsh', 'Jain', '2020-06-25', 'harsh.jain@email.com'),
('USR027', 'Khush@2023', 'Khushboo', 'Verma', '2022-10-12', 'khushboo.verma@email.com'),
('USR028', 'F3rm@!2023', 'Feroze', 'Patel', '2022-01-18', 'feroze.patel@email.com'),
('USR029', 'Ashok@!pass2023', 'Ashok', 'Kumar', '2022-09-20', 'ashok.kumar@email.com'),
('USR030', 'R@vi@123!3k', 'Ravi', 'Singh', '2021-06-10', 'ravi.singh@email.com'),
('USR031', 'N@resh@12345', 'Naresh', 'Chaudhary', '2020-11-15', 'naresh.chaudhary@email.com'),
('USR032', 'N@ina!@Pass2023', 'Naina', 'Bedi', '2021-02-23', 'naina.bedi@email.com'),
('USR033', 'G@rima@!2023', 'Garima', 'Singh', '2021-11-11', 'garima.singh@email.com'),
('USR034', 'Anju@Patel@23', 'Anju', 'Patel', '2022-07-15', 'anju.patel@email.com'),
('USR035', 'Zain@2023@123', 'Zain', 'Mehmood', '2020-08-25', 'zain.mehemood@email.com'),
('USR036', 'T@rannum123!', 'Tariq', 'Siddiqui', '2022-10-01', 'tariq.siddiqui@email.com'),
('USR037', 'M@nil@p#2023', 'Manil', 'Kapoor', '2022-02-19', 'manil.kapoor@email.com'),
('USR038', 'A@d!t@#2023', 'Aditya', 'Sharma', '2022-04-25', 'aditya.sharma@email.com'),
('USR039', 'S@ndeeP@2023', 'Sandeep', 'Kumar', '2021-01-15', 'sandeep.kumar@email.com'),
('USR040', 'Neeraj!2023', 'Neeraj', 'Singh', '2021-08-20', 'neeraj.singh@email.com'),
('USR041', 'I$ha@!2023', 'Isha', 'Verma', '2022-09-10', 'isha.verma@email.com'),
('USR042', 'P@rajesh123!', 'Rajesh', 'Kumar', '2020-06-30', 'rajesh.kumar@email.com'),
('USR043', 'V@ibhav@#2023', 'Vibhav', 'Reddy', '2021-03-11', 'vibhav.reddy@email.com'),
('USR044', 'T@rkesh@2023!', 'Tarkesh', 'Bansal', '2020-11-30', 'tarkesh.bansal@email.com'),
('USR045', 'M@x@12345pass', 'Max', 'Verma', '2021-12-10', 'max.verma@email.com'),
('USR046', 'N@tasha2023!', 'Natasha', 'Sharma', '2022-07-01', 'natasha.sharma@email.com'),
('USR047', 'R$@kesh@123', 'Rakesh', 'Yadav', '2022-06-01', 'rakesh.yadav@email.com'),
('USR048', 'Vik@rk@P@ss2023', 'Vikram', 'Patel', '2021-05-22', 'vikram.patel@email.com'),
('USR049', 'N@shmita123', 'Nashmita', 'Yadav', '2022-04-30', 'nashmita.yadav@email.com'),
('USR050', 'AnitaP@123', 'Anita', 'Patel', '2023-01-01', 'anita.patel@email.com');


select * from user_login;




Create table passanger(passanger_id varchar(20) primary key ,
                       user_password varchar(30),
					   first_name varchar(50) ,
					   last_name varchar(50) ,
					   sign_up_on Date ,
					   email_id varchar(50) ,
					   contact varchar(10));



-- Insert data into table;

Insert into passanger(passanger_id , user_password , first_name , last_name , sign_up_on , email_id ,contact)
          values
('PAX001', 'P@ssw0rd123', 'Vikram', 'Singh', '2023-01-01', 'vikram.singh@email.com', '9876543210'),
('PAX002', 'Ad1t!@GuptA', 'Aditi', 'Gupta', '2022-02-15', 'aditi.gupta@email.com', '9876543211'),
('PAX003', 'Rajesh@321!', 'Rajesh', 'Sharma', '2021-05-20', 'rajesh.sharma@email.com', '9123456780'),
('PAX004', 'Suresh@1234', 'Suresh', 'Kumar', '2022-11-25', 'suresh.kumar@email.com', '9876543212'),
('PAX005', 'Pr@kar!2023', 'Prakash', 'Reddy', '2020-06-10', 'prakash.reddy@email.com', '9345678901'),
('PAX006', 'N1k@z123', 'Nikita', 'Sharma', '2021-04-05', 'nikita.sharma@email.com', '9876543213'),
('PAX007', 'S@mple@2023', 'Samir', 'Singh', '2023-03-30', 'samir.singh@email.com', '9123456782'),
('PAX008', 'Abhi@pass1', 'Abhishek', 'Yadav', '2022-01-01', 'abhi.yadav@email.com', '9087654321'),
('PAX009', 'Siddh@pass2', 'Siddharth', 'Mehta', '2022-07-15', 'siddharth.mehta@email.com', '9098765432'),
('PAX010', 'P@ssw0rd123', 'Ravi', 'Iyer', '2022-12-12', 'ravi.iyer@email.com', '9333445566'),
('PAX011', 'C@rol!1234', 'Carol', 'Patel', '2022-06-21', 'carol.patel@email.com', '9999988777'),
('PAX012', 'Manish!2023', 'Manish', 'Soni', '2021-08-30', 'manish.soni@email.com', '9333445577'),
('PAX013', 'Deepak#2021', 'Deepak', 'Chaudhary', '2020-03-18', 'deepak.chaudhary@email.com', '9775645632'),
('PAX014', 'Shivani2022', 'Shivani', 'Joshi', '2022-09-20', 'shivani.joshi@email.com', '9854678901'),
('PAX015', 'S@lk!ra124', 'Salman', 'Khan', '2023-02-10', 'salman.khan@email.com', '9836549820'),
('PAX016', 'G@urav@2023', 'Gaurav', 'Bansal', '2021-10-01', 'gaurav.bansal@email.com', '9375678123'),
('PAX017', 'Radhika&2023', 'Radhika', 'Sharma', '2022-12-01', 'radhika.sharma@email.com', '9888776655'),
('PAX018', 'Virendra@123', 'Virendra', 'Kumar', '2021-07-15', 'virendra.kumar@email.com', '9132345678'),
('PAX019', 'T@runk@123', 'Trisha', 'Verma', '2020-05-05', 'trisha.verma@email.com', '9845671243'),
('PAX020', 'Punit@#2023', 'Punit', 'Singh', '2021-09-25', 'punit.singh@email.com', '9102334455'),
('PAX021', 'Ajay@22pass', 'Ajay', 'Rathore', '2022-11-11', 'ajay.rathore@email.com', '9337887780'),
('PAX022', 'Meenal#@2023', 'Meenal', 'Agarwal', '2023-01-01', 'meenal.agarwal@email.com', '9823345566'),
('PAX023', 'R$@y@!pass', 'Ravi', 'Verma', '2021-12-05', 'ravi.verma@email.com', '9934567890'),
('PAX024', 'D3v@!2023', 'Deven', 'Sahu', '2022-05-15', 'deven.sahu@email.com', '9123445678'),
('PAX025', 'T@ndon@123', 'Tanvi', 'Bhatnagar', '2021-04-07', 'tanvi.bhatnagar@email.com', '9734567890'),
('PAX026', 'Harsh@2023!Q', 'Harsh', 'Jain', '2020-06-25', 'harsh.jain@email.com', '9901234567'),
('PAX027', 'Khush@2023', 'Khushboo', 'Verma', '2022-10-12', 'khushboo.verma@email.com', '9345678908'),
('PAX028', 'F3rm@!2023', 'Feroze', 'Patel', '2022-01-18', 'feroze.patel@email.com', '9485678903'),
('PAX029', 'Ashok@!pass2023', 'Ashok', 'Kumar', '2022-09-20', 'ashok.kumar@email.com', '9301283943'),
('PAX030', 'R@vi@123!3k', 'Ravi', 'Singh', '2021-06-10', 'ravi.singh@email.com', '9127654309'),
('PAX031', 'N@resh@12345', 'Naresh', 'Chaudhary', '2020-11-15', 'naresh.chaudhary@email.com', '9076543212'),
('PAX032', 'N@ina!@Pass2023', 'Naina', 'Bedi', '2021-02-23', 'naina.bedi@email.com', '9435667890'),
('PAX033', 'G@rima@!2023', 'Garima', 'Singh', '2021-11-11', 'garima.singh@email.com', '9154879203'),
('PAX034', 'Anju@Patel@23', 'Anju', 'Patel', '2022-07-15', 'anju.patel@email.com', '9807623456'),
('PAX035', 'Zain@2023@123', 'Zain', 'Mehmood', '2020-08-25', 'zain.mehemood@email.com', '9745638990'),
('PAX036', 'T@rannum123!', 'Tariq', 'Siddiqui', '2022-10-01', 'tariq.siddiqui@email.com', '9172848391'),
('PAX037', 'M@nil@p#2023', 'Manil', 'Kapoor', '2022-02-19', 'manil.kapoor@email.com', '9345679812'),
('PAX038', 'A@d!t@#2023', 'Aditya', 'Sharma', '2022-04-25', 'aditya.sharma@email.com', '9283746503'),
('PAX039', 'S@ndeeP@2023', 'Sandeep', 'Kumar', '2021-01-15', 'sandeep.kumar@email.com', '9712345634'),
('PAX040', 'Neeraj!2023', 'Neeraj', 'Singh', '2021-08-20', 'neeraj.singh@email.com', '9876543217'),
('PAX041', 'I$ha@!2023', 'Isha', 'Verma', '2022-09-10', 'isha.verma@email.com', '9834567812'),
('PAX042', 'P@rajesh123!', 'Rajesh', 'Kumar', '2020-06-30', 'rajesh.kumar@email.com', '9841236789'),
('PAX043', 'V@ibhav@#2023', 'Vibhav', 'Reddy', '2021-03-11', 'vibhav.reddy@email.com', '9176543200'),
('PAX044', 'T@rkesh@2023!', 'Tarkesh', 'Bansal', '2020-11-30', 'tarkesh.bansal@email.com', '9327654321'),
('PAX045', 'M@x@12345pass', 'Max', 'Verma', '2021-12-10', 'max.verma@email.com', '9513456723'),
('PAX046', 'N@tasha2023!', 'Natasha', 'Sharma', '2022-07-01', 'natasha.sharma@email.com', '9101236578'),
('PAX047', 'R$@kesh@123', 'Rakesh', 'Yadav', '2022-06-01', 'rakesh.yadav@email.com', '9190876543'),
('PAX048', 'Vik@rk@P@ss2023', 'Vikram', 'Patel', '2021-05-22', 'vikram.patel@email.com', '9378645235'),
('PAX049', 'N@shmita123', 'Nashmita', 'Yadav', '2022-04-30', 'nashmita.yadav@email.com', '9143456789'),
('PAX050', 'AnitaP@123', 'Anita', 'Patel', '2023-01-01', 'anita.patel@email.com', '9267895432');



-- check table

select * from passanger;


-- Create train_type table

create table train_type(

             train_type_id varchar(10) primary key ,
			 train_type varchar(50) ,
			 coaches_count varchar(5) ,
			 passenger_strength varchar(10) ,
			 train_count Date);

-- Insert data into table

Insert into train_type(train_type_id , train_type , coaches_count , passenger_strength , train_count)
            values
('TT001', 'Rajdhani Express', '22', '1200', '1995-03-10'),
('TT002', 'Shatabdi Express', '20', '1100', '1990-06-15'),
('TT003', 'Duronto Express', '22', '1150', '2009-01-01'),
('TT004', 'Garib Rath', '18', '1000', '2008-12-01'),
('TT005', 'Superfast Express', '24', '1300', '1987-05-20'),
('TT006', 'Passenger Train', '18', '700', '1980-11-25'),
('TT007', 'MEMU', '12', '500', '1998-07-10'),
('TT008', 'DEMU', '10', '450', '2000-02-18'),
('TT009', 'Jan Shatabdi', '18', '950', '2002-04-14'),
('TT010', 'Intercity Express', '20', '1000', '1994-08-22'),
('TT011', 'Mail Express', '22', '1100', '1975-06-06'),
('TT012', 'Humsafar Express', '20', '1050', '2016-03-01'),
('TT013', 'Tejas Express', '21', '1200', '2017-05-22'),
('TT014', 'Antyodaya Express', '20', '1250', '2017-02-01'),
('TT015', 'Uday Express', '19', '950', '2018-06-08'),
('TT016', 'Vande Bharat Express', '16', '1128', '2019-02-15'),
('TT017', 'Kavi Guru Express', '20', '970', '2011-10-10'),
('TT018', 'Suvidha Express', '22', '1100', '2015-08-25'),
('TT019', 'Sampark Kranti', '24', '1400', '2005-07-12'),
('TT020', 'Yuva Express', '20', '1000', '2009-12-22'),
('TT021', 'Jan Sadharan Express', '18', '800', '2010-01-01'),
('TT022', 'Double Decker Express', '16', '1100', '2012-10-01'),
('TT023', 'Holiday Special', '22', '1150', '2020-12-24'),
('TT024', 'Special Fare Train', '20', '1050', '2021-03-20'),
('TT025', 'COVID Special', '18', '900', '2020-05-01'),
('TT026', 'Premium Special', '22', '1100', '2021-08-15'),
('TT027', 'Summer Special', '20', '950', '2022-06-01'),
('TT028', 'Festival Special', '24', '1300', '2022-10-01'),
('TT029', 'AC Express', '20', '1000', '2014-12-01'),
('TT030', 'Express', '22', '1150', '1988-09-14'),
('TT031', 'Suburban Local', '12', '600', '1978-03-01'),
('TT032', 'Ladies Special', '10', '500', '2005-04-01'),
('TT033', 'Heritage Train', '8', '400', '1965-01-01'),
('TT034', 'Mountain Railway', '9', '450', '1955-08-20'),
('TT035', 'Luxury Tourist Train', '15', '300', '2003-11-14'),
('TT036', 'Pune Local', '12', '800', '1999-02-01'),
('TT037', 'Mumbai Local', '15', '1000', '1972-07-01'),
('TT038', 'Kolkata Metro', '14', '1200', '1984-10-24'),
('TT039', 'Chennai Local', '14', '900', '1987-04-10'),
('TT040', 'Delhi Metro', '8', '1000', '2002-12-25'),
('TT041', 'Regional Express', '18', '1000', '1993-11-11'),
('TT042', 'Tourist Circuit Train', '16', '850', '2008-01-01'),
('TT043', 'Pilgrimage Express', '20', '1100', '2011-05-30'),
('TT044', 'Hill Queen Express', '10', '500', '2000-07-07'),
('TT045', 'Panchavati Express', '18', '1000', '1995-09-25'),
('TT046', 'Chambal Express', '22', '1300', '1999-12-19'),
('TT047', 'Sabarmati Express', '24', '1400', '1991-08-15'),
('TT048', 'Howrah Express', '20', '1100', '1980-10-10'),
('TT049', 'Sahyadri Express', '18', '950', '1993-05-05'),
('TT050', 'Kashi Vishwanath Express', '20', '1100', '1982-07-20'),
('TT051', 'Palace on Wheels', '14', '150', '1982-01-26');

        

select * from train_type;


-- Create table stations;

Create table stations(station_id varchar(20) primary key ,
                      station_name varchar(50) ,
					  city varchar(30) ,
					  state varchar(20));


-- Insert into table


Insert into stations(station_id , station_name , city , state)
            values
('NDLS', 'New Delhi', 'New Delhi', 'Delhi'),
('CSTM', 'Chhatrapati Shivaji Maharaj Terminus', 'Mumbai', 'Maharashtra'),
('SBC', 'Krantivira Sangolli Rayanna (Bengaluru Station)', 'Bengaluru', 'Karnataka'),
('MAS', 'Chennai Central', 'Chennai', 'Tamil Nadu'),
('HWH', 'Howrah Junction', 'Kolkata', 'West Bengal'),
('PNBE', 'Patna Junction', 'Patna', 'Bihar'),
('BPL', 'Bhopal Junction', 'Bhopal', 'Madhya Pradesh'),
('ADI', 'Ahmedabad Junction', 'Ahmedabad', 'Gujarat'),
('LKO', 'Lucknow NR', 'Lucknow', 'Uttar Pradesh'),
('BBS', 'Bhubaneswar', 'Bhubaneswar', 'Odisha'),
('RJPB', 'Rajendra Nagar Terminal', 'Patna', 'Bihar'),
('GKP', 'Gorakhpur Junction', 'Gorakhpur', 'Uttar Pradesh'),
('JAT', 'Jammu Tawi', 'Jammu', 'Jammu and Kashmir'),
('SC', 'Secunderabad Junction', 'Hyderabad', 'Telangana'),
('ERS', 'Ernakulam Junction', 'Kochi', 'Kerala'),
('GHY', 'Guwahati', 'Guwahati', 'Assam'),
('CNB', 'Kanpur Central', 'Kanpur', 'Uttar Pradesh'),
('BCT', 'Mumbai Central', 'Mumbai', 'Maharashtra'),
('PUNE', 'Pune Junction', 'Pune', 'Maharashtra'),
('MMCT', 'Mumbai Central Terminus', 'Mumbai', 'Maharashtra'),
('DBG', 'Darbhanga Junction', 'Darbhanga', 'Bihar'),
('SVDK', 'Shri Mata Vaishno Devi Katra', 'Katra', 'Jammu and Kashmir'),
('NZM', 'Hazrat Nizamuddin', 'New Delhi', 'Delhi'),
('DDN', 'Dehradun', 'Dehradun', 'Uttarakhand'),
('RNC', 'Ranchi Junction', 'Ranchi', 'Jharkhand'),
('ASR', 'Amritsar Junction', 'Amritsar', 'Punjab'),
('BSB', 'Varanasi Junction', 'Varanasi', 'Uttar Pradesh'),
('FD', 'Faizabad Junction', 'Faizabad', 'Uttar Pradesh'),
('MAO', 'Madgaon', 'Goa', 'Goa'),
('JSME', 'Jasidih Junction', 'Deoghar', 'Jharkhand'),
('LTT', 'Lokmanya Tilak Terminus', 'Mumbai', 'Maharashtra'),
('RJT', 'Rajkot Junction', 'Rajkot', 'Gujarat'),
('KGP', 'Kharagpur Junction', 'Kharagpur', 'West Bengal'),
('ALD', 'Prayagraj Junction', 'Prayagraj', 'Uttar Pradesh'),
('UHP', 'Udhampur', 'Udhampur', 'Jammu and Kashmir'),
('ET', 'Itarsi Junction', 'Itarsi', 'Madhya Pradesh'),
('KYN', 'Kalyan Junction', 'Kalyan', 'Maharashtra'),
('TVC', 'Thiruvananthapuram Central', 'Thiruvananthapuram', 'Kerala'),
('BZA', 'Vijayawada Junction', 'Vijayawada', 'Andhra Pradesh'),
('GTNR', 'Gomti Nagar', 'Lucknow', 'Uttar Pradesh'),
('BPQ', 'Balharshah Junction', 'Ballarpur', 'Maharashtra'),
('MGS', 'Mughalsarai Junction (Pt. Deen Dayal Upadhyaya)', 'Mughalsarai', 'Uttar Pradesh'),
('UBL', 'Hubli Junction', 'Hubli', 'Karnataka'),
('NJP', 'New Jalpaiguri', 'Siliguri', 'West Bengal'),
('KTE', 'Katni Junction', 'Katni', 'Madhya Pradesh'),
('BHUJ', 'Bhuj', 'Bhuj', 'Gujarat'),
('AII', 'Ajmer Junction', 'Ajmer', 'Rajasthan'),
('JU', 'Jodhpur Junction', 'Jodhpur', 'Rajasthan'),
('JP', 'Jaipur Junction', 'Jaipur', 'Rajasthan'),
('RMM', 'Rameswaram', 'Rameswaram', 'Tamil Nadu'),
('TEN', 'Tirunelveli', 'Tirunelveli', 'Tamil Nadu'),
('VLNK', 'Velankanni', 'Velankanni', 'Tamil Nadu'),
('MDU', 'Madurai Junction', 'Madurai', 'Tamil Nadu'),
('SGNR', 'Shri Ganganagar', 'Ganganagar', 'Rajasthan');




-- check table

select * from stations;


-- Create train_details table;


Create table train_details(train_id varchar(20) primary key ,
                           train_type_id varchar(10) ,
						   source_station_id varchar(20) ,
						   destination_station_id varchar(20) ,
						   duration_minutes int ,
						   journey_start datetime ,
						   journey_end datetime ,
						   passenger_strength varchar(10),
						   Is_available BIT);

-- Is_available have boolean data but in MSSQL its not show case as boolean so it as BIT so internally it convert
-- 0 and False and 1 as True;

-- Insert into table;

Insert into train_details(train_id , train_type_id , source_station_id , destination_station_id ,duration_minutes ,
                          journey_start , journey_end , passenger_strength , Is_available)
			values
('TRAIN_001', 'TT001', 'NDLS', 'CSTM', 1440, '2025-05-01 17:00:00', '2025-05-02 17:00:00', 1200, 1),
('TRAIN_002', 'TT002', 'NDLS', 'MAS', 1950, '2025-05-01 06:00:00', '2025-05-02 03:30:00', 800, 1),
('TRAIN_003', 'TT003', 'HWH', 'CSTM', 1320, '2025-05-01 20:00:00', '2025-05-02 08:00:00', 1000, 1),
('TRAIN_004', 'TT004', 'PNBE', 'NDLS', 1020, '2025-05-01 10:00:00', '2025-05-01 22:00:00', 900, 1),
('TRAIN_005', 'TT005', 'MAS', 'CSTM', 1380, '2025-05-01 15:00:00', '2025-05-02 09:00:00', 1100, 1),
('TRAIN_006', 'TT006', 'KOL', 'HWH', 180, '2025-05-01 23:00:00', '2025-05-02 02:00:00', 500, 1),
('TRAIN_007', 'TT007', 'BBS', 'KUR', 60, '2025-05-01 05:00:00', '2025-05-01 06:00:00', 300, 1),
('TRAIN_008', 'TT008', 'GHY', 'NAGAON', 90, '2025-05-01 07:00:00', '2025-05-01 08:30:00', 350, 1),
('TRAIN_009', 'TT009', 'CSTM', 'PUNE', 180, '2025-05-01 08:00:00', '2025-05-01 11:00:00', 600, 1),
('TRAIN_010', 'TT010', 'NGP', 'JBP', 150, '2025-05-01 09:00:00', '2025-05-01 12:30:00', 700, 1),
('TRAIN_011', 'TT011', 'KOL', 'CSTM', 1320, '2025-05-01 20:00:00', '2025-05-02 08:00:00', 1000, 1),
('TRAIN_012', 'TT012', 'PNBE', 'NDLS', 1020, '2025-05-01 10:00:00', '2025-05-01 22:00:00', 900, 1),
('TRAIN_013', 'TT013', 'MAS', 'NDLS', 1950, '2025-05-01 06:00:00', '2025-05-02 03:30:00', 800, 1),
('TRAIN_014', 'TT014', 'GKP', 'NDLS', 1020, '2025-05-01 10:00:00', '2025-05-01 22:00:00', 900, 1),
('TRAIN_015', 'TT015', 'MAS', 'BNC', 240, '2025-05-01 15:00:00', '2025-05-01 19:00:00', 600, 1),
('TRAIN_016', 'TT016', 'NDLS', 'VNS', 600, '2025-05-01 07:00:00', '2025-05-01 17:00:00', 850, 1),
('TRAIN_017', 'TT017', 'KOL', 'NDLS', 1320, '2025-05-01 20:00:00', '2025-05-02 08:00:00', 1000, 1),
('TRAIN_018', 'TT018', 'MAS', 'NDLS', 1950, '2025-05-01 06:00:00', '2025-05-02 03:30:00', 800, 1),
('TRAIN_019', 'TT019', 'PNBE', 'NDLS', 1020, '2025-05-01 10:00:00', '2025-05-01 22:00:00', 900, 1),
('TRAIN_020', 'TT020', 'CSTM', 'NDLS', 1500, '2025-05-01 08:00:00', '2025-05-02 06:00:00', 950, 1),
('TRAIN_021', 'TT021', 'HWH', 'NDLS', 1320, '2025-05-01 20:00:00', '2025-05-02 08:00:00', 1000, 1),
('TRAIN_022', 'TT022', 'CSTM', 'PUNE', 180, '2025-05-01 08:00:00', '2025-05-01 11:00:00', 600, 1),
('TRAIN_023', 'TT023', 'NDLS', 'CSTM', 1500, '2025-05-01 08:00:00', '2025-05-02 06:00:00', 950, 1),
('TRAIN_024', 'TT024', 'KOL', 'CSTM', 1320, '2025-05-01 20:00:00', '2025-05-02 08:00:00', 1000, 1),
('TRAIN_025', 'TT025', 'MAS', 'NDLS', 1950, '2025-05-01 06:00:00', '2025-05-02 03:30:00', 800, 1),
('TRAIN_026', 'TT026', 'PNBE', 'NDLS', 1020, '2025-05-01 10:00:00', '2025-05-01 22:00:00', 900, 1),
('TRAIN_027', 'TT027', 'HWH', 'NDLS', 1320, '2025-05-01 20:00:00', '2025-05-02 08:00:00', 1000, 1),
('TRAIN_028', 'TT028', 'MAS', 'NDLS', 1950, '2025-05-01 06:00:00', '2025-05-02 03:30:00', 800, 1),
('TRAIN_029', 'TT029', 'NDLS', 'CSTM', 1440, '2025-05-01 17:00:00', '2025-05-02 17:00:00', 1200, 1),
('TRAIN_030', 'TT030', 'NGP', 'JBP', 150, '2025-05-01 09:00:00', '2025-05-01 12:30:00', 700, 1),
('TRAIN_031', 'TT031', 'CSTM', 'PUNE', 180, '2025-05-01 08:00:00', '2025-05-01 11:00:00', 600, 1),
('TRAIN_032', 'TT032', 'KOL', 'HWH', 120, '2025-05-01 13:00:00', '2025-05-01 15:00:00', 500, 0),
('TRAIN_033', 'TT033', 'KUR', 'BBS', 240, '2025-05-01 17:00:00', '2025-05-01 21:00:00', 800, 1),
('TRAIN_034', 'TT034', 'NDLS', 'BNC', 150, '2025-05-01 06:00:00', '2025-05-01 08:30:00', 650, 1),
('TRAIN_035', 'TT035', 'PUNE', 'MAS', 300, '2025-05-01 05:00:00', '2025-05-01 10:00:00', 1000, 0),
('TRAIN_036', 'TT036', 'KOL', 'CSTM', 720, '2025-05-01 14:00:00', '2025-05-01 22:00:00', 950, 1),
('TRAIN_037', 'TT037', 'NGP', 'NGO', 45, '2025-05-01 10:00:00', '2025-05-01 10:45:00', 300, 0);




-- check table

select * from train_details;

--- Create table

Create table journey(journey_id varchar(20) primary key ,
                     passanger_id varchar(20) ,
					 train_id varchar(20) ,
					 booking_id varchar(20) ,
					 payment_id varchar(20) ,
					 payment_status varchar(20),
					 paid_on datetime ,
					 booking_status varchar(20),
					 booked_on datetime ,
					 seat_alloted varchar(20) ,
					 meal_booked bit ,
					 foreign key (passanger_id) references passanger(passanger_id) ,
					 foreign key (train_id) references train_details(train_id));



-- Insert data into table

Insert into journey
(journey_id, passanger_id, train_id, booking_id, payment_id, payment_status, paid_on, booking_status, booked_on, seat_alloted, meal_booked)
values

('JOURNEY_001', 'PAX001', 'TRAIN_001', 'BOOK_001', 'PAY_001', 'Paid', '2025-05-01 16:30:00', 'Confirmed', '2025-05-01 14:00:00', 'S1-01', 1),
('JOURNEY_002', 'PAX002', 'TRAIN_002', 'BOOK_002', 'PAY_002', 'Paid', '2025-05-01 05:00:00', 'Confirmed', '2025-04-30 15:00:00', 'S2-02', 0),
('JOURNEY_003', 'PAX003', 'TRAIN_003', 'BOOK_003', 'PAY_003', 'Paid', '2025-05-01 19:30:00', 'Confirmed', '2025-04-30 12:00:00', 'S3-03', 1),
('JOURNEY_004', 'PAX004', 'TRAIN_004', 'BOOK_004', 'PAY_004', 'Paid', '2025-05-01 10:00:00', 'Confirmed', '2025-04-30 16:30:00', 'S4-04', 0),
('JOURNEY_005', 'PAX005', 'TRAIN_005', 'BOOK_005', 'PAY_005', 'Paid', '2025-05-01 14:00:00', 'Confirmed', '2025-04-30 13:00:00', 'S5-05', 1),
('JOURNEY_006', 'PAX006', 'TRAIN_006', 'BOOK_006', 'PAY_006', 'Paid', '2025-05-01 23:00:00', 'Confirmed', '2025-04-30 17:00:00', 'S6-06', 0),
('JOURNEY_007', 'PAX007', 'TRAIN_007', 'BOOK_007', 'PAY_007', 'Paid', '2025-05-01 05:00:00', 'Confirmed', '2025-04-30 20:00:00', 'S7-07', 1),
('JOURNEY_008', 'PAX008', 'TRAIN_008', 'BOOK_008', 'PAY_008', 'Paid', '2025-05-01 07:00:00', 'Confirmed', '2025-04-30 18:00:00', 'S8-08', 0),
('JOURNEY_009', 'PAX009', 'TRAIN_009', 'BOOK_009', 'PAY_009', 'Paid', '2025-05-01 08:00:00', 'Confirmed', '2025-04-30 22:00:00', 'S9-09', 1),
('JOURNEY_010', 'PAX010', 'TRAIN_010', 'BOOK_010', 'PAY_010', 'Paid', '2025-05-01 09:00:00', 'Confirmed', '2025-04-30 19:30:00', 'S10-10', 0),
('JOURNEY_011', 'PAX011', 'TRAIN_011', 'BOOK_011', 'PAY_011', 'Paid', '2025-05-01 20:00:00', 'Confirmed', '2025-04-30 14:00:00', 'S11-11', 1),
('JOURNEY_012', 'PAX012', 'TRAIN_012', 'BOOK_012', 'PAY_012', 'Paid', '2025-05-01 10:00:00', 'Confirmed', '2025-04-30 16:00:00', 'S12-12', 0),
('JOURNEY_013', 'PAX013', 'TRAIN_013', 'BOOK_013', 'PAY_013', 'Paid', '2025-05-01 06:00:00', 'Confirmed', '2025-04-30 17:30:00', 'S13-13', 1),
('JOURNEY_014', 'PAX014', 'TRAIN_014', 'BOOK_014', 'PAY_014', 'Paid', '2025-05-01 10:00:00', 'Confirmed', '2025-04-30 13:00:00', 'S14-14', 0),
('JOURNEY_015', 'PAX015', 'TRAIN_015', 'BOOK_015', 'PAY_015', 'Paid', '2025-05-01 15:00:00', 'Confirmed', '2025-04-30 14:30:00', 'S15-15', 1),
('JOURNEY_016', 'PAX016', 'TRAIN_016', 'BOOK_016', 'PAY_016', 'Paid', '2025-05-01 07:00:00', 'Confirmed', '2025-04-30 11:00:00', 'S16-16', 0),
('JOURNEY_017', 'PAX017', 'TRAIN_017', 'BOOK_017', 'PAY_017', 'Paid', '2025-05-01 20:00:00', 'Confirmed', '2025-04-30 16:30:00', 'S17-17', 1),
('JOURNEY_018', 'PAX018', 'TRAIN_018', 'BOOK_018', 'PAY_018', 'Paid', '2025-05-01 06:00:00', 'Confirmed', '2025-04-30 22:00:00', 'S18-18', 0),
('JOURNEY_019', 'PAX019', 'TRAIN_019', 'BOOK_019', 'PAY_019', 'Paid', '2025-05-01 10:00:00', 'Confirmed', '2025-04-30 13:30:00', 'S19-19', 1),
('JOURNEY_020', 'PAX020', 'TRAIN_020', 'BOOK_020', 'PAY_020', 'Paid', '2025-05-01 08:00:00', 'Confirmed', '2025-04-30 20:30:00', 'S20-20', 0);



select * from journey;


-- create table

Create table train_routes(row_id int identity(1 ,1) primary key,
                          route_id varchar(20) ,
						  train_id varchar(20) ,
						  station_id varchar(20),
						  order_number int ,
						  halt_durations_minutes int ,
						  estimated_arrival Time ,
						  estimated_departure Time ,
						  foreign key (train_id) references train_details(train_id) ,
						  foreign key (station_id) references stations(station_id));


-- Insert into table


Insert into train_routes(route_id , train_id , station_id,  order_number , halt_durations_minutes ,
                         estimated_arrival , estimated_departure)
			values

('RT001', 'TRAIN_001', 'NDLS', 1, 15, '10:00:00', '10:15:00'),
('RT002', 'TRAIN_001', 'CSTM', 2, 20, '12:00:00', '12:20:00'),
('RT003', 'TRAIN_001', 'MAS', 3, 25, '14:30:00', '14:55:00'),
('RT004', 'TRAIN_001', 'HWH', 4, 10, '17:00:00', '17:10:00'),
('RT005', 'TRAIN_002', 'PNBE', 1, 30, '06:00:00', '06:30:00'),
('RT006', 'TRAIN_002', 'BPL', 2, 20, '08:00:00', '08:20:00'),
('RT007', 'TRAIN_002', 'ADI', 3, 15, '10:15:00', '10:30:00'),
('RT008', 'TRAIN_002', 'LKO', 4, 35, '12:00:00', '12:35:00'),
('RT009', 'TRAIN_003', 'BBS', 1, 20, '07:00:00', '07:20:00'),
('RT010', 'TRAIN_003', 'RJPB', 2, 15, '09:10:00', '09:25:00'),
('RT011', 'TRAIN_003', 'GKP', 3, 40, '11:30:00', '12:10:00'),
('RT012', 'TRAIN_003', 'JAT', 4, 30, '14:00:00', '14:30:00'),
('RT013', 'TRAIN_004', 'SC', 1, 25, '06:45:00', '07:10:00'),
('RT014', 'TRAIN_004', 'ERS', 2, 10, '08:30:00', '08:40:00'),
('RT015', 'TRAIN_004', 'GHY', 3, 20, '10:50:00', '11:10:00'),
('RT016', 'TRAIN_004', 'CNB', 4, 30, '12:15:00', '12:45:00'),
('RT017', 'TRAIN_005', 'BCT', 1, 20, '05:30:00', '05:50:00'),
('RT018', 'TRAIN_005', 'PUNE', 2, 35, '07:00:00', '07:35:00'),
('RT019', 'TRAIN_005', 'MMCT', 3, 25, '09:30:00', '09:55:00'),
('RT020', 'TRAIN_005', 'DBG', 4, 15, '11:00:00', '11:15:00'),
('RT021', 'TRAIN_006', 'SVDK', 1, 30, '05:30:00', '06:00:00'),
('RT022', 'TRAIN_006', 'NZM', 2, 20, '08:00:00', '08:20:00'),
('RT023', 'TRAIN_006', 'DDN', 3, 25, '10:15:00', '10:40:00'),
('RT024', 'TRAIN_006', 'RNC', 4, 15, '12:00:00', '12:15:00');


select * from train_routes;





-- Data Analysis starts ---


select distinct Table_name from information_schema.columns;


--1 . Retrieve all users who signed up in the year 2023.

select * from user_login where Datename(year , sign_up_on) = 2023;

-- 2.Find distinct states from the stations table.

select distinct state from stations;

-- 3.Show the count of passengers registered for each unique sign_up_on date.

--rename table name

Exec sp_rename 'Passanger' , 'Passenger';

--rename column name

Exec sp_rename 'passenger.passanger_id' , 'passenger_id';


select sign_up_on , 
       count(passenger_id) as No_of_passenger 
	   from passenger 
	   group by sign_up_on 
	   order by No_of_passenger desc;


-- 4.Get the email IDs of users whose last name is 'Sharma'.

select email_id from user_login where last_name = 'Sharma';


-- 5.List all trains that are available

select * from train_details where is_available = 1;

-- basically its boolean data but in mssql it show boolean data so it make it as bit so True is 1 and False is 0;


--6. Display passenger names and contact numbers who signed up before 2022.


select concat(first_name , ' ' , last_name) as passenger_name , 
       contact , 
	   sign_up_on 
	   from passenger 
       where datename(year , sign_up_on) in 
	   ( select datename(year , sign_up_on) from passenger where datename(year , sign_up_on) < 2022 );



-- 7.List the train types with a passenger capacity greater than 1000.


select train_type from train_type where passenger_strength > 1000;

-- 8.Find users with password length more than 10 characters.


select user_id , 
       concat(first_name , ' ' , last_name) as passenger_name  , 
	   LEN(User_password) as  Password_length
       from user_login
	   where len(User_password) > 10;


-- or 

select * , len(user_password) as length_password from passenger where len(user_password) > 10;


-- 9.Retrieve trains that start from 'New Delhi' (station_id = 'NDLS').

select * from train_details where source_station_id = 'NDLS'


-- 10.Count how many stations exist per state.


select state ,
       count(station_name) as no_of_stations 
	   from stations 
	   group by state 
	   order by no_of_stations desc;


-- 11.Display the names of passengers who share the same email as any user in the user_login table.


select concat(p.first_name , ' ' , p.last_name) as passenger_name , 
       p.email_id 
	   from passenger as p 
	   inner join user_login as u 
	   on p.email_id = u.email_id 
	   order by passenger_name asc;


-- 12.Retrieve the earliest train start time from train_details.


select journey_start from train_details;

-- 13.Find total number of passengers per train type (from train_details + train_type).


-- Alter table train_type alter column passenger_strength int;

select train_type , 
       sum(passenger_strength) as No_of_passengers 
	   from train_type 
	   group by train_type;

-- difference between count and sum is count is meadure or count the records and sum is make 
-- summation of values inside of records


-- 14.Show trains whose duration is more than 24 hours (1440 minutes).


select * from train_details 
        where datediff(minute , journey_start , journey_end) > 1440;


-- 15.List users whose first and last name are the same.

select * from user_login where first_name = last_name ;


-- 16.Show passenger details along with their station city

select passenger_id , 
       concat(first_name , ' ' , last_name) as paasenger_full_name ,
	   email_id , 
	   contact , 
	   s.station_id , 
	   station_name , 
	   city , 
      state 
	  from passenger as p 
	  inner join journey as j 
	  on p.passenger_id = j.passanger_id
	  inner join Train_details as t 
	  on j.train_id = t.train_id 
	  inner join stations as s 
	  on t.source_station_id = s.station_id;


-- 17.Find the **top 5 train types** with the highest passenger strength.  

select Top 12 train_type , 
       passenger_strength 
	   from train_type 
	   order by passenger_strength desc;


-- or 

With Top_five_passenger_strength AS(

select train_type , passenger_strength , 
Dense_Rank() over(order by passenger_strength desc) as Rank_train_type
from train_type

)

select * from Top_five_passenger_strength where Rank_train_type <= 5;




-- or 


With Top_five_passenger_strength AS(

select train_type , sum(passenger_strength) as Total_passenger ,
Dense_Rank() over(order by sum(passenger_strength) desc) as Rank_train_type
from train_type group by train_type

)

select * from Top_five_passenger_strength where Rank_train_type <= 5; 


-- 18.Get the **train name, source, and destination station names** for each train.  

select train_id , 
       source_station_id , 
	   s1.station_name as source_station_name  , 
	   destination_station_id , 
	   s2.station_name as destination_station_name 
	   from train_details as td 
	   inner join stations as s1 
	   on td.source_station_id = s1.station_id 
	   inner join stations as s2 
	   on td.destination_station_id = s2.station_id;

-- 19.Find **trains with missing or NULL destination stations**.  


select * from train_details where destination_station_id is null;


-- 20.Show **train types launched after the year 2015**.

select * from train_type where datename(year , train_count) > 2015;

-- or 

-- postgresql

select * from train_type where extract(Year from train_count) > 2015;


-- 21.Count the number of **passengers signed up each year**

select Datename(Year , sign_up_on) as Year , 
       count(user_id) as Total_no_of_users 
       from user_login 
	   group by datename(year , sign_up_on) 
	   order by Year asc;


-- 22.Display **stations in Maharashtra**, sorted by city.  

select * from stations where state = 'Maharashtra' order by city asc;

-- 23.Get all **trains running between NDLS and CSTM**.  

select * from train_details where source_station_id = 'NDLS' and destination_station_id = 'CSTM';

-- 24.Find passengers whose contact number starts with `'98'`. 


select * from passenger where contact like '98%';

-- or 

select * from passenger where left(contact , 2) ='98';


-- 25.Show all **stations with the word ‘Junction’ in the name**.  


select * from stations where station_name like  '%Junction%';

-- 26.Show trains that **start and end on the same day**. 

select * from train_details where datename(day , journey_start) = datename(day , journey_end);


-- 27.Find users who have **no matching passenger record** (by email). 


select user_id , 
       concat(u.first_name , ' ' , u.last_name) as user_name ,
	   u.email_id as user_email
       from user_login as u 
	   left join passenger as p 
	   on u.email_id = p.email_id 
	   where p.email_id is null;


-- 28.Show trains where **journey duration exceeds the average duration**.

select train_id  , 
       train_type,
       datediff(minute , journey_start , journey_end) as journey_duration , 
	   (select avg(datediff(minute , journey_start , journey_end)) from train_details) as avg_duration
       from train_details as td inner join train_type as t on  td.train_type_id  = t.train_type_id
	   where datediff(minute , journey_start , journey_end) >  
       (select avg(datediff(minute , journey_start , journey_end)) from train_details);


-- 29.List the **train types with exactly 20 coaches**.

select * from train_type where coaches_count = 20;

-- 30.Calculate the **total passenger strength by train_type**.  

select train_type ,  
       sum(passenger_strength) as Total_paasenger 
	   from train_type 
	   group by train_type
	   order by train_type asc;


-- 31.Show users whose **email ends with 'email.com'**. 

select * from user_login where email_id like '%email.com';


-- 32.List all trains where **destination station is in Bihar**.

select *, 
       s.station_id , 
	   station_name , 
	   city , 
       state 
	   from train_details as td 
	   inner join stations as s  
	   on td.destination_station_id = s.station_id
       where state = 'Bihar';



-- 33.Find **duplicate first names** in user_login.

select first_name  , count(first_name) as No_of_times_repeated
       from user_login 
	   group by first_name 
	   having count(first_name) > 1;


-- 34.Get **passengers who signed up in April**.

select * from passenger where datename(month , sign_up_on) = 'April';

-- or 

-- postgresql

select * from passenger where extract(month from sign_up_on) = 4;


-- 35.Count how many users have **passwords containing '@' symbol**.

select first_name , last_name , user_password from user_login where user_password like '%@%';

-- or 


select count(user_id) as Total_no_of_users from user_login where user_password like '%@%';


-- 26.Find **passengers who are also in the user_login table** .

select * from passenger as p inner join user_login as u on p.email_id = u.email_id

-- there 50 passengers who are user and they are also in passenger table;

-- 37. Show **percentage of trains that are available** vs. unavailable.  

With  count_of_trains_available_unavailable AS(


select 
       count(
	         case 
			      WHEN is_available = 1 THEN 1
			 END) as count_of_available  ,

		count(
		      case
			      WHEN is_available = 0 THEN 1
			  END)  as count_of_non_available , 


		count(train_id) as no_of_trains
		from train_details


)


select concat(cast(cast(count_of_available AS decimal(10,2)) / no_of_trains * 100  AS decimal(10,2)) , ' %') as percentage_of_trains_availabel ,
       concat(cast(cast(count_of_non_available AS decimal(10,2)) / no_of_trains * 100 AS decimal(10,2)) , ' %') as percentage_of_trains_non_available
	   from count_of_trains_available_unavailable;




-- 38. Write a query to **calculate journey duration** using journey_start and journey_end (in hours).  


select train_id , 
       train_type ,
       datediff(hour , journey_start , journey_end) as journey_duration_in_hour
	   from train_details as td 
	   inner join train_type as t 
	   on td.train_type_id = t.train_type_id;

-- 39. Show the **average number of coaches per train type**.


-- Alter table train_type alter column coaches_count int;

select train_type_id , 
       avg(coaches_count) as avg_no_of_coaches_per_train
       from train_type group by train_type_id;

-- or 

select  train_type_id , 
        train_type , 
		avg(coaches_count) as avg_no_coaches_per_train
        from train_type group by train_type_id , train_type;


-- 40. List users who signed up in the **last 6 months** from today. 


select * from user_login where datediff(month , sign_up_on , GETDATE()) <= 6;

-- or 

select * from user_login where sign_up_on  >= dateadd(month , -6 , GETDATE());


-- 41. Find trains that **do not have matching entries in train_type**. 


select train_id , 
       td.train_type_id 
	   from train_details as td 
	   left join train_type as tt 
	   on td.train_type_id = tt.train_type_id
       where tt.train_type is null;


-- 42.Show all **users along with their passenger info if available** (LEFT JOIN-like logic).  

select user_id , 
       concat(u.first_name, ' ' , u.last_name) as user_name ,
       u.sign_up_on , 
	   u.email_id , 
	   passenger_id , 
	   concat(p.first_name , ' ' , p.last_name) as passenger_name , 
	   p.sign_up_on ,
       p.email_id , 
	   contact
       from user_login as u 
	   left join passenger as p 
       on concat(u.first_name , ' ' , u.last_name) = concat(p.first_name , ' ' , p.last_name);



-- or 


select distinct user_id , 
       concat(u.first_name, ' ' , u.last_name) as user_name ,
       u.sign_up_on , 
	   u.email_id , 
	   passenger_id , 
	   concat(p.first_name , ' ' , p.last_name) as passenger_name , 
	   p.sign_up_on ,
       p.email_id , 
	   contact
       from user_login as u 
	   left join passenger as p 
       on u.email_id = p.email_id;


-- 43.Show **train count per city**, based on source station.  

select city , 
       td.source_station_id , 
	   count(train_id) as no_of_train 
	   from stations as s 
	   inner join train_details as td 
       on s.station_id = td.source_station_id 
	   group by city , td.source_station_id;


-- 44. which one station has highrest train in city (about above question);
 
select city , 
       td.source_station_id , 
	   count(train_id) as no_of_trains,
       Dense_Rank() over(partition by city order by count(td.train_id) desc) as Rank_source_station_id
       from train_details as td inner join stations as s on td.source_station_id = s.station_id 
       group by city , td.source_station_id;

-- 45. Find the **earliest and latest journey date** for each train type.    


select train_id , 
       td.train_type_id , 
	   train_type , 
       Min(journey_start) as Earliest_date , 
	   max(journey_start) as latest_date
       from train_details as td 
	   inner join train_type as tt
       on td.train_type_id = tt.train_type_id 
       group by train_id , td.train_type_id , train_type;


-- 46.Retrieve trains that **start between 6 AM and 12 PM**.  


select * from train_details where Datename(hour , journey_start) between 18 and 24;


-- 47.Find all **trains longer than 12 hours** and are still marked as available.


select * from train_details where  Datediff(hour,journey_start , journey_end) > 12 and is_available = 1;