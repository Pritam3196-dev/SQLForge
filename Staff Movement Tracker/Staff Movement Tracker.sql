-- Create database staff Movement Tracker;

Create database Staff_movement_Tracker;


-- Use staff_movement_tracker;

Use Staff_movement_Tracker;



-- Create tables;


Create table Comapny_divisions(
         
		 Department varchar(100) primary key ,
		 company_divsion varchar(100)) 


,



Create table Company_regions( region_ID int primary key ,
                              company_regions varchar(50) ,
							  country varchar(50))


,




Create table staff(staff_id int primary key ,
                   last_name varchar(50) ,
				   Email_id varchar(70) ,
				   Gender varchar(10),
				   department varchar(100),
				   start_date date ,
				   salary int ,
				   job_Title varchar(100),
				   region_id int ,
				   foreign key (department) references Comapny_divisions(Department) ,
				   foreign key (region_id) references company_regions(region_id));



-- Insert into tables


Insert into Comapny_divisions(Department , company_divsion)
       values
('Automotive', 'Auto & Hardware'),
('Baby', 'Domestic'),
('Beauty', 'Domestic'),
('Clothing', 'Domestic'),
('Computers', 'Electronic Equipment'),
('Electronics', 'Electronic Equipment'),
('Games', 'Domestic'),
('Garden', 'Outdoors & Garden'),
('Grocery', 'Domestic'),
('Health', 'Domestic'),
('Home', 'Domestic'),
('Industrial', 'Auto & Hardware'),
('Jewelery', 'Fashion'),
('Kids', 'Domestic'),
('Movies', 'Entertainment'),
('Music', 'Entertainment'),
('Outdoors', 'Outdoors & Garden'),
('Shoes', 'Domestic'),
('Sports', 'Games & Sports'),
('Tools', 'Auto & Hardware'),
('Toys', 'Games & Sports');



-- Inserrt into company_regions;




insert into company_regions(region_id , company_regions , country)
       values(1, 'Northeast', 'USA'),
(2, 'Southeast', 'USA'),
(3, 'Northwest', 'USA'),
(4, 'Southwest', 'USA'),
(5, 'British Columbia', 'Canada'),
(6, 'Quebec', 'Canada'),
(7, 'Nova Scotia', 'Canada');




-- Insert into staff;


select * from staff;


insert into staff values (1,'Kelley','rkelley0@soundcloud.com','Female','Computers','10/2/2009',67470,'Structural Engineer',2);
insert into staff values (2,'Armstrong','sarmstrong1@infoseek.co.jp','Male','Sports','3/31/2008',71869,'Financial Advisor',2);
insert into staff values (3,'Carr','fcarr2@woothemes.com','Male','Automotive','7/12/2009',101768,'Recruiting Manager',3);
insert into staff values (4,'Murray','jmurray3@gov.uk','Female','Jewelery','12/25/2014',96897,'Desktop Support Technician',3);
insert into staff values (5,'Ellis','jellis4@sciencedirect.com','Female','Grocery','9/19/2002',63702,'Software Engineer III',7);
insert into staff values (6,'Phillips','bphillips5@time.com','Male','Tools','8/21/2013',118497,'Executive Secretary',1);
insert into staff values (7,'Williamson','rwilliamson6@ted.com','Male','Computers','5/14/2006',65889,'Dental Hygienist',6);
insert into staff values (8,'Harris','aharris7@ucoz.com','Female','Toys','8/12/2003',84427,'Safety Technician I',4);
insert into staff values (9,'James','rjames8@prnewswire.com','Male','Jewelery','9/7/2005',108657,'Sales Associate',2);
insert into staff values (10,'Sanchez','rsanchez9@cloudflare.com','Male','Movies','3/13/2013',108093,'Sales Representative',1);
insert into staff values (11,'Jacobs','jjacobsa@sbwire.com','Female','Jewelery','11/27/2003',121966,'Community Outreach Specialist',7);
insert into staff values (12,'Black','mblackb@edublogs.org','Male','Clothing','2/4/2003',44179,'Data Coordiator',7);
insert into staff values (13,'Schmidt','sschmidtc@state.gov','Male','Baby','10/13/2002',85227,'Compensation Analyst',3);
insert into staff values (14,'Webb','awebbd@baidu.com','Female','Computers','10/22/2006',59763,'Software Test Engineer III',4);
insert into staff values (15,'Jacobs','ajacobse@google.it','Female','Games','3/4/2007',141139,'Community Outreach Specialist',7);
insert into staff values (16,'Medina','smedinaf@amazonaws.com','Female','Baby','3/14/2008',106659,'Web Developer III',1);
insert into staff values (17,'Morgan','dmorgang@123-reg.co.uk','Female','Kids','5/4/2011',148952,'Programmer IV',6);
insert into staff values (18,'Nguyen','jnguyenh@google.com','Male','Home','11/3/2014',93804,'Geologist II',5);
insert into staff values (19,'Day','rdayi@chronoengine.com','Male','Electronics','9/22/2004',109890,'VP Sales',3);
insert into staff values (20,'Carr','dcarrj@ocn.ne.jp','Female','Movies','11/22/2007',115274,'VP Quality Control',5);
insert into staff values (21,'Bryant','sbryantk@wunderground.com','Female','Industrial','8/12/2005',78052,'Software Consultant',3);
insert into staff values (22,'Alexander','kalexanderl@marketwatch.com','Male','Automotive','12/26/2011',144724,'Marketing Assistant',2);
insert into staff values (23,'Chapman','jchapmanm@archive.org','Female','Jewelery','4/12/2001',126103,'Senior Developer',4);
insert into staff values (24,'Kelly','ekellyn@weibo.com','Male','Garden','6/29/2006',144965,'Nurse Practicioner',2);
insert into staff values (25,'Stephens','jstephenso@ow.ly','Male','Toys','6/4/2004',70613,'Business Systems Development Analyst',1);
insert into staff values (26,'Porter','vporterp@yelp.com','Female','Home','5/30/2011',90746,'Dental Hygienist',2);
insert into staff values (27,'Owens','cowensq@shareasale.com','Female','Home','5/26/2005',78698,'Executive Secretary',2);
insert into staff values (28,'Scott','cscottr@sphinn.com','Female','Books','3/2/2008',63336,'Sales Representative',4);
insert into staff values (29,'Price','cprices@usa.gov','Female','Clothing','7/5/2013',95436,'Quality Engineer',3);
insert into staff values (30,'Weaver','dweavert@shinystat.com','Male','Beauty','2/17/2012',83144,'Account Representative III',2);
insert into staff values (31,'Willis','hwillisu@army.mil','Female','Tools','10/21/2012',113507,'Accountant I',7);
insert into staff values (32,'Torres','ltorresv@amazon.de','Male','Games','4/7/2014',78245,'Nuclear Power Engineer',6);
insert into staff values (33,'Greene','wgreenew@blogspot.com','Male','Movies','3/21/2000',87057,'Assistant Manager',1);
insert into staff values (34,'Reed','areedx@cisco.com','Male','Movies','11/28/2002',120579,'Assistant Media Planner',6);
insert into staff values (35,'Smith','bsmithy@statcounter.com','Female','Books','6/13/2013',94884,'Librarian',7);
insert into staff values (36,'Bradley','nbradleyz@goodreads.com','Male','Outdoors','12/28/2008',107222,'Payment Adjustment Coordinator',3);
insert into staff values (37,'Cruz','rcruz10@blinklist.com','Female','Home','5/20/2000',61739,'Quality Engineer',1);
insert into staff values (38,'Williamson','dwilliamson11@rediff.com','Female','Garden','1/25/2012',82026,'Nurse',2);
insert into staff values (39,'Kennedy','skennedy12@rediff.com','Male','Baby','7/2/2011',79339,'Civil Engineer',1);
insert into staff values (40,'Hawkins','phawkins13@twitpic.com','Female','Clothing','8/20/2011',76809,'Quality Engineer',6);
insert into staff values (41,'Allen','jallen14@ustream.tv','Female','Baby','5/10/2001',89680,'Web Developer III',6);
insert into staff values (42,'Watkins','mwatkins15@wiley.com','Male','Computers','4/1/2008',125668,'Executive Secretary',7);
insert into staff values (43,'Ferguson','mferguson16@qq.com','Male','Sports','5/29/2009',82960,'Account Representative III',6);
insert into staff values (44,'Simmons','asimmons17@csmonitor.com','Male','Movies','12/21/2013',113857,'Developer III',2);
insert into staff values (45,'Nguyen','mnguyen18@biblegateway.com','Male','Automotive','1/24/2002',108378,'Electrical Engineer',7);
insert into staff values (46,'Lawrence','jlawrence19@linkedin.com','Male','Outdoors','12/11/2011',133424,'Junior Executive',7);
insert into staff values (47,'Oliver','joliver1a@cnbc.com','Female','Clothing','8/30/2013',42797,'Software Engineer III',5);
insert into staff values (48,'Johnson','jjohnson1b@usgs.gov','Male','Computers','4/26/2004',134940,'Financial Advisor',4);
insert into staff values (49,'Crawford','hcrawford1c@dell.com','Male','Home','12/21/2008',119471,'Editor',6);
insert into staff values (50,'Armstrong','parmstrong1d@hc360.com','Female','Automotive','3/16/2010',89969,'Senior Editor',4);
insert into staff values (51,'Dixon','jdixon1e@dot.gov','Male','Baby','9/26/2006',106281,'Senior Developer',3);
insert into staff values (52,'Snyder','ssnyder1f@ca.gov','Female','Kids','9/26/2002',141678,'Design Engineer',3);
insert into staff values (53,'Coleman','dcoleman1g@dedecms.com','Male','Computers','6/14/2008',110839,'Automation Specialist I',1);
insert into staff values (54,'Reed','sreed1h@intel.com','Female','Toys','4/15/2001',84275,'VP Marketing',5);
insert into staff values (55,'Ross','jross1i@infoseek.co.jp','Male','Automotive','4/21/2004',71363,'Environmental Tech',3);
insert into staff values (56,'Watkins','kwatkins1j@youtu.be','Male','Garden','12/2/2002',93680,'VP Accounting',3);
insert into staff values (57,'Allen','jallen1k@google.cn','Female','Outdoors','11/20/2000',73755,'Geologist II',3);
insert into staff values (58,'Baker','jbaker1l@usnews.com','Male','Games','3/2/2007',68857,'Information Systems Manager',2);
insert into staff values (59,'Garcia','vgarcia1m@deviantart.com','Female','Health','3/19/2002',48360,'Registered Nurse',6);
insert into staff values (60,'Lane','elane1n@un.org','Male','Outdoors','7/15/2004',104896,'Financial Advisor',5);
insert into staff values (61,'Watson','cwatson1o@paypal.com','Female','Tools','8/10/2009',81870,'Occupational Therapist',7);
insert into staff values (62,'Boyd','aboyd1p@artisteer.com','Male','Automotive','5/29/2007',69936,'Senior Editor',7);
insert into staff values (63,'Young','hyoung1q@cisco.com','Female','Grocery','12/11/2007',138844,'Mechanical Systems Engineer',6);
insert into staff values (64,'Cooper','tcooper1r@umich.edu','Male','Garden','11/12/2011',139796,'Office Assistant IV',1);
insert into staff values (65,'Jordan','jjordan1s@about.me','Female','Automotive','1/27/2000',86939,'Tax Accountant',3);
insert into staff values (66,'Rodriguez','lrodriguez1t@narod.ru','Male','Beauty','9/27/2003',141949,'Product Engineer',4);
insert into staff values (67,'Mills','jmills1u@printfriendly.com','Female','Grocery','8/8/2004',114200,'Senior Sales Associate',7);
insert into staff values (68,'Coleman','kcoleman1v@360.cn','Male','Beauty','9/2/2012',121378,'Web Developer I',7);
insert into staff values (69,'Stewart','dstewart1w@usnews.com','Male','Toys','8/22/2000',148144,'Data Coordiator',4);
insert into staff values (70,'Jordan','ajordan1x@moonfruit.com','Female','Games','11/13/2004',93839,'Database Administrator III',2);
insert into staff values (71,'Vasquez','evasquez1y@behance.net','Male','Baby','10/20/2002',77285,'Operator',6);
insert into staff values (72,'Knight','tknight1z@weibo.com','Female','Music','10/13/2002',135688,'Statistician I',4);
insert into staff values (73,'Palmer','ipalmer20@newsvine.com','Male','Sports','4/3/2002',78828,'Director of Sales',2);
insert into staff values (74,'Washington','jwashington21@squidoo.com','Female','Home','7/11/2000',47206,'Programmer III',3);
insert into staff values (75,'Sanchez','dsanchez22@blog.com','Female','Outdoors','10/6/2013',78157,'Senior Financial Analyst',1);
insert into staff values (76,'Grant','egrant23@prlog.org','Female','Electronics','7/23/2000',49296,'Software Test Engineer II',6);
insert into staff values (77,'Daniels','ndaniels24@google.ca','Male','Tools','2/7/2013',139061,'Environmental Specialist',3);
insert into staff values (78,'Medina','jmedina25@dot.gov','Female','Games','9/16/2005',114989,'Marketing Assistant',3);
insert into staff values (79,'Cunningham','acunningham26@simplemachines.org','Male','Clothing','9/15/2002',88345,'Junior Executive',6);
insert into staff values (80,'Little','klittle27@un.org','Male','Music','9/12/2001',114647,'Editor',5);
insert into staff values (81,'Welch','jwelch28@1und1.de','Male','Outdoors','7/24/2004',118514,'Accounting Assistant III',5);
insert into staff values (82,'Gilbert','hgilbert29@xrea.com','Female','Home','5/11/2003',93712,'Junior Executive',7);
insert into staff values (83,'George','ageorge2a@gmpg.org','Male','Industrial','5/2/2009',86373,'Compensation Analyst',7);
insert into staff values (84,'Hughes','mhughes2b@youtube.com','Male','Kids','1/28/2013',122110,'Structural Engineer',6);
insert into staff values (85,'Williams','jwilliams2c@businesswire.com','Female','Games','3/26/2006',95542,'Nurse',2);
insert into staff values (86,'Martinez','wmartinez2d@barnesandnoble.com','Female','Outdoors','5/25/2013',131392,'Systems Administrator II',2);
insert into staff values (87,'Hamilton','hhamilton2e@google.de','Male','Music','10/23/2010',98401,'VP Quality Control',1);
insert into staff values (88,'Gomez','jgomez2f@mtv.com','Female','Tools','9/19/2004',103806,'Accounting Assistant I',3);
insert into staff values (89,'Webb','awebb2g@springer.com','Male','Health','4/10/2014',73686,'Tax Accountant',2);
insert into staff values (90,'Thomas','tthomas2h@webnode.com','Male','Games','11/3/2011',55002,'Research Assistant IV',6);
insert into staff values (91,'Wallace','swallace2i@state.tx.us','Male','Baby','3/7/2005',65216,'Registered Nurse',4);
insert into staff values (92,'Ortiz','aortiz2j@jigsy.com','Female','Automotive','6/22/2010',113231,'Senior Editor',7);
insert into staff values (93,'Knight','nknight2k@cafepress.com','Female','Electronics','4/3/2014',125847,'Chemical Engineer',5);
insert into staff values (94,'Hunt','thunt2l@twitpic.com','Female','Music','5/31/2000',140430,'Senior Cost Accountant',2);
insert into staff values (95,'Franklin','sfranklin2m@wordpress.com','Male','Movies','11/6/2013',117105,'VP Quality Control',5);
insert into staff values (96,'Mason','wmason2n@xrea.com','Male','Beauty','2/21/2004',96673,'Accounting Assistant I',1);
insert into staff values (97,'Williams','wwilliams2o@berkeley.edu','Female','Games','3/14/2013',79267,'VP Quality Control',7);
insert into staff values (98,'Freeman','lfreeman2p@tiny.cc','Female','Kids','10/11/2007',109154,'Accountant I',4);
insert into staff values (99,'Palmer','ipalmer2q@youku.com','Female','Books','4/24/2002',138815,'Physical Therapy Assistant',3);
insert into staff values (100,'Bell','rbell2r@utexas.edu','Male','Sports','8/3/2007',68210,'Registered Nurse',4);
insert into staff values (101,'Rivera','jrivera2s@oakley.com','Male','Games','11/16/2002',137281,'VP Sales',3);
insert into staff values (102,'Matthews','kmatthews2t@oaic.gov.au','Male','Health','8/9/2008',114970,'Statistician IV',2);
insert into staff values (103,'Reed','dreed2u@arstechnica.com','Male','Automotive','7/19/2003',126001,'Structural Engineer',6);
insert into staff values (104,'Adams','eadams2v@yandex.ru','Male','Grocery','9/16/2003',78736,'Financial Analyst',6);
insert into staff values (105,'Young','syoung2w@cmu.edu','Male','Shoes','9/16/2009',80830,'Quality Control Specialist',4);
insert into staff values (106,'Gardner','rgardner2x@theguardian.com','Male','Kids','8/6/2009',47879,'Product Engineer',5);
insert into staff values (107,'Castillo','bcastillo2y@cornell.edu','Female','Computers','3/31/2004',132634,'Civil Engineer',2);
insert into staff values (108,'Perkins','jperkins2z@prlog.org','Male','Clothing','7/14/2005',68344,'Senior Cost Accountant',7);
insert into staff values (109,'Freeman','bfreeman30@fda.gov','Female','Clothing','10/14/2007',147868,'General Manager',6);
insert into staff values (110,'Howell','whowell31@free.fr','Male','Books','4/15/2011',67255,'Geologist III',4);
insert into staff values (111,'Austin','naustin32@discuz.net','Female','Computers','6/13/2012',47494,'Help Desk Operator',6);
insert into staff values (112,'Morris','amorris33@irs.gov','Female','Movies','7/19/2013',127645,'Legal Assistant',1);
insert into staff values (113,'Moore','kmoore34@shareasale.com','Male','Baby','3/1/2000',54413,'Operator',5);
insert into staff values (114,'Sims','msims35@i2i.jp','Male','Grocery','12/6/2012',136790,'Nuclear Power Engineer',2);
insert into staff values (115,'Nguyen','rnguyen36@bandcamp.com','Female','Clothing','6/30/2007',58420,'Graphic Designer',1);
insert into staff values (116,'Wells','awells37@theatlantic.com','Male','Industrial','1/17/2002',73813,'Occupational Therapist',3);
insert into staff values (117,'Martin','jmartin38@chron.com','Male','Movies','10/2/2012',49644,'Senior Developer',4);
insert into staff values (118,'Fox','pfox39@discovery.com','Male','Automotive','9/3/2009',87134,'Assistant Manager',3);
insert into staff values (119,'Washington','wwashington3a@dot.gov','Female','Clothing','10/6/2008',148408,'Speech Pathologist',3);
insert into staff values (120,'Evans','wevans3b@scientificamerican.com','Female','Toys','1/23/2008',77335,'Chemical Engineer',4);
insert into staff values (121,'Elliott','belliott3c@jiathis.com','Female','Sports','8/5/2007',131409,'Technical Writer',7);
insert into staff values (122,'Wagner','jwagner3d@fotki.com','Male','Baby','2/26/2001',77530,'Librarian',1);
insert into staff values (123,'Griffin','agriffin3e@mtv.com','Female','Garden','4/26/2002',101875,'Business Systems Development Analyst',4);
insert into staff values (124,'Chavez','mchavez3f@sohu.com','Female','Grocery','12/7/2005',144028,'Executive Secretary',6);
insert into staff values (125,'Dean','ldean3g@blogspot.com','Female','Movies','5/5/2012',140708,'Nurse',1);
insert into staff values (126,'Burton','bburton3h@360.cn','Male','Shoes','7/11/2013',79172,'Associate Professor',7);
insert into staff values (127,'Harper','sharper3i@slideshare.net','Female','Outdoors','5/18/2000',144639,'VP Quality Control',7);
insert into staff values (128,'Gibson','tgibson3j@ucoz.com','Male','Computers','3/24/2003',109449,'Engineer II',7);
insert into staff values (129,'Grant','lgrant3k@live.com','Female','Computers','10/15/2006',108441,'Nurse',6);
insert into staff values (130,'Nichols','bnichols3l@dropbox.com','Female','Games','7/3/2008',145692,'Recruiting Manager',5);
insert into staff values (131,'Kelley','wkelley3m@domainmarket.com','Male','Shoes','2/24/2000',120377,'Research Nurse',4);
insert into staff values (132,'Montgomery','rmontgomery3n@chicagotribune.com','Female','Home','5/14/2003',63929,'Research Assistant IV',5);
insert into staff values (133,'Martinez','dmartinez3o@deviantart.com','Male','Games','2/1/2001',124853,'Systems Administrator III',2);
insert into staff values (134,'Harvey','jharvey3p@angelfire.com','Female','Outdoors','6/3/2010',99854,'VP Marketing',6);
insert into staff values (135,'Hicks','ahicks3q@pcworld.com','Female','Kids','8/11/2013',58675,'Technical Writer',3);
insert into staff values (136,'Rose','lrose3r@slideshare.net','Female','Beauty','5/16/2007',50060,'Accountant IV',1);
insert into staff values (137,'Simmons','jsimmons3s@imageshack.us','Female','Sports','8/9/2014',72748,'Quality Control Specialist',3);
insert into staff values (138,'Montgomery','wmontgomery3t@taobao.com','Male','Electronics','9/1/2005',71082,'Geologist III',7);
insert into staff values (139,'Hart','rhart3u@wsj.com','Male','Jewelery','1/8/2012',119773,'Pharmacist',3);
insert into staff values (140,'Wheeler','bwheeler3v@google.co.uk','Male','Computers','1/22/2001',82358,'Information Systems Manager',4);
insert into staff values (141,'Williamson','rwilliamson3w@amazon.co.jp','Male','Games','12/12/2005',145575,'VP Accounting',1);
insert into staff values (142,'Burton','gburton3x@umich.edu','Male','Industrial','12/6/2009',105810,'Recruiter',5);
insert into staff values (143,'Gutierrez','jgutierrez3y@tuttocitta.it','Male','Tools','5/6/2014',58805,'Database Administrator I',1);
insert into staff values (144,'Barnes','lbarnes3z@indiegogo.com','Female','Baby','12/8/2008',112837,'Clinical Specialist',5);
insert into staff values (145,'Day','lday40@upenn.edu','Female','Baby','4/14/2013',125914,'Junior Executive',6);
insert into staff values (146,'Thompson','athompson41@booking.com','Male','Movies','2/4/2009',133281,'Account Executive',6);
insert into staff values (147,'Hernandez','ahernandez42@pagesperso-orange.fr','Female','Music','10/6/2012',96169,'Civil Engineer',1);
insert into staff values (148,'Sanders','lsanders43@linkedin.com','Male','Movies','5/9/2013',146970,'Staff Accountant III',3);
insert into staff values (149,'Meyer','jmeyer44@facebook.com','Female','Toys','5/3/2008',76352,'Human Resources Assistant IV',4);
insert into staff values (150,'Diaz','pdiaz45@who.int','Male','Health','10/15/2006',128748,'Web Developer III',1);
insert into staff values (151,'Larson','blarson46@newsvine.com','Male','Books','8/9/2011',50066,'Operator',1);
insert into staff values (152,'Roberts','droberts47@jimdo.com','Male','Music','7/22/2011',105319,'Compensation Analyst',4);
insert into staff values (153,'Carroll','jcarroll48@cisco.com','Male','Home','10/30/2003',110622,'Safety Technician IV',4);
insert into staff values (154,'Russell','mrussell49@exblog.jp','Female','Electronics','10/16/2009',87422,'Help Desk Operator',7);
insert into staff values (155,'Robinson','trobinson4a@amazon.com','Male','Books','9/6/2007',45456,'Chemical Engineer',1);
insert into staff values (156,'Hayes','ahayes4b@guardian.co.uk','Male','Industrial','5/21/2004',52298,'Analyst Programmer',7);
insert into staff values (157,'Henry','dhenry4c@yelp.com','Male','Shoes','5/14/2007',131252,'Account Representative III',1);
insert into staff values (158,'Chavez','mchavez4d@baidu.com','Male','Garden','2/23/2001',128766,'Desktop Support Technician',2);
insert into staff values (159,'Harvey','eharvey4e@opera.com','Male','Tools','9/12/2009',138179,'Analog Circuit Design manager',3);
insert into staff values (160,'Gutierrez','cgutierrez4f@usnews.com','Female','Industrial','6/22/2003',85012,'Financial Analyst',1);
insert into staff values (161,'Cruz','mcruz4g@dedecms.com','Male','Health','8/24/2001',131479,'Senior Cost Accountant',7);
insert into staff values (162,'Sullivan','jsullivan4h@cloudflare.com','Female','Health','12/28/2005',103182,'Accounting Assistant I',2);
insert into staff values (163,'Robertson','jrobertson4i@live.com','Male','Garden','6/7/2000',96996,'Software Test Engineer I',4);
insert into staff values (164,'Robertson','trobertson4j@youtu.be','Female','Computers','8/30/2008',106607,'Automation Specialist I',2);
insert into staff values (165,'Lawson','jlawson4k@prnewswire.com','Male','Automotive','12/5/2012',130993,'Administrative Officer',2);
insert into staff values (166,'Meyer','kmeyer4l@bloglovin.com','Male','Industrial','3/5/2006',87097,'Safety Technician IV',7);
insert into staff values (167,'Lopez','rlopez4m@foxnews.com','Male','Outdoors','1/25/2013',131961,'Legal Assistant',4);
insert into staff values (168,'Burns','pburns4n@networksolutions.com','Female','Jewelery','6/9/2014',88093,'Editor',7);
insert into staff values (169,'Sanders','rsanders4o@salon.com','Male','Movies','12/24/2010',41898,'Tax Accountant',6);
insert into staff values (170,'Martinez','cmartinez4p@facebook.com','Male','Electronics','6/28/2004',52808,'Human Resources Assistant I',2);
insert into staff values (171,'Harris','mharris4q@squarespace.com','Female','Movies','9/27/2004',110912,'Geologist I',5);
insert into staff values (172,'Fields','rfields4r@amazon.co.uk','Male','Books','9/5/2009',101520,'Project Manager',1);
insert into staff values (173,'Fox','ffox4s@geocities.com','Female','Books','11/21/2005',55633,'Systems Administrator IV',1);
insert into staff values (174,'Reynolds','dreynolds4t@biglobe.ne.jp','Female','Books','10/8/2010',91561,'VP Product Management',7);
insert into staff values (175,'Daniels','cdaniels4u@rambler.ru','Male','Grocery','11/7/2013',77307,'Biostatistician IV',7);
insert into staff values (176,'Fisher','rfisher4v@jigsy.com','Male','Clothing','10/14/2012',67942,'Financial Advisor',6);
insert into staff values (177,'Ferguson','nferguson4w@networksolutions.com','Female','Clothing','9/18/2008',80397,'Compensation Analyst',1);
insert into staff values (178,'Butler','cbutler4x@amazon.de','Female','Sports','2/17/2003',78157,'Librarian',1);
insert into staff values (179,'Reynolds','rreynolds4y@miitbeian.gov.cn','Female','Garden','1/29/2004',121836,'VP Accounting',7);
insert into staff values (180,'Williamson','nwilliamson4z@dropbox.com','Male','Outdoors','11/8/2008',76063,'Administrative Assistant II',6);
insert into staff values (181,'Shaw','sshaw50@instagram.com','Female','Garden','5/2/2001',56923,'Social Worker',2);
insert into staff values (182,'Gomez','rgomez51@baidu.com','Female','Industrial','4/4/2009',76932,'Legal Assistant',5);
insert into staff values (183,'Harrison','jharrison52@scientificamerican.com','Female','Games','8/3/2002',64410,'Senior Developer',2);
insert into staff values (184,'Watson','ewatson53@latimes.com','Female','Books','2/2/2008',111873,'Payment Adjustment Coordinator',2);
insert into staff values (185,'Watson','rwatson54@webeden.co.uk','Female','Clothing','9/22/2001',74648,'Health Coach III',2);
insert into staff values (186,'Larson','dlarson55@technorati.com','Female','Toys','9/17/2011',144991,'Technical Writer',7);
insert into staff values (187,'Gordon','kgordon56@techcrunch.com','Female','Outdoors','11/4/2005',107407,'Systems Administrator II',3);
insert into staff values (188,'Rose','erose57@guardian.co.uk','Male','Grocery','3/17/2012',120225,'Editor',7);
insert into staff values (189,'Anderson','banderson58@wsj.com','Male','Home','12/2/2014',122272,'Environmental Specialist',2);
insert into staff values (190,'Powell','hpowell59@geocities.com','Female','Health','11/13/2002',120577,'Web Designer III',1);
insert into staff values (191,'Woods','dwoods5a@businesswire.com','Female','Electronics','4/29/2008',148986,'Structural Analysis Engineer',1);
insert into staff values (192,'Morales','jmorales5b@joomla.org','Male','Games','2/10/2000',101855,'Engineer IV',4);
insert into staff values (193,'Stanley','dstanley5c@is.gd','Female','Industrial','2/17/2006',140850,'Financial Analyst',4);
insert into staff values (194,'Wagner','ewagner5d@cornell.edu','Male','Toys','2/1/2006',142516,'Professor',1);
insert into staff values (195,'Meyer','nmeyer5e@about.me','Male','Shoes','11/9/2012',48829,'Accountant I',1);
insert into staff values (196,'Jacobs','rjacobs5f@oracle.com','Male','Outdoors','9/16/2006',81270,'Geological Engineer',1);
insert into staff values (197,'Hayes','jhayes5g@jiathis.com','Female','Beauty','1/3/2011',130097,'Office Assistant IV',5);
insert into staff values (198,'Sanders','esanders5h@ihg.com','Female','Industrial','1/24/2000',117905,'Dental Hygienist',4);
insert into staff values (199,'Reed','sreed5i@bloglovin.com','Female','Shoes','11/12/2010',142483,'Social Worker',3);
insert into staff values (200,'George','mgeorge5j@cdc.gov','Male','Movies','9/20/2004',89633,'Software Consultant',4);
insert into staff values (201,'Andrews','jandrews5k@free.fr','Male','Home','3/18/2009',48684,'Nurse Practicioner',6);
insert into staff values (202,'Morris','lmorris5l@patch.com','Female','Automotive','1/23/2004',91932,'Analyst Programmer',1);
insert into staff values (203,'Moreno','jmoreno5m@xing.com','Female','Grocery','10/7/2005',112004,'Internal Auditor',7);
insert into staff values (204,'Powell','cpowell5n@cocolog-nifty.com','Female','Beauty','9/25/2000',116013,'Tax Accountant',4);
insert into staff values (205,'Graham','jgraham5o@printfriendly.com','Female','Games','9/10/2008',109058,'Chemical Engineer',7);
insert into staff values (206,'Riley','hriley5p@dailymotion.com','Male','Toys','5/6/2012',61992,'Sales Representative',4);
insert into staff values (207,'Harris','mharris5q@utexas.edu','Female','Movies','10/2/2008',129527,'Statistician II',2);
insert into staff values (208,'Gilbert','rgilbert5r@domainmarket.com','Female','Grocery','12/15/2001',67746,'Director of Sales',2);
insert into staff values (209,'Peterson','jpeterson5s@t-online.de','Male','Books','3/14/2010',104530,'VP Marketing',2);
insert into staff values (210,'Foster','jfoster5t@icq.com','Female','Music','1/17/2008',42759,'Social Worker',4);
insert into staff values (211,'Fowler','afowler5u@parallels.com','Female','Kids','2/25/2011',43097,'Associate Professor',2);
insert into staff values (212,'Matthews','fmatthews5v@theatlantic.com','Female','Outdoors','11/22/2005',123936,'Internal Auditor',1);
insert into staff values (213,'Thomas','gthomas5w@slate.com','Male','Tools','11/28/2006',128239,'Teacher',6);
insert into staff values (214,'West','gwest5x@hao123.com','Male','Computers','10/31/2003',66084,'Electrical Engineer',6);
insert into staff values (215,'Stevens','estevens5y@salon.com','Male','Games','3/14/2009',106729,'Occupational Therapist',5);
insert into staff values (216,'Howard','dhoward5z@soundcloud.com','Male','Jewelery','3/15/2009',87269,'General Manager',4);
insert into staff values (217,'Boyd','mboyd60@jimdo.com','Male','Home','12/1/2004',128765,'Senior Financial Analyst',2);
insert into staff values (218,'Ross','iross61@jimdo.com','Male','Games','5/25/2003',104671,'VP Marketing',7);
insert into staff values (219,'Harrison','vharrison62@networkadvertising.org','Male','Shoes','5/1/2011',55073,'Assistant Professor',4);
insert into staff values (220,'Ellis','lellis63@ucla.edu','Female','Outdoors','11/21/2007',146256,'Paralegal',1);
insert into staff values (221,'Diaz','sdiaz64@disqus.com','Female','Home','1/15/2005',55077,'Registered Nurse',7);
insert into staff values (222,'Snyder','asnyder65@soundcloud.com','Female','Grocery','4/11/2011',124215,'Recruiting Manager',2);
insert into staff values (223,'Gibson','bgibson66@lulu.com','Male','Computers','4/28/2008',105444,'Human Resources Assistant II',6);
insert into staff values (224,'Hanson','dhanson67@cmu.edu','Female','Sports','5/1/2010',141513,'Staff Accountant I',1);
insert into staff values (225,'Peterson','mpeterson68@home.pl','Female','Shoes','3/13/2008',97623,'Technical Writer',1);
insert into staff values (226,'Gonzalez','tgonzalez69@umich.edu','Male','Health','11/12/2005',106833,'Registered Nurse',7);
insert into staff values (227,'Rivera','crivera6a@amazon.co.jp','Female','Beauty','4/18/2006',69045,'Accounting Assistant IV',2);
insert into staff values (228,'Washington','cwashington6b@cargocollective.com','Male','Outdoors','7/4/2008',113311,'Programmer III',2);
insert into staff values (229,'Ruiz','lruiz6c@thetimes.co.uk','Female','Outdoors','11/2/2013',116301,'Design Engineer',3);
insert into staff values (230,'Ford','sford6d@flavors.me','Female','Industrial','1/5/2006',138459,'Geological Engineer',1);
insert into staff values (231,'Day','lday6e@usgs.gov','Female','Clothing','7/3/2005',87800,'Sales Associate',7);
insert into staff values (232,'Peterson','apeterson6f@sina.com.cn','Female','Kids','5/27/2000',52572,'Compensation Analyst',7);
insert into staff values (233,'Gonzalez','rgonzalez6g@europa.eu','Male','Electronics','4/24/2009',44917,'Biostatistician IV',5);
insert into staff values (234,'Walker','jwalker6h@google.es','Female','Shoes','2/2/2010',110896,'Accountant II',2);
insert into staff values (235,'Griffin','sgriffin6i@123-reg.co.uk','Male','Books','12/22/2001',108970,'Senior Cost Accountant',2);
insert into staff values (236,'Tucker','jtucker6j@dailymail.co.uk','Male','Jewelery','4/27/2009',83543,'Programmer II',5);
insert into staff values (237,'Armstrong','aarmstrong6k@redcross.org','Female','Music','7/14/2013',63598,'Budget/Accounting Analyst II',1);
insert into staff values (238,'Gonzales','cgonzales6l@berkeley.edu','Male','Movies','4/6/2014',131274,'Clinical Specialist',2);
insert into staff values (239,'Williamson','jwilliamson6m@arizona.edu','Female','Computers','2/16/2005',149085,'Software Engineer III',7);
insert into staff values (240,'Spencer','wspencer6n@marriott.com','Male','Games','9/21/2013',143223,'Staff Accountant IV',6);
insert into staff values (241,'Rose','jrose6o@dion.ne.jp','Female','Clothing','12/22/2010',107207,'Web Developer II',3);
insert into staff values (242,'Robinson','probinson6p@ucla.edu','Male','Health','11/30/2003',137594,'Operator',6);
insert into staff values (243,'Gutierrez','kgutierrez6q@bravesites.com','Male','Home','1/26/2006',139845,'Director of Sales',4);
insert into staff values (244,'Alvarez','jalvarez6r@geocities.com','Female','Sports','9/7/2012',65563,'Help Desk Technician',4);
insert into staff values (245,'Webb','swebb6s@people.com.cn','Female','Kids','1/2/2014',142988,'Marketing Manager',6);
insert into staff values (246,'Ellis','tellis6t@squarespace.com','Female','Industrial','1/22/2000',134074,'Product Engineer',6);
insert into staff values (247,'Romero','jromero6u@cafepress.com','Male','Toys','1/21/2010',80654,'Geological Engineer',2);
insert into staff values (248,'White','jwhite6v@tripadvisor.com','Male','Garden','12/13/2005',118834,'Financial Analyst',6);
insert into staff values (249,'Miller','jmiller6w@businesswire.com','Male','Kids','3/3/2013',85559,'Pharmacist',2);
insert into staff values (250,'Fowler','mfowler6x@geocities.jp','Male','Books','9/15/2001',84049,'Information Systems Manager',5);
insert into staff values (251,'Duncan','pduncan6y@sina.com.cn','Female','Jewelery','1/16/2011',47439,'Tax Accountant',7);
insert into staff values (252,'Johnston','jjohnston6z@irs.gov','Male','Tools','12/16/2000',87072,'Structural Engineer',7);
insert into staff values (253,'Marshall','mmarshall70@hibu.com','Female','Computers','5/12/2003',123401,'Computer Systems Analyst I',4);
insert into staff values (254,'Lawrence','alawrence71@unicef.org','Female','Grocery','4/2/2001',131681,'Account Executive',7);
insert into staff values (255,'Lynch','rlynch72@sitemeter.com','Female','Kids','8/29/2014',96118,'Social Worker',5);
insert into staff values (256,'Stone','gstone73@google.es','Female','Books','12/1/2006',87816,'Administrative Assistant I',2);
insert into staff values (257,'Freeman','gfreeman74@bloomberg.com','Female','Home','6/5/2012',83804,'Operator',1);
insert into staff values (258,'Schmidt','dschmidt75@sitemeter.com','Male','Automotive','10/26/2007',133612,'VP Product Management',4);
insert into staff values (259,'Wallace','gwallace76@technorati.com','Female','Computers','4/14/2010',47007,'Internal Auditor',3);
insert into staff values (260,'Fuller','ffuller77@ustream.tv','Male','Health','12/13/2005',142967,'GIS Technical Architect',5);
insert into staff values (261,'Bennett','jbennett78@surveymonkey.com','Female','Kids','12/6/2011',71433,'Food Chemist',4);
insert into staff values (262,'Lewis','dlewis79@parallels.com','Female','Beauty','3/8/2000',74191,'Business Systems Development Analyst',1);
insert into staff values (263,'Snyder','dsnyder7a@digg.com','Male','Movies','1/29/2005',109004,'Account Coordinator',5);
insert into staff values (264,'Sanders','ksanders7b@pinterest.com','Male','Industrial','4/20/2014',102211,'Senior Cost Accountant',3);
insert into staff values (265,'Fox','wfox7c@yelp.com','Male','Computers','8/3/2000',75862,'Electrical Engineer',5);
insert into staff values (266,'Burke','cburke7d@ameblo.jp','Male','Jewelery','3/5/2000',61446,'Environmental Specialist',2);
insert into staff values (267,'Murphy','dmurphy7e@patch.com','Male','Home','6/2/2011',146432,'VP Quality Control',2);
insert into staff values (268,'Bowman','hbowman7f@reddit.com','Female','Grocery','2/18/2002',50623,'Biostatistician III',7);
insert into staff values (269,'Cunningham','kcunningham7g@squidoo.com','Male','Outdoors','12/11/2014',108248,'Safety Technician I',3);
insert into staff values (270,'Torres','ttorres7h@telegraph.co.uk','Female','Automotive','8/6/2005',120875,'Software Consultant',1);
insert into staff values (271,'Jordan','pjordan7i@squidoo.com','Female','Sports','8/7/2001',123843,'Senior Sales Associate',7);
insert into staff values (272,'Banks','jbanks7j@dion.ne.jp','Male','Music','5/16/2014',43940,'Health Coach I',2);
insert into staff values (273,'Gordon','egordon7k@yellowbook.com','Female','Movies','1/6/2013',142840,'Account Coordinator',1);
insert into staff values (274,'Bennett','abennett7l@guardian.co.uk','Male','Garden','8/1/2006',125713,'Account Representative III',3);
insert into staff values (275,'Rivera','arivera7m@comcast.net','Female','Books','4/26/2010',122219,'Engineer I',6);
insert into staff values (276,'Ellis','dellis7n@seesaa.net','Female','Electronics','5/21/2000',46259,'Help Desk Technician',6);
insert into staff values (277,'Richardson','lrichardson7o@fc2.com','Female','Clothing','7/14/2003',142403,'Engineer III',3);
insert into staff values (278,'Ortiz','wortiz7p@reddit.com','Male','Garden','1/26/2000',88165,'Librarian',4);
insert into staff values (279,'Clark','mclark7q@privacy.gov.au','Male','Garden','6/26/2007',86291,'Dental Hygienist',7);
insert into staff values (280,'Chavez','rchavez7r@youtu.be','Male','Kids','6/4/2008',139163,'Legal Assistant',5);
insert into staff values (281,'Holmes','aholmes7s@last.fm','Male','Music','11/5/2006',48892,'Accounting Assistant I',1);
insert into staff values (282,'Fowler','rfowler7t@ameblo.jp','Female','Outdoors','12/24/2014',120540,'Junior Executive',6);
insert into staff values (283,'George','ageorge7u@1und1.de','Female','Health','3/13/2000',47450,'Automation Specialist I',1);
insert into staff values (284,'Murray','kmurray7v@ca.gov','Female','Health','8/25/2008',142255,'Quality Engineer',4);
insert into staff values (285,'Hunter','rhunter7w@buzzfeed.com','Male','Garden','8/16/2000',62441,'Environmental Specialist',3);
insert into staff values (286,'Long','elong7x@nymag.com','Female','Games','3/11/2007',142529,'Librarian',2);
insert into staff values (287,'Andrews','tandrews7y@ycombinator.com','Female','Beauty','3/19/2010',142103,'Associate Professor',4);
insert into staff values (288,'Moore','bmoore7z@twitpic.com','Male','Electronics','8/11/2002',102395,'Account Coordinator',6);
insert into staff values (289,'Sanders','csanders80@blog.com','Male','Home','10/9/2009',44593,'Engineer III',2);
insert into staff values (290,'Carter','scarter81@cargocollective.com','Male','Grocery','2/9/2007',120800,'Accountant III',5);
insert into staff values (291,'Moreno','rmoreno82@alibaba.com','Female','Books','11/26/2003',121238,'Senior Developer',4);
insert into staff values (292,'Ortiz','dortiz83@themeforest.net','Female','Automotive','12/8/2011',91296,'Environmental Tech',6);
insert into staff values (293,'Castillo','pcastillo84@1688.com','Female','Health','8/24/2011',86070,'Clinical Specialist',3);
insert into staff values (294,'Cooper','icooper85@w3.org','Female','Movies','1/31/2009',61519,'Human Resources Assistant III',7);
insert into staff values (295,'Harris','lharris86@ibm.com','Female','Books','9/20/2005',47131,'Developer IV',6);
insert into staff values (296,'Edwards','aedwards87@webeden.co.uk','Male','Kids','4/7/2008',93962,'Staff Scientist',3);
insert into staff values (297,'Harrison','nharrison88@imageshack.us','Male','Shoes','11/12/2014',133845,'Executive Secretary',4);
insert into staff values (298,'Berry','lberry89@gov.uk','Male','Clothing','6/17/2010',43067,'Research Assistant I',7);
insert into staff values (299,'Stephens','cstephens8a@imdb.com','Female','Beauty','9/1/2001',88972,'Paralegal',7);
insert into staff values (300,'Arnold','barnold8b@thetimes.co.uk','Male','Clothing','11/15/2005',77635,'VP Product Management',3);
insert into staff values (301,'Myers','amyers8c@ibm.com','Male','Grocery','5/16/2011',148993,'Speech Pathologist',1);
insert into staff values (302,'Jenkins','rjenkins8d@wufoo.com','Female','Tools','8/15/2002',113599,'Geological Engineer',2);
insert into staff values (303,'West','jwest8e@berkeley.edu','Male','Electronics','3/15/2012',76943,'General Manager',7);
insert into staff values (304,'Mccoy','mmccoy8f@wisc.edu','Female','Books','5/26/2007',77486,'Community Outreach Specialist',4);
insert into staff values (305,'Johnson','fjohnson8g@wikipedia.org','Male','Electronics','11/20/2013',135001,'Recruiting Manager',4);
insert into staff values (306,'Sanders','ssanders8h@mtv.com','Male','Baby','11/10/2008',52171,'Data Coordiator',2);
insert into staff values (307,'Cunningham','acunningham8i@wikimedia.org','Female','Garden','6/22/2006',139302,'Engineer IV',5);
insert into staff values (308,'Lynch','slynch8j@123-reg.co.uk','Female','Health','8/9/2000',126683,'Librarian',4);
insert into staff values (309,'Riley','driley8k@dell.com','Male','Sports','7/4/2006',143781,'Product Engineer',4);
insert into staff values (310,'Ray','aray8l@cbc.ca','Male','Books','3/5/2008',51761,'Cost Accountant',5);
insert into staff values (311,'Lane','plane8m@pbs.org','Male','Shoes','5/26/2011',45463,'Marketing Manager',5);
insert into staff values (312,'Jordan','pjordan8n@adobe.com','Female','Clothing','11/15/2003',133498,'Nuclear Power Engineer',7);
insert into staff values (313,'Gibson','bgibson8o@pen.io','Female','Home','3/21/2011',81273,'Health Coach II',4);
insert into staff values (314,'Elliott','telliott8p@mozilla.org','Male','Computers','2/27/2008',77921,'Environmental Specialist',7);
insert into staff values (315,'Smith','bsmith8q@mysql.com','Male','Games','7/25/2012',59580,'General Manager',2);
insert into staff values (316,'Peters','cpeters8r@epa.gov','Male','Sports','9/16/2010',40418,'VP Marketing',2);
insert into staff values (317,'Tucker','htucker8s@photobucket.com','Male','Grocery','8/5/2004',104844,'Structural Analysis Engineer',3);
insert into staff values (318,'Moore','jmoore8t@umich.edu','Male','Computers','4/27/2003',139304,'Help Desk Technician',3);
insert into staff values (319,'Crawford','mcrawford8u@parallels.com','Female','Home','12/20/2011',140996,'Software Engineer IV',3);
insert into staff values (320,'Gilbert','egilbert8v@nydailynews.com','Male','Garden','4/12/2010',52430,'Assistant Media Planner',5);
insert into staff values (321,'Wheeler','jwheeler8w@whitehouse.gov','Female','Books','8/24/2001',145284,'Information Systems Manager',7);
insert into staff values (322,'Marshall','jmarshall8x@va.gov','Male','Computers','11/7/2013',66063,'Web Designer III',2);
insert into staff values (323,'Robinson','rrobinson8y@businessinsider.com','Male','Electronics','4/10/2008',134422,'Occupational Therapist',4);
insert into staff values (324,'Stevens','astevens8z@si.edu','Female','Computers','5/19/2012',106229,'Research Associate',4);
insert into staff values (325,'Wright','kwright90@buzzfeed.com','Female','Clothing','5/13/2012',107727,'Computer Systems Analyst I',2);
insert into staff values (326,'Castillo','bcastillo91@hc360.com','Female','Jewelery','12/12/2007',130188,'Social Worker',3);
insert into staff values (327,'Edwards','medwards92@mail.ru','Male','Automotive','10/4/2002',140194,'Programmer IV',5);
insert into staff values (328,'Hanson','bhanson93@blinklist.com','Female','Computers','1/6/2005',58719,'Media Manager I',4);
insert into staff values (329,'Mccoy','hmccoy94@miitbeian.gov.cn','Female','Shoes','7/27/2004',86803,'Administrative Assistant III',4);
insert into staff values (330,'Dunn','cdunn95@ft.com','Male','Industrial','6/23/2010',68334,'Administrative Officer',7);
insert into staff values (331,'Hudson','jhudson96@thetimes.co.uk','Female','Sports','12/23/2008',91906,'Food Chemist',4);
insert into staff values (332,'Garza','lgarza97@bing.com','Female','Games','12/20/2006',48064,'Office Assistant II',5);
insert into staff values (333,'Garza','pgarza98@go.com','Male','Industrial','6/30/2004',75281,'Data Coordiator',7);
insert into staff values (334,'Mills','fmills99@ameblo.jp','Male','Industrial','3/24/2009',91659,'VP Accounting',4);
insert into staff values (335,'Gilbert','pgilbert9a@wiley.com','Female','Sports','10/3/2001',52792,'Pharmacist',2);
insert into staff values (336,'Campbell','pcampbell9b@istockphoto.com','Female','Home','8/30/2001',40415,'Food Chemist',4);
insert into staff values (337,'Spencer','dspencer9c@ed.gov','Male','Movies','6/16/2008',83256,'Senior Editor',5);
insert into staff values (338,'Garrett','kgarrett9d@wordpress.com','Female','Electronics','12/30/2012',145181,'Programmer Analyst III',1);
insert into staff values (339,'Hudson','rhudson9e@geocities.com','Female','Jewelery','7/23/2004',78294,'Software Consultant',4);
insert into staff values (340,'Williams','jwilliams9f@canalblog.com','Male','Electronics','7/3/2007',90120,'Biostatistician I',2);
insert into staff values (341,'Ellis','cellis9g@ibm.com','Male','Home','9/24/2008',80284,'VP Accounting',3);
insert into staff values (342,'Carroll','scarroll9h@yellowbook.com','Female','Shoes','7/26/2009',85511,'Business Systems Development Analyst',5);
insert into staff values (343,'Long','along9i@ocn.ne.jp','Female','Toys','6/13/2008',40138,'Payment Adjustment Coordinator',6);
insert into staff values (344,'Owens','eowens9j@skyrock.com','Male','Books','6/17/2010',42714,'Electrical Engineer',7);
insert into staff values (345,'Perez','jperez9k@bloglines.com','Male','Music','6/21/2005',65767,'Programmer Analyst I',4);
insert into staff values (346,'Freeman','lfreeman9l@cpanel.net','Female','Kids','2/13/2013',149351,'Design Engineer',7);
insert into staff values (347,'Frazier','dfrazier9m@amazon.co.uk','Female','Tools','1/3/2012',88470,'Associate Professor',1);
insert into staff values (348,'Thomas','athomas9n@answers.com','Female','Electronics','11/26/2009',90317,'Health Coach I',4);
insert into staff values (349,'Crawford','acrawford9o@cpanel.net','Male','Garden','10/10/2012',142149,'Compensation Analyst',2);
insert into staff values (350,'Hawkins','ahawkins9p@hud.gov','Male','Electronics','5/21/2000',144073,'Programmer I',1);
insert into staff values (351,'Fuller','jfuller9q@merriam-webster.com','Female','Books','8/17/2001',54410,'Programmer Analyst II',7);
insert into staff values (352,'Moreno','smoreno9r@slate.com','Male','Home','6/28/2000',107907,'Financial Advisor',5);
insert into staff values (353,'Gonzales','jgonzales9s@sourceforge.net','Female','Home','7/10/2010',91249,'Mechanical Systems Engineer',2);
insert into staff values (354,'Hudson','shudson9t@shareasale.com','Male','Outdoors','12/20/2005',78478,'Compensation Analyst',5);
insert into staff values (355,'Murray','cmurray9u@reverbnation.com','Male','Sports','7/7/2005',48812,'Human Resources Assistant III',7);
insert into staff values (356,'Stephens','estephens9v@bbc.co.uk','Female','Grocery','4/27/2000',147440,'Sales Associate',2);
insert into staff values (357,'Reynolds','dreynolds9w@angelfire.com','Male','Outdoors','5/18/2003',87978,'Senior Financial Analyst',1);
insert into staff values (358,'Gutierrez','jgutierrez9x@telegraph.co.uk','Male','Automotive','6/17/2002',67800,'Desktop Support Technician',2);
insert into staff values (359,'Tucker','gtucker9y@instagram.com','Male','Baby','5/14/2010',42944,'Tax Accountant',3);
insert into staff values (360,'Jenkins','jjenkins9z@w3.org','Female','Automotive','7/18/2004',84356,'Marketing Assistant',2);
insert into staff values (361,'Rice','dricea0@hubpages.com','Female','Garden','12/6/2006',144724,'Senior Quality Engineer',7);
insert into staff values (362,'Burke','jburkea1@mayoclinic.com','Male','Grocery','9/8/2003',147290,'Analyst Programmer',6);
insert into staff values (363,'Hall','jhalla2@prweb.com','Male','Automotive','12/28/2001',83177,'Community Outreach Specialist',3);
insert into staff values (364,'Ryan','rryana3@twitter.com','Male','Health','5/31/2014',83252,'Civil Engineer',3);
insert into staff values (365,'Gonzales','jgonzalesa4@cpanel.net','Male','Clothing','8/30/2000',127393,'Help Desk Technician',7);
insert into staff values (366,'Jacobs','bjacobsa5@domainmarket.com','Male','Industrial','1/29/2006',67186,'Research Nurse',1);
insert into staff values (367,'Ramos','jramosa6@cdbaby.com','Female','Beauty','3/5/2002',102361,'Computer Systems Analyst III',5);
insert into staff values (368,'Rivera','driveraa7@typepad.com','Female','Kids','8/15/2001',60688,'Paralegal',1);
insert into staff values (369,'Lawrence','llawrencea8@mozilla.com','Female','Electronics','4/24/2013',44704,'Data Coordiator',2);
insert into staff values (370,'Austin','eaustina9@answers.com','Male','Home','1/9/2002',110627,'Teacher',7);
insert into staff values (371,'Sims','bsimsaa@privacy.gov.au','Male','Sports','6/4/2000',127223,'Operator',5);
insert into staff values (372,'Harper','rharperab@china.com.cn','Female','Kids','8/31/2001',96163,'Safety Technician IV',3);
insert into staff values (373,'Sims','jsimsac@a8.net','Male','Jewelery','4/24/2012',86524,'Developer IV',5);
insert into staff values (374,'Mcdonald','jmcdonaldad@sbwire.com','Female','Baby','9/19/2005',141464,'Programmer IV',4);
insert into staff values (375,'Hudson','mhudsonae@ihg.com','Female','Industrial','8/27/2014',88029,'Help Desk Operator',4);
insert into staff values (376,'Harper','charperaf@google.pl','Male','Home','3/21/2007',47281,'VP Quality Control',6);
insert into staff values (377,'Alexander','valexanderag@amazon.co.uk','Female','Electronics','1/15/2002',93245,'Staff Scientist',1);
insert into staff values (378,'Nichols','bnicholsah@networkadvertising.org','Male','Automotive','7/30/2012',110589,'Cost Accountant',7);
insert into staff values (379,'Hicks','ghicksai@weibo.com','Male','Jewelery','4/3/2003',63735,'VP Accounting',6);
insert into staff values (380,'Turner','bturneraj@samsung.com','Female','Industrial','11/23/2013',91182,'Compensation Analyst',5);
insert into staff values (381,'Welch','dwelchak@printfriendly.com','Male','Music','9/9/2012',133007,'Software Test Engineer I',7);
insert into staff values (382,'Payne','jpayneal@comsenz.com','Female','Home','8/10/2012',92879,'Nurse',2);
insert into staff values (383,'Young','pyoungam@theguardian.com','Male','Clothing','12/10/2002',104079,'Systems Administrator IV',4);
insert into staff values (384,'Butler','dbutleran@eventbrite.com','Female','Beauty','11/1/2005',63918,'Structural Engineer',4);
insert into staff values (385,'Carroll','ecarrollao@newsvine.com','Female','Automotive','5/2/2011',128885,'Office Assistant III',5);
insert into staff values (386,'Griffin','tgriffinap@reddit.com','Male','Games','2/27/2011',140567,'Research Associate',2);
insert into staff values (387,'Burke','mburkeaq@360.cn','Female','Garden','8/9/2003',95726,'Registered Nurse',4);
insert into staff values (388,'Kelley','akelleyar@list-manage.com','Female','Music','1/24/2008',84261,'Senior Editor',5);
insert into staff values (389,'Ortiz','gortizas@w3.org','Male','Baby','6/22/2013',42924,'Marketing Assistant',2);
insert into staff values (390,'Olson','aolsonat@cpanel.net','Male','Computers','9/14/2008',86670,'Web Designer II',2);
insert into staff values (391,'White','cwhiteau@amazon.de','Female','Clothing','11/4/2003',147702,'VP Quality Control',4);
insert into staff values (392,'Peters','apetersav@loc.gov','Female','Beauty','2/2/2013',132470,'Database Administrator II',6);
insert into staff values (393,'Sullivan','ksullivanaw@slideshare.net','Female','Music','9/11/2000',63341,'Research Associate',7);
insert into staff values (394,'Washington','rwashingtonax@gmpg.org','Female','Beauty','10/23/2002',91651,'Staff Accountant III',4);
insert into staff values (395,'Ward','jwarday@quantcast.com','Male','Baby','9/11/2013',48927,'Sales Representative',6);
insert into staff values (396,'Kelly','bkellyaz@bandcamp.com','Female','Kids','11/17/2013',143433,'Web Developer II',1);
insert into staff values (397,'Martin','hmartinb0@homestead.com','Male','Toys','10/2/2006',81998,'Product Engineer',5);
insert into staff values (398,'Cooper','scooperb1@cmu.edu','Female','Home','5/8/2001',68584,'Quality Engineer',2);
insert into staff values (399,'Holmes','jholmesb2@uol.com.br','Female','Computers','7/4/2009',88216,'Accountant III',3);
insert into staff values (400,'Harrison','jharrisonb3@google.de','Male','Health','12/24/2011',86046,'Nuclear Power Engineer',5);
insert into staff values (401,'Parker','jparkerb4@mit.edu','Female','Outdoors','3/5/2008',148906,'Project Manager',5);
insert into staff values (402,'Marshall','emarshallb5@yahoo.co.jp','Female','Clothing','11/10/2007',93266,'Recruiter',7);
insert into staff values (403,'Chapman','schapmanb6@nhs.uk','Female','Home','3/9/2002',69702,'Food Chemist',1);
insert into staff values (404,'Harvey','aharveyb7@who.int','Female','Outdoors','12/28/2010',43366,'Administrative Assistant IV',4);
insert into staff values (405,'Morgan','dmorganb8@moonfruit.com','Male','Industrial','5/19/2005',101945,'Web Developer I',2);
insert into staff values (406,'Foster','pfosterb9@intel.com','Male','Toys','2/1/2003',54007,'Geological Engineer',5);
insert into staff values (407,'Vasquez','jvasquezba@dion.ne.jp','Male','Baby','4/9/2013',54704,'Analog Circuit Design manager',3);
insert into staff values (408,'Moore','jmoorebb@liveinternet.ru','Female','Computers','11/13/2007',93954,'Project Manager',5);
insert into staff values (409,'Williams','swilliamsbc@bing.com','Female','Home','4/22/2007',58235,'Analog Circuit Design manager',6);
insert into staff values (410,'Harris','lharrisbd@ow.ly','Female','Tools','1/7/2012',148940,'Senior Financial Analyst',6);
insert into staff values (411,'Hayes','chayesbe@usnews.com','Male','Kids','4/9/2003',110615,'Paralegal',6);
insert into staff values (412,'Vasquez','jvasquezbf@dailymail.co.uk','Male','Jewelery','1/14/2012',94596,'Web Developer I',1);
insert into staff values (413,'Brooks','lbrooksbg@storify.com','Female','Health','9/19/2008',94502,'Executive Secretary',1);
insert into staff values (414,'Peterson','epetersonbh@reverbnation.com','Male','Games','8/10/2011',72505,'Registered Nurse',3);
insert into staff values (415,'Holmes','dholmesbi@jugem.jp','Male','Toys','6/18/2001',147150,'Analog Circuit Design manager',6);
insert into staff values (416,'Butler','dbutlerbj@wix.com','Female','Beauty','2/9/2002',66313,'Food Chemist',5);
insert into staff values (417,'Hanson','shansonbk@ted.com','Male','Electronics','11/4/2002',97372,'Systems Administrator I',6);
insert into staff values (418,'Morales','dmoralesbl@mit.edu','Female','Home','10/2/2013',149598,'VP Product Management',3);
insert into staff values (419,'Dixon','jdixonbm@indiatimes.com','Male','Health','2/22/2008',104224,'Clinical Specialist',5);
insert into staff values (420,'Henry','hhenrybn@privacy.gov.au','Female','Tools','9/24/2007',95583,'Civil Engineer',2);
insert into staff values (421,'Harper','rharperbo@webeden.co.uk','Female','Music','1/5/2001',92043,'Assistant Manager',3);
insert into staff values (422,'Torres','ctorresbp@yahoo.com','Female','Computers','9/17/2009',118307,'Staff Accountant II',1);
insert into staff values (423,'Walker','awalkerbq@wsj.com','Female','Jewelery','5/11/2011',145281,'VP Accounting',4);
insert into staff values (424,'Berry','jberrybr@discuz.net','Female','Home','8/20/2013',148640,'Internal Auditor',4);
insert into staff values (425,'Carpenter','lcarpenterbs@xrea.com','Female','Computers','9/7/2000',125523,'Financial Advisor',7);
insert into staff values (426,'Graham','tgrahambt@mediafire.com','Male','Kids','1/12/2009',49503,'Occupational Therapist',5);
insert into staff values (427,'Clark','aclarkbu@npr.org','Female','Sports','9/10/2000',146611,'Systems Administrator III',7);
insert into staff values (428,'Schmidt','rschmidtbv@tumblr.com','Female','Sports','2/8/2012',125465,'Teacher',1);
insert into staff values (429,'Ortiz','jortizbw@t.co','Female','Clothing','1/23/2003',75024,'Structural Analysis Engineer',6);
insert into staff values (430,'Hall','ehallbx@google.com.br','Male','Sports','10/25/2011',60793,'Registered Nurse',7);
insert into staff values (431,'Bishop','kbishopby@loc.gov','Female','Tools','6/6/2010',110744,'Accountant I',2);
insert into staff values (432,'Murphy','nmurphybz@jiathis.com','Female','Jewelery','8/21/2006',46653,'Registered Nurse',4);
insert into staff values (433,'Parker','dparkerc0@webeden.co.uk','Male','Games','5/4/2014',114919,'Database Administrator III',7);
insert into staff values (434,'Lee','rleec1@ibm.com','Female','Computers','7/24/2000',98733,'Payment Adjustment Coordinator',4);
insert into staff values (435,'Ellis','kellisc2@cafepress.com','Female','Health','8/23/2008',139775,'Chemical Engineer',1);
insert into staff values (436,'Bishop','abishopc3@e-recht24.de','Female','Jewelery','5/10/2005',69559,'Programmer Analyst III',3);
insert into staff values (437,'Roberts','arobertsc4@businessweek.com','Male','Movies','7/10/2007',48934,'Electrical Engineer',6);
insert into staff values (438,'Moreno','bmorenoc5@addtoany.com','Male','Grocery','4/25/2014',79980,'Recruiter',5);
insert into staff values (439,'Boyd','eboydc6@unc.edu','Male','Clothing','4/1/2002',108854,'Senior Editor',4);
insert into staff values (440,'Murphy','amurphyc7@wikia.com','Male','Books','1/23/2007',128105,'Help Desk Technician',7);
insert into staff values (441,'Bailey','jbaileyc8@newsvine.com','Male','Books','6/10/2008',71676,'GIS Technical Architect',4);
insert into staff values (442,'Bryant','jbryantc9@zdnet.com','Female','Music','9/11/2007',139347,'Data Coordiator',1);
insert into staff values (443,'Powell','cpowellca@samsung.com','Female','Industrial','2/28/2002',80491,'GIS Technical Architect',7);
insert into staff values (444,'Ferguson','jfergusoncb@sphinn.com','Female','Tools','12/30/2010',119385,'Assistant Media Planner',4);
insert into staff values (445,'Greene','dgreenecc@reuters.com','Male','Toys','3/23/2002',149835,'Geologist III',1);
insert into staff values (446,'Kennedy','pkennedycd@google.cn','Female','Health','12/2/2008',80137,'Business Systems Development Analyst',2);
insert into staff values (447,'Brooks','cbrooksce@washingtonpost.com','Male','Home','8/25/2000',79724,'Developer IV',7);
insert into staff values (448,'Brooks','jbrookscf@ucla.edu','Male','Books','6/25/2009',102458,'Occupational Therapist',1);
insert into staff values (449,'Gray','tgraycg@fotki.com','Female','Clothing','4/20/2014',134205,'Biostatistician I',4);
insert into staff values (450,'Morgan','kmorganch@reddit.com','Female','Beauty','5/21/2004',76052,'Technical Writer',5);
insert into staff values (451,'Robinson','arobinsonci@mapy.cz','Female','Music','11/17/2004',144608,'Research Associate',4);
insert into staff values (452,'Kennedy','ckennedycj@boston.com','Female','Toys','5/10/2000',111072,'Senior Quality Engineer',4);
insert into staff values (453,'Anderson','aandersonck@whitehouse.gov','Male','Automotive','1/24/2010',126485,'Computer Systems Analyst I',6);
insert into staff values (454,'Price','jpricecl@liveinternet.ru','Female','Baby','9/22/2006',96388,'Graphic Designer',6);
insert into staff values (455,'Hawkins','jhawkinscm@furl.net','Female','Automotive','6/13/2002',115506,'Product Engineer',2);
insert into staff values (456,'Watson','swatsoncn@wufoo.com','Female','Industrial','3/10/2012',115679,'Editor',2);
insert into staff values (457,'Cole','bcoleco@parallels.com','Female','Jewelery','12/11/2001',133040,'Research Associate',6);
insert into staff values (458,'Little','dlittlecp@usatoday.com','Female','Movies','5/14/2000',91660,'Research Assistant I',5);
insert into staff values (459,'Robertson','erobertsoncq@prweb.com','Female','Computers','9/20/2009',136406,'Chemical Engineer',7);
insert into staff values (460,'Sanchez','lsanchezcr@rediff.com','Male','Automotive','4/28/2005',146167,'Assistant Professor',5);
insert into staff values (461,'Lane','llanecs@free.fr','Female','Books','4/4/2003',94299,'Media Manager III',4);
insert into staff values (462,'Perry','rperryct@answers.com','Male','Industrial','7/31/2004',56382,'Executive Secretary',3);
insert into staff values (463,'Mason','dmasoncu@about.com','Male','Tools','12/21/2010',120160,'Database Administrator II',3);
insert into staff values (464,'Brooks','dbrookscv@biblegateway.com','Female','Shoes','4/23/2008',77060,'Marketing Manager',3);
insert into staff values (465,'White','dwhitecw@exblog.jp','Male','Computers','10/17/2007',122540,'Administrative Officer',2);
insert into staff values (466,'Carroll','fcarrollcx@ucoz.ru','Female','Games','5/29/2008',128562,'Senior Developer',7);
insert into staff values (467,'Ford','efordcy@elpais.com','Female','Sports','3/15/2002',60674,'Software Engineer I',3);
insert into staff values (468,'Ross','grosscz@blogtalkradio.com','Male','Jewelery','4/16/2005',93609,'Environmental Specialist',6);
insert into staff values (469,'Hicks','rhicksd0@histats.com','Female','Kids','8/8/2010',97913,'Occupational Therapist',3);
insert into staff values (470,'Rice','triced1@examiner.com','Female','Grocery','8/13/2005',108380,'Data Coordiator',5);
insert into staff values (471,'Lewis','plewisd2@businessinsider.com','Female','Baby','11/16/2007',50448,'Database Administrator III',4);
insert into staff values (472,'Arnold','larnoldd3@webeden.co.uk','Female','Books','2/25/2012',133781,'Office Assistant I',4);
insert into staff values (473,'Jordan','djordand4@trellian.com','Female','Books','11/14/2009',90409,'Research Assistant II',3);
insert into staff values (474,'Reed','creedd5@bloglines.com','Male','Garden','1/7/2004',144953,'Registered Nurse',7);
insert into staff values (475,'Jenkins','sjenkinsd6@bloglovin.com','Male','Outdoors','12/22/2001',46072,'Nurse',2);
insert into staff values (476,'Matthews','jmatthewsd7@economist.com','Male','Books','2/1/2012',119602,'Actuary',5);
insert into staff values (477,'Gonzalez','lgonzalezd8@fastcompany.com','Male','Computers','10/17/2010',122231,'Director of Sales',5);
insert into staff values (478,'Mason','jmasond9@networkadvertising.org','Male','Sports','4/16/2003',147166,'Systems Administrator I',6);
insert into staff values (479,'Nelson','lnelsonda@example.com','Male','Grocery','9/8/2009',56465,'Programmer IV',6);
insert into staff values (480,'Miller','amillerdb@reddit.com','Male','Electronics','2/7/2001',78158,'Programmer Analyst I',5);
insert into staff values (481,'Moore','kmooredc@simplemachines.org','Male','Jewelery','6/5/2013',62815,'Compensation Analyst',4);
insert into staff values (482,'Harris','rharrisdd@paypal.com','Male','Toys','6/10/2007',126468,'Budget/Accounting Analyst III',4);
insert into staff values (483,'Brown','mbrownde@bizjournals.com','Female','Beauty','5/10/2012',79419,'Senior Developer',3);
insert into staff values (484,'Little','glittledf@xrea.com','Male','Computers','3/23/2009',83093,'Registered Nurse',1);
insert into staff values (485,'Austin','caustindg@pen.io','Female','Kids','11/3/2014',90797,'Help Desk Operator',1);
insert into staff values (486,'Young','fyoungdh@npr.org','Female','Kids','7/6/2008',78755,'Desktop Support Technician',5);
insert into staff values (487,'Fox','hfoxdi@acquirethisname.com','Female','Kids','4/18/2003',128726,'Business Systems Development Analyst',3);
insert into staff values (488,'Brooks','ebrooksdj@berkeley.edu','Male','Music','12/15/2011',69026,'Nuclear Power Engineer',6);
insert into staff values (489,'Parker','lparkerdk@salon.com','Female','Garden','1/16/2014',78109,'Research Nurse',5);
insert into staff values (490,'Griffin','bgriffindl@pbs.org','Male','Movies','4/8/2000',116480,'Nurse Practicioner',5);
insert into staff values (491,'Stevens','bstevensdm@aol.com','Female','Toys','6/13/2004',108444,'Environmental Tech',7);
insert into staff values (492,'Evans','levansdn@house.gov','Male','Computers','2/8/2010',106535,'Staff Scientist',1);
insert into staff values (493,'Banks','bbanksdo@bravesites.com','Male','Computers','6/24/2008',137025,'Research Nurse',5);
insert into staff values (494,'Sullivan','ksullivandp@ucoz.com','Male','Industrial','3/3/2005',71663,'Analog Circuit Design manager',3);
insert into staff values (495,'Black','eblackdq@ihg.com','Female','Books','10/8/2004',80073,'Senior Developer',3);
insert into staff values (496,'Andrews','dandrewsdr@patch.com','Male','Beauty','3/14/2008',40254,'Quality Control Specialist',5);
insert into staff values (497,'Jenkins','bjenkinsds@kickstarter.com','Female','Grocery','3/10/2011',80027,'VP Sales',3);
insert into staff values (498,'Gutierrez','jgutierrezdt@woothemes.com','Female','Garden','8/22/2001',106994,'Technical Writer',3);
insert into staff values (499,'Hansen','jhansendu@timesonline.co.uk','Male','Toys','4/29/2001',145559,'Office Assistant III',2);
insert into staff values (500,'Rodriguez','drodriguezdv@histats.com','Male','Industrial','3/21/2001',91994,'Actuary',5);
insert into staff values (501,'Bailey','hbaileydw@networksolutions.com','Male','Music','8/5/2001',138540,'Geologist IV',7);
insert into staff values (502,'Banks','gbanksdx@berkeley.edu','Female','Computers','10/17/2010',136034,'Product Engineer',4);
insert into staff values (503,'Rose','jrosedy@squarespace.com','Female','Baby','1/19/2004',127291,'Accounting Assistant III',7);
insert into staff values (504,'Weaver','mweaverdz@ft.com','Male','Industrial','3/19/2000',131283,'Staff Scientist',4);
insert into staff values (505,'Walker','jwalkere0@oakley.com','Male','Computers','6/20/2005',122108,'Analog Circuit Design manager',7);
insert into staff values (506,'Cox','ncoxe1@1und1.de','Female','Home','1/1/2008',49048,'Sales Associate',1);
insert into staff values (507,'Reed','preede2@who.int','Female','Baby','11/1/2012',97427,'Occupational Therapist',6);
insert into staff values (508,'Marshall','dmarshalle3@about.me','Male','Computers','5/14/2007',90960,'Software Test Engineer II',7);
insert into staff values (509,'Gonzalez','rgonzaleze4@furl.net','Male','Health','12/30/2011',43986,'Geologist IV',3);
insert into staff values (510,'Lawrence','rlawrencee5@hhs.gov','Male','Outdoors','11/21/2014',108748,'Senior Editor',4);
insert into staff values (511,'Medina','tmedinae6@g.co','Female','Industrial','12/3/2006',102149,'Sales Representative',5);
insert into staff values (512,'Carpenter','rcarpentere7@blog.com','Male','Outdoors','6/13/2008',133360,'Research Nurse',7);
insert into staff values (513,'Carter','mcartere8@twitpic.com','Female','Garden','7/9/2004',70814,'Account Representative I',4);
insert into staff values (514,'Peters','gpeterse9@people.com.cn','Male','Grocery','12/18/2010',132037,'Web Developer IV',6);
insert into staff values (515,'Gomez','kgomezea@bloglovin.com','Male','Clothing','5/1/2002',55747,'Human Resources Assistant I',1);
insert into staff values (516,'Stanley','rstanleyeb@alibaba.com','Female','Toys','6/9/2006',89324,'Systems Administrator IV',3);
insert into staff values (517,'Carpenter','lcarpenterec@technorati.com','Male','Computers','2/8/2011',124418,'Chief Design Engineer',7);
insert into staff values (518,'Peters','cpetersed@goo.ne.jp','Female','Grocery','12/25/2005',138093,'Human Resources Assistant I',3);
insert into staff values (519,'Hamilton','chamiltonee@google.es','Male','Electronics','8/26/2003',141340,'Budget/Accounting Analyst III',4);
insert into staff values (520,'Owens','sowensef@ted.com','Male','Industrial','6/2/2006',54672,'Structural Engineer',4);
insert into staff values (521,'Williamson','dwilliamsoneg@creativecommons.org','Male','Clothing','10/6/2003',118602,'Director of Sales',5);
insert into staff values (522,'Flores','lfloreseh@tinyurl.com','Male','Jewelery','2/4/2000',97745,'Electrical Engineer',7);
insert into staff values (523,'Johnston','ajohnstonei@php.net','Female','Health','6/10/2012',143855,'Internal Auditor',5);
insert into staff values (524,'Edwards','pedwardsej@businessinsider.com','Female','Health','6/15/2009',43431,'Physical Therapy Assistant',6);
insert into staff values (525,'Payne','tpayneek@newyorker.com','Female','Tools','3/1/2002',94016,'VP Quality Control',2);
insert into staff values (526,'Allen','lallenel@nyu.edu','Female','Baby','9/9/2011',66847,'Assistant Media Planner',2);
insert into staff values (527,'Richards','jrichardsem@1688.com','Male','Clothing','4/20/2005',69705,'Senior Developer',3);
insert into staff values (528,'Cole','fcoleen@msn.com','Male','Sports','2/8/2012',96739,'Product Engineer',2);
insert into staff values (529,'Meyer','lmeyereo@storify.com','Female','Garden','9/1/2006',52956,'Senior Developer',3);
insert into staff values (530,'Reyes','lreyesep@foxnews.com','Female','Computers','12/14/2012',71559,'Librarian',1);
insert into staff values (531,'Hudson','rhudsoneq@fotki.com','Male','Home','11/17/2010',143226,'Food Chemist',7);
insert into staff values (532,'Rice','rriceer@wired.com','Male','Books','2/14/2011',145747,'Financial Advisor',3);
insert into staff values (533,'Castillo','dcastilloes@cocolog-nifty.com','Female','Industrial','10/15/2013',72001,'Automation Specialist IV',2);
insert into staff values (534,'Harrison','jharrisonet@mapquest.com','Female','Music','9/20/2000',50308,'Compensation Analyst',6);
insert into staff values (535,'Morris','rmorriseu@yahoo.com','Female','Home','7/25/2007',131662,'Help Desk Operator',3);
insert into staff values (536,'Castillo','acastilloev@cnet.com','Female','Kids','5/19/2011',55730,'Speech Pathologist',7);
insert into staff values (537,'Webb','rwebbew@twitter.com','Female','Games','2/12/2005',63836,'Occupational Therapist',1);
insert into staff values (538,'Freeman','gfreemanex@nps.gov','Male','Shoes','10/24/2005',121296,'Civil Engineer',2);
insert into staff values (539,'Kelley','rkelleyey@feedburner.com','Male','Movies','3/20/2012',110660,'Senior Financial Analyst',4);
insert into staff values (540,'Matthews','lmatthewsez@edublogs.org','Male','Games','12/19/2001',89114,'GIS Technical Architect',5);
insert into staff values (541,'Mendoza','tmendozaf0@google.nl','Female','Music','8/28/2007',48769,'Nurse',5);
insert into staff values (542,'Rice','ericef1@cpanel.net','Male','Music','2/1/2008',90069,'Assistant Professor',5);
insert into staff values (543,'Walker','kwalkerf2@vinaora.com','Female','Home','9/7/2013',120085,'Human Resources Assistant III',6);
insert into staff values (544,'Moore','mmooref3@oakley.com','Female','Electronics','11/15/2007',41697,'Automation Specialist I',7);
insert into staff values (545,'Lynch','jlynchf4@jimdo.com','Male','Kids','5/4/2009',44093,'Health Coach IV',5);
insert into staff values (546,'Fox','mfoxf5@jimdo.com','Female','Jewelery','11/1/2006',59294,'Senior Editor',6);
insert into staff values (547,'Moreno','bmorenof6@vkontakte.ru','Male','Industrial','8/21/2013',140858,'Cost Accountant',7);
insert into staff values (548,'Simpson','dsimpsonf7@engadget.com','Female','Toys','1/10/2009',46444,'Desktop Support Technician',6);
insert into staff values (549,'Reynolds','kreynoldsf8@vistaprint.com','Female','Books','9/26/2012',85855,'Financial Advisor',4);
insert into staff values (550,'Watson','lwatsonf9@alexa.com','Male','Shoes','5/1/2000',72334,'Developer IV',3);
insert into staff values (551,'Cruz','bcruzfa@nbcnews.com','Male','Music','10/4/2011',69246,'Web Developer III',6);
insert into staff values (552,'Gomez','cgomezfb@reddit.com','Male','Beauty','3/18/2011',107389,'Community Outreach Specialist',2);
insert into staff values (553,'George','rgeorgefc@youtube.com','Male','Automotive','12/16/2009',141505,'Associate Professor',6);
insert into staff values (554,'Frazier','mfrazierfd@tripod.com','Male','Toys','1/6/2008',60318,'Engineer I',5);
insert into staff values (555,'Bryant','cbryantfe@phpbb.com','Female','Outdoors','6/12/2014',148260,'Executive Secretary',7);
insert into staff values (556,'Ferguson','mfergusonff@trellian.com','Female','Electronics','12/20/2006',73199,'Payment Adjustment Coordinator',2);
insert into staff values (557,'Frazier','dfrazierfg@twitter.com','Male','Kids','8/26/2002',111244,'Environmental Specialist',6);
insert into staff values (558,'Hudson','jhudsonfh@soundcloud.com','Male','Baby','3/21/2012',103845,'Nurse Practicioner',1);
insert into staff values (559,'Murphy','jmurphyfi@naver.com','Female','Computers','10/19/2008',88666,'Senior Editor',7);
insert into staff values (560,'Kim','jkimfj@dropbox.com','Male','Clothing','1/22/2014',67845,'Administrative Officer',7);
insert into staff values (561,'Rodriguez','jrodriguezfk@cafepress.com','Male','Sports','4/8/2004',62527,'Recruiter',1);
insert into staff values (562,'Perez','jperezfl@seesaa.net','Male','Tools','5/17/2003',73412,'Librarian',5);
insert into staff values (563,'Graham','bgrahamfm@usatoday.com','Male','Beauty','4/21/2011',123391,'Financial Advisor',7);
insert into staff values (564,'Martinez','amartinezfn@people.com.cn','Female','Health','2/23/2005',99508,'VP Quality Control',5);
insert into staff values (565,'Pierce','jpiercefo@cnet.com','Female','Jewelery','4/17/2014',55726,'Geologist III',7);
insert into staff values (566,'Lynch','mlynchfp@reverbnation.com','Male','Electronics','12/10/2011',67140,'Systems Administrator III',3);
insert into staff values (567,'Myers','dmyersfq@amazon.com','Female','Home','5/27/2010',139060,'Assistant Professor',7);
insert into staff values (568,'Day','kdayfr@wix.com','Male','Home','7/20/2004',135993,'Geologist IV',4);
insert into staff values (569,'Little','jlittlefs@bravesites.com','Female','Books','11/12/2010',80788,'Programmer I',4);
insert into staff values (570,'James','rjamesft@jiathis.com','Female','Clothing','3/21/2001',136377,'Software Engineer I',7);
insert into staff values (571,'Ortiz','eortizfu@java.com','Female','Electronics','6/19/2009',46247,'VP Accounting',3);
insert into staff values (572,'Duncan','jduncanfv@etsy.com','Male','Automotive','3/17/2014',45774,'Electrical Engineer',2);
insert into staff values (573,'Kennedy','jkennedyfw@nasa.gov','Female','Sports','4/23/2010',100741,'Senior Cost Accountant',1);
insert into staff values (574,'Pierce','dpiercefx@marketwatch.com','Male','Grocery','9/20/2005',45534,'Senior Sales Associate',1);
insert into staff values (575,'Bowman','abowmanfy@devhub.com','Male','Games','4/26/2002',75399,'VP Quality Control',7);
insert into staff values (576,'Taylor','staylorfz@issuu.com','Male','Clothing','7/13/2006',50235,'Assistant Media Planner',1);
insert into staff values (577,'Jones','jjonesg0@g.co','Male','Baby','1/27/2011',128048,'Programmer III',5);
insert into staff values (578,'Lynch','hlynchg1@washingtonpost.com','Male','Clothing','5/2/2006',111318,'Technical Writer',3);
insert into staff values (579,'Barnes','jbarnesg2@hubpages.com','Female','Garden','12/23/2000',100763,'Database Administrator I',7);
insert into staff values (580,'Weaver','kweaverg3@wikia.com','Male','Computers','5/23/2012',54231,'Accounting Assistant II',3);
insert into staff values (581,'Cunningham','pcunninghamg4@example.com','Female','Sports','3/25/2010',92334,'GIS Technical Architect',3);
insert into staff values (582,'Ramirez','hramirezg5@merriam-webster.com','Male','Jewelery','3/16/2005',58111,'Research Associate',5);
insert into staff values (583,'Hunter','ehunterg6@ucsd.edu','Female','Shoes','12/12/2000',112048,'Software Engineer II',5);
insert into staff values (584,'Cook','ccookg7@blog.com','Female','Music','5/13/2008',109404,'Chief Design Engineer',6);
insert into staff values (585,'Lopez','nlopezg8@fema.gov','Male','Garden','7/19/2007',138776,'Senior Editor',2);
insert into staff values (586,'Olson','folsong9@acquirethisname.com','Female','Home','7/1/2003',110411,'Compensation Analyst',3);
insert into staff values (587,'Martin','pmartinga@webnode.com','Female','Toys','9/7/2002',74973,'General Manager',7);
insert into staff values (588,'Day','edaygb@google.nl','Female','Tools','10/15/2002',129890,'Software Consultant',4);
insert into staff values (589,'Arnold','sarnoldgc@parallels.com','Male','Movies','1/27/2005',135786,'Account Representative I',7);
insert into staff values (590,'Allen','rallengd@cnet.com','Female','Grocery','6/15/2007',132998,'Business Systems Development Analyst',3);
insert into staff values (591,'Sims','wsimsge@vinaora.com','Female','Baby','2/28/2014',84318,'Software Test Engineer I',2);
insert into staff values (592,'Duncan','aduncangf@behance.net','Male','Shoes','4/11/2004',110407,'Sales Associate',5);
insert into staff values (593,'Evans','aevansgg@wordpress.org','Female','Home','6/15/2000',94980,'Financial Advisor',4);
insert into staff values (594,'Chapman','schapmangh@arstechnica.com','Female','Industrial','3/7/2004',125843,'Web Designer II',4);
insert into staff values (595,'Price','rpricegi@flavors.me','Female','Grocery','1/27/2000',66180,'Staff Scientist',5);
insert into staff values (596,'Ford','jfordgj@nyu.edu','Female','Jewelery','11/27/2014',88854,'Account Representative I',4);
insert into staff values (597,'Lynch','alynchgk@tumblr.com','Female','Beauty','2/10/2004',71448,'Electrical Engineer',1);
insert into staff values (598,'Diaz','jdiazgl@hhs.gov','Female','Sports','11/2/2002',60547,'Community Outreach Specialist',2);
insert into staff values (599,'Watkins','rwatkinsgm@independent.co.uk','Female','Outdoors','11/21/2010',128805,'Occupational Therapist',5);
insert into staff values (600,'Ruiz','sruizgn@reddit.com','Female','Outdoors','5/11/2006',96782,'Database Administrator II',5);
insert into staff values (601,'Lopez','blopezgo@sourceforge.net','Male','Health','3/12/2001',125944,'Office Assistant II',2);
insert into staff values (602,'Henderson','chendersongp@sina.com.cn','Male','Tools','9/17/2011',101937,'Teacher',7);
insert into staff values (603,'Webb','lwebbgq@last.fm','Male','Jewelery','12/6/2000',127569,'Analyst Programmer',7);
insert into staff values (604,'Greene','agreenegr@cmu.edu','Male','Clothing','6/30/2004',104517,'Research Assistant III',2);
insert into staff values (605,'Stephens','estephensgs@phoca.cz','Female','Grocery','12/11/2010',110366,'Research Nurse',6);
insert into staff values (606,'Parker','rparkergt@1688.com','Female','Industrial','2/8/2003',136917,'Assistant Professor',4);
insert into staff values (607,'Reyes','hreyesgu@gnu.org','Male','Sports','7/21/2007',130563,'Nuclear Power Engineer',7);
insert into staff values (608,'Garza','hgarzagv@webmd.com','Male','Health','11/13/2004',73553,'Accountant IV',6);
insert into staff values (609,'Fisher','dfishergw@myspace.com','Male','Electronics','1/21/2007',93995,'Teacher',2);
insert into staff values (610,'Hicks','hhicksgx@ifeng.com','Male','Health','8/23/2009',45270,'VP Marketing',7);
insert into staff values (611,'Ford','jfordgy@earthlink.net','Female','Shoes','10/29/2009',147739,'Safety Technician I',5);
insert into staff values (612,'Fowler','cfowlergz@joomla.org','Female','Health','9/10/2003',142211,'Software Test Engineer IV',4);
insert into staff values (613,'Coleman','hcolemanh0@feedburner.com','Female','Beauty','9/26/2006',48791,'Teacher',1);
insert into staff values (614,'Ramirez','jramirezh1@php.net','Female','Electronics','11/2/2008',112929,'Account Coordinator',5);
insert into staff values (615,'Alexander','falexanderh2@irs.gov','Female','Clothing','12/25/2009',72854,'Marketing Assistant',7);
insert into staff values (616,'Marshall','hmarshallh3@com.com','Female','Automotive','10/10/2006',47281,'VP Sales',6);
insert into staff values (617,'Mills','hmillsh4@lulu.com','Female','Health','6/12/2013',49410,'Account Representative II',1);
insert into staff values (618,'Phillips','wphillipsh5@economist.com','Male','Clothing','6/7/2001',128205,'Sales Representative',6);
insert into staff values (619,'Cole','jcoleh6@php.net','Male','Tools','6/2/2014',133190,'Research Nurse',7);
insert into staff values (620,'Olson','aolsonh7@psu.edu','Female','Books','8/14/2009',59644,'Systems Administrator III',1);
insert into staff values (621,'Reynolds','nreynoldsh8@redcross.org','Male','Kids','10/31/2004',111427,'Programmer I',4);
insert into staff values (622,'Wright','rwrighth9@jimdo.com','Male','Electronics','3/15/2002',98339,'Assistant Manager',3);
insert into staff values (623,'Ford','mfordha@youku.com','Male','Beauty','2/27/2006',72948,'Teacher',6);
insert into staff values (624,'Garza','mgarzahb@elegantthemes.com','Male','Books','11/26/2008',60203,'Product Engineer',2);
insert into staff values (625,'Andrews','handrewshc@salon.com','Female','Outdoors','12/2/2007',147003,'Chemical Engineer',1);
insert into staff values (626,'Ruiz','sruizhd@slashdot.org','Female','Garden','1/12/2009',83706,'Assistant Media Planner',2);
insert into staff values (627,'Watkins','swatkinshe@wunderground.com','Female','Grocery','1/21/2000',80245,'VP Product Management',6);
insert into staff values (628,'Diaz','rdiazhf@nih.gov','Male','Jewelery','8/11/2008',65110,'Compensation Analyst',5);
insert into staff values (629,'Watkins','mwatkinshg@bbb.org','Male','Jewelery','7/29/2011',128617,'Senior Editor',4);
insert into staff values (630,'Pierce','spiercehh@google.nl','Male','Outdoors','2/9/2002',96107,'Actuary',5);
insert into staff values (631,'Perez','wperezhi@yahoo.co.jp','Female','Tools','6/14/2014',44788,'Project Manager',2);
insert into staff values (632,'Lopez','clopezhj@mediafire.com','Female','Garden','1/1/2004',86207,'Accountant II',4);
insert into staff values (633,'Freeman','mfreemanhk@walmart.com','Male','Shoes','10/25/2000',79845,'Teacher',1);
insert into staff values (634,'Fowler','wfowlerhl@people.com.cn','Female','Outdoors','4/6/2011',104264,'Staff Scientist',6);
insert into staff values (635,'Rodriguez','mrodriguezhm@wiley.com','Female','Tools','12/27/2010',77005,'Systems Administrator IV',1);
insert into staff values (636,'Wheeler','lwheelerhn@skyrock.com','Female','Industrial','9/25/2011',69564,'Senior Editor',6);
insert into staff values (637,'Knight','dknightho@buzzfeed.com','Female','Shoes','7/25/2007',84549,'Senior Cost Accountant',5);
insert into staff values (638,'Walker','bwalkerhp@dropbox.com','Male','Games','6/9/2006',134488,'Software Consultant',1);
insert into staff values (639,'Porter','eporterhq@amazon.com','Male','Shoes','2/13/2007',140243,'Financial Advisor',5);
insert into staff values (640,'Washington','hwashingtonhr@bbc.co.uk','Male','Jewelery','2/22/2003',44096,'Geologist IV',4);
insert into staff values (641,'Hayes','rhayeshs@loc.gov','Female','Health','4/7/2010',69454,'Web Designer II',1);
insert into staff values (642,'Warren','awarrenht@addthis.com','Female','Movies','5/15/2009',126201,'Electrical Engineer',2);
insert into staff values (643,'Johnston','cjohnstonhu@psu.edu','Male','Jewelery','3/21/2014',123820,'Computer Systems Analyst IV',4);
insert into staff values (644,'Carroll','jcarrollhv@over-blog.com','Male','Grocery','4/6/2002',52956,'Compensation Analyst',7);
insert into staff values (645,'Webb','twebbhw@google.com.br','Male','Tools','6/1/2007',143595,'Geological Engineer',6);
insert into staff values (646,'Harvey','lharveyhx@plala.or.jp','Male','Beauty','8/14/2014',124707,'Registered Nurse',6);
insert into staff values (647,'Washington','mwashingtonhy@icio.us','Male','Electronics','10/15/2009',57092,'Internal Auditor',2);
insert into staff values (648,'Long','rlonghz@list-manage.com','Male','Beauty','2/12/2007',149099,'Executive Secretary',3);
insert into staff values (649,'Russell','krusselli0@posterous.com','Male','Shoes','11/18/2007',99352,'Recruiting Manager',1);
insert into staff values (650,'Frazier','rfrazieri1@github.com','Male','Grocery','1/22/2013',44919,'Quality Engineer',7);
insert into staff values (651,'Freeman','tfreemani2@soundcloud.com','Female','Health','8/28/2006',55034,'Administrative Officer',4);
insert into staff values (652,'Rivera','criverai3@github.io','Male','Jewelery','6/16/2006',60396,'Senior Quality Engineer',7);
insert into staff values (653,'Ramirez','vramirezi4@yellowpages.com','Male','Toys','7/6/2013',147862,'Chemical Engineer',5);
insert into staff values (654,'Mcdonald','hmcdonaldi5@4shared.com','Male','Automotive','11/3/2002',69594,'Recruiting Manager',3);
insert into staff values (655,'Meyer','emeyeri6@friendfeed.com','Female','Sports','6/8/2014',145363,'GIS Technical Architect',3);
insert into staff values (656,'Campbell','kcampbelli7@prnewswire.com','Male','Books','4/3/2008',70804,'Quality Engineer',2);
insert into staff values (657,'Reid','areidi8@wunderground.com','Female','Clothing','6/29/2013',65154,'Sales Representative',5);
insert into staff values (658,'Gilbert','agilberti9@parallels.com','Male','Electronics','10/8/2013',61332,'Marketing Assistant',3);
insert into staff values (659,'Ramos','kramosia@ed.gov','Female','Outdoors','9/7/2003',72319,'Quality Control Specialist',1);
insert into staff values (660,'Nelson','mnelsonib@ibm.com','Male','Shoes','12/8/2001',139564,'Pharmacist',7);
insert into staff values (661,'Foster','pfosteric@smugmug.com','Female','Automotive','9/21/2004',63364,'Community Outreach Specialist',4);
insert into staff values (662,'Scott','bscottid@mashable.com','Male','Baby','1/18/2000',86497,'Administrative Officer',6);
insert into staff values (663,'Lynch','tlynchie@bloglovin.com','Female','Outdoors','1/25/2003',117248,'Staff Accountant III',1);
insert into staff values (664,'Watkins','ewatkinsif@ask.com','Female','Sports','2/9/2013',133507,'Budget/Accounting Analyst II',1);
insert into staff values (665,'Garcia','pgarciaig@macromedia.com','Female','Health','11/4/2008',135132,'Research Assistant III',7);
insert into staff values (666,'Arnold','jarnoldih@tripod.com','Female','Shoes','4/22/2013',52041,'Database Administrator I',2);
insert into staff values (667,'Willis','nwillisii@sohu.com','Female','Music','3/12/2012',73425,'Human Resources Manager',3);
insert into staff values (668,'Burton','jburtonij@webmd.com','Female','Computers','3/17/2001',46960,'Financial Advisor',4);
insert into staff values (669,'Owens','sowensik@prlog.org','Male','Toys','5/6/2001',104373,'Graphic Designer',6);
insert into staff values (670,'Moreno','rmorenoil@gizmodo.com','Female','Shoes','9/17/2014',102493,'Senior Quality Engineer',5);
insert into staff values (671,'Fuller','jfullerim@theguardian.com','Male','Shoes','12/11/2007',55568,'Senior Cost Accountant',7);
insert into staff values (672,'Fowler','cfowlerin@yelp.com','Male','Sports','5/5/2006',75159,'Biostatistician III',2);
insert into staff values (673,'Thomas','lthomasio@pagesperso-orange.fr','Male','Health','10/27/2014',51782,'Operator',6);
insert into staff values (674,'Adams','jadamsip@cisco.com','Male','Toys','8/28/2009',41855,'Payment Adjustment Coordinator',7);
insert into staff values (675,'Snyder','ssnyderiq@vkontakte.ru','Male','Games','6/22/2005',143846,'Web Developer III',3);
insert into staff values (676,'Sullivan','rsullivanir@xinhuanet.com','Male','Music','9/29/2013',101756,'Programmer IV',5);
insert into staff values (677,'Robertson','lrobertsonis@forbes.com','Male','Computers','8/4/2014',136492,'Compensation Analyst',4);
insert into staff values (678,'Mills','jmillsit@webs.com','Male','Music','4/17/2011',82979,'Senior Quality Engineer',6);
insert into staff values (679,'Stone','pstoneiu@narod.ru','Male','Electronics','5/15/2014',40218,'Paralegal',2);
insert into staff values (680,'Simmons','gsimmonsiv@cocolog-nifty.com','Female','Games','12/9/2001',60695,'Chemical Engineer',2);
insert into staff values (681,'Butler','dbutleriw@discuz.net','Male','Home','11/30/2008',47994,'Senior Quality Engineer',4);
insert into staff values (682,'Scott','kscottix@ycombinator.com','Male','Garden','9/3/2004',50057,'Account Executive',2);
insert into staff values (683,'Torres','jtorresiy@4shared.com','Female','Games','3/11/2006',135886,'Assistant Media Planner',3);
insert into staff values (684,'Hall','lhalliz@smh.com.au','Male','Jewelery','7/15/2009',77924,'Senior Sales Associate',7);
insert into staff values (685,'White','jwhitej0@usnews.com','Female','Beauty','12/7/2008',136356,'Office Assistant IV',1);
insert into staff values (686,'Watkins','mwatkinsj1@myspace.com','Male','Toys','3/24/2004',104444,'Business Systems Development Analyst',2);
insert into staff values (687,'Gardner','agardnerj2@blogs.com','Female','Computers','12/3/2000',49693,'Chemical Engineer',2);
insert into staff values (688,'Cruz','kcruzj3@shinystat.com','Male','Home','6/29/2012',90829,'Recruiter',6);
insert into staff values (689,'Austin','aaustinj4@walmart.com','Female','Electronics','10/31/2007',62293,'Administrative Officer',4);
insert into staff values (690,'Perkins','rperkinsj5@ehow.com','Male','Music','5/9/2000',57988,'Web Developer I',4);
insert into staff values (691,'Hansen','chansenj6@uiuc.edu','Female','Beauty','2/4/2010',113893,'Clinical Specialist',7);
insert into staff values (692,'Owens','dowensj7@hibu.com','Male','Shoes','3/11/2013',58265,'Nurse Practicioner',3);
insert into staff values (693,'Carr','hcarrj8@latimes.com','Male','Garden','1/17/2005',143570,'Actuary',4);
insert into staff values (694,'Chavez','rchavezj9@uiuc.edu','Female','Grocery','4/19/2007',116894,'Chief Design Engineer',6);
insert into staff values (695,'Morales','rmoralesja@vinaora.com','Female','Automotive','1/24/2006',82244,'Administrative Assistant III',2);
insert into staff values (696,'Anderson','dandersonjb@linkedin.com','Male','Games','10/7/2012',92640,'Executive Secretary',7);
insert into staff values (697,'Woods','twoodsjc@ucoz.ru','Male','Beauty','6/23/2000',123995,'Assistant Media Planner',5);
insert into staff values (698,'Cook','tcookjd@blinklist.com','Male','Garden','12/12/2005',97351,'Health Coach I',4);
insert into staff values (699,'Price','bpriceje@icio.us','Female','Clothing','1/25/2003',133091,'VP Accounting',7);
insert into staff values (700,'Stone','tstonejf@com.com','Male','Garden','7/15/2004',100746,'VP Quality Control',6);
insert into staff values (701,'Williams','jwilliamsjg@rediff.com','Male','Jewelery','10/13/2002',101599,'Developer II',7);
insert into staff values (702,'Wells','dwellsjh@is.gd','Male','Sports','6/2/2014',77293,'Structural Analysis Engineer',5);
insert into staff values (703,'Hernandez','ahernandezji@ucoz.ru','Female','Games','3/4/2014',119787,'Speech Pathologist',1);
insert into staff values (704,'Burke','eburkejj@godaddy.com','Male','Computers','6/12/2013',114690,'Staff Scientist',2);
insert into staff values (705,'Clark','pclarkjk@joomla.org','Male','Movies','10/25/2009',97150,'VP Accounting',6);
insert into staff values (706,'Mendoza','rmendozajl@g.co','Female','Home','12/5/2011',91655,'Cost Accountant',5);
insert into staff values (707,'Perry','jperryjm@home.pl','Male','Industrial','11/8/2006',124296,'Developer III',1);
insert into staff values (708,'Rose','crosejn@cnbc.com','Female','Automotive','12/24/2011',66063,'Software Test Engineer I',7);
insert into staff values (709,'Payne','cpaynejo@tinyurl.com','Female','Books','1/12/2007',138137,'Developer IV',2);
insert into staff values (710,'Mills','jmillsjp@yahoo.com','Female','Music','1/22/2005',49326,'Chemical Engineer',7);
insert into staff values (711,'Roberts','jrobertsjq@ed.gov','Male','Clothing','8/21/2009',80743,'Geological Engineer',4);
insert into staff values (712,'Torres','dtorresjr@state.tx.us','Male','Jewelery','12/23/2007',105686,'Senior Developer',6);
insert into staff values (713,'Hicks','ahicksjs@arstechnica.com','Female','Sports','12/23/2013',65650,'Project Manager',1);
insert into staff values (714,'Cooper','kcooperjt@salon.com','Male','Games','9/26/2003',86446,'Statistician II',4);
insert into staff values (715,'Henry','rhenryju@answers.com','Female','Games','6/26/2010',132421,'Human Resources Manager',1);
insert into staff values (716,'Jacobs','bjacobsjv@thetimes.co.uk','Male','Electronics','6/18/2004',69855,'Payment Adjustment Coordinator',4);
insert into staff values (717,'Greene','rgreenejw@so-net.ne.jp','Female','Outdoors','7/8/2007',80999,'Staff Accountant II',6);
insert into staff values (718,'Armstrong','darmstrongjx@cafepress.com','Male','Health','1/3/2003',66447,'Account Coordinator',2);
insert into staff values (719,'Wagner','ewagnerjy@jalbum.net','Male','Beauty','1/4/2013',135445,'Operator',2);
insert into staff values (720,'Rice','hricejz@blinklist.com','Female','Jewelery','11/8/2010',57781,'Dental Hygienist',4);
insert into staff values (721,'Smith','hsmithk0@4shared.com','Female','Health','9/21/2005',83802,'Research Assistant II',7);
insert into staff values (722,'Hill','khillk1@about.me','Female','Clothing','8/31/2002',73262,'Information Systems Manager',5);
insert into staff values (723,'Howard','rhowardk2@cnet.com','Female','Baby','3/3/2002',89035,'Senior Editor',5);
insert into staff values (724,'Elliott','delliottk3@who.int','Male','Industrial','5/20/2001',125115,'Senior Quality Engineer',3);
insert into staff values (725,'Richards','krichardsk4@bloglines.com','Male','Baby','10/2/2003',80939,'Analyst Programmer',1);
insert into staff values (726,'Welch','dwelchk5@mapquest.com','Male','Home','9/11/2008',49463,'Research Nurse',1);
insert into staff values (727,'Johnson','mjohnsonk6@sciencedaily.com','Male','Movies','5/21/2012',83165,'Account Representative I',5);
insert into staff values (728,'Larson','slarsonk7@sakura.ne.jp','Female','Outdoors','4/21/2006',125574,'Research Associate',1);
insert into staff values (729,'Banks','hbanksk8@nifty.com','Male','Jewelery','11/15/2013',119747,'Graphic Designer',5);
insert into staff values (730,'Johnston','ejohnstonk9@liveinternet.ru','Female','Sports','11/24/2008',57651,'Help Desk Operator',6);
insert into staff values (731,'Ferguson','gfergusonka@geocities.jp','Female','Home','6/28/2009',70524,'VP Accounting',2);
insert into staff values (732,'Murray','amurraykb@blinklist.com','Male','Clothing','8/15/2004',50511,'Senior Cost Accountant',3);
insert into staff values (733,'Diaz','jdiazkc@china.com.cn','Male','Home','11/20/2000',58847,'Community Outreach Specialist',4);
insert into staff values (734,'Simmons','tsimmonskd@chicagotribune.com','Female','Automotive','2/20/2005',58555,'Biostatistician I',2);
insert into staff values (735,'Richards','jrichardske@hatena.ne.jp','Male','Clothing','11/14/2014',116333,'Legal Assistant',5);
insert into staff values (736,'Morgan','emorgankf@businessinsider.com','Male','Baby','8/27/2009',80813,'Senior Quality Engineer',6);
insert into staff values (737,'Price','bpricekg@xinhuanet.com','Male','Health','7/26/2004',142794,'Recruiting Manager',1);
insert into staff values (738,'Hudson','chudsonkh@google.co.uk','Female','Computers','1/4/2003',65083,'Marketing Assistant',6);
insert into staff values (739,'Carroll','lcarrollki@example.com','Female','Baby','3/13/2014',125398,'Assistant Professor',2);
insert into staff values (740,'Long','jlongkj@dailymail.co.uk','Female','Kids','1/13/2008',98502,'Structural Analysis Engineer',7);
insert into staff values (741,'Parker','cparkerkk@foxnews.com','Female','Shoes','12/31/2002',90086,'Research Associate',4);
insert into staff values (742,'Nguyen','lnguyenkl@goodreads.com','Male','Sports','12/3/2007',77382,'Design Engineer',6);
insert into staff values (743,'Garza','agarzakm@miitbeian.gov.cn','Female','Electronics','12/23/2014',113278,'Statistician IV',2);
insert into staff values (744,'Gordon','pgordonkn@mac.com','Male','Automotive','9/18/2001',129324,'Developer I',4);
insert into staff values (745,'Reed','lreedko@wikipedia.org','Female','Outdoors','11/21/2005',108504,'Pharmacist',1);
insert into staff values (746,'Baker','bbakerkp@list-manage.com','Male','Industrial','10/4/2001',145283,'Payment Adjustment Coordinator',1);
insert into staff values (747,'Carroll','mcarrollkq@whitehouse.gov','Male','Kids','7/30/2006',82674,'Junior Executive',4);
insert into staff values (748,'Elliott','delliottkr@dot.gov','Male','Clothing','12/9/2009',119097,'Administrative Assistant I',2);
insert into staff values (749,'Parker','aparkerks@godaddy.com','Female','Jewelery','9/5/2012',60498,'Accountant I',4);
insert into staff values (750,'Ward','kwardkt@wikipedia.org','Male','Music','7/16/2014',108228,'VP Sales',3);
insert into staff values (751,'Kelley','ckelleyku@gravatar.com','Male','Electronics','5/7/2005',106602,'Occupational Therapist',2);
insert into staff values (752,'Gonzales','rgonzaleskv@meetup.com','Female','Home','1/24/2011',95810,'Food Chemist',4);
insert into staff values (753,'King','bkingkw@friendfeed.com','Female','Electronics','2/5/2005',149597,'Structural Analysis Engineer',1);
insert into staff values (754,'Mendoza','smendozakx@java.com','Female','Electronics','3/17/2000',57331,'Occupational Therapist',3);
insert into staff values (755,'Tucker','ctuckerky@1688.com','Male','Industrial','8/17/2011',49113,'Business Systems Development Analyst',7);
insert into staff values (756,'Fox','dfoxkz@foxnews.com','Female','Grocery','7/17/2005',80417,'Assistant Media Planner',7);
insert into staff values (757,'Evans','aevansl0@nba.com','Male','Games','4/5/2012',122595,'Automation Specialist I',6);
insert into staff values (758,'Ray','nrayl1@mail.ru','Male','Toys','10/23/2013',126661,'Systems Administrator I',2);
insert into staff values (759,'Vasquez','jvasquezl2@edublogs.org','Male','Garden','4/2/2000',127695,'Systems Administrator I',7);
insert into staff values (760,'Bell','sbelll3@goo.gl','Male','Baby','7/24/2008',66608,'General Manager',1);
insert into staff values (761,'Burke','eburkel4@newsvine.com','Female','Home','12/14/2014',106033,'Quality Control Specialist',1);
insert into staff values (762,'Stanley','cstanleyl5@springer.com','Male','Electronics','8/9/2013',103237,'Account Executive',7);
insert into staff values (763,'Bell','dbelll6@wisc.edu','Male','Computers','4/22/2002',122843,'Accountant IV',2);
insert into staff values (764,'Jacobs','mjacobsl7@ibm.com','Female','Music','7/6/2004',51771,'Accountant III',3);
insert into staff values (765,'Williams','dwilliamsl8@google.com.br','Male','Tools','11/7/2009',107709,'Nuclear Power Engineer',1);
insert into staff values (766,'Elliott','kelliottl9@hhs.gov','Male','Books','12/18/2009',104149,'Food Chemist',2);
insert into staff values (767,'Hall','jhallla@hao123.com','Male','Books','8/2/2004',91501,'Editor',7);
insert into staff values (768,'Meyer','jmeyerlb@yandex.ru','Female','Automotive','7/24/2014',42602,'Programmer IV',2);
insert into staff values (769,'Kelly','jkellylc@linkedin.com','Female','Kids','11/24/2013',132676,'Dental Hygienist',4);
insert into staff values (770,'Burton','jburtonld@delicious.com','Female','Games','5/4/2006',140688,'Programmer Analyst III',3);
insert into staff values (771,'Clark','rclarkle@ted.com','Female','Garden','9/9/2014',51792,'Software Consultant',4);
insert into staff values (772,'Elliott','delliottlf@fda.gov','Male','Movies','10/13/2004',100570,'Senior Financial Analyst',5);
insert into staff values (773,'Dixon','rdixonlg@parallels.com','Male','Tools','7/2/2007',60383,'VP Product Management',1);
insert into staff values (774,'Richards','vrichardslh@forbes.com','Male','Shoes','3/21/2006',68761,'Graphic Designer',1);
insert into staff values (775,'Gonzalez','egonzalezli@naver.com','Female','Tools','10/14/2009',131830,'GIS Technical Architect',2);
insert into staff values (776,'Olson','kolsonlj@friendfeed.com','Female','Clothing','9/27/2013',107535,'Office Assistant III',7);
insert into staff values (777,'Sims','jsimslk@angelfire.com','Male','Industrial','11/15/2001',95548,'Sales Associate',3);
insert into staff values (778,'Thomas','ethomasll@aol.com','Male','Automotive','5/16/2013',116487,'Graphic Designer',1);
insert into staff values (779,'Gonzalez','mgonzalezlm@illinois.edu','Male','Grocery','2/3/2005',148106,'Sales Representative',2);
insert into staff values (780,'Cox','dcoxln@studiopress.com','Male','Games','4/4/2007',135719,'Database Administrator I',5);
insert into staff values (781,'Schmidt','rschmidtlo@harvard.edu','Female','Automotive','4/4/2010',121300,'Human Resources Assistant II',5);
insert into staff values (782,'Weaver','jweaverlp@unblog.fr','Male','Movies','11/9/2011',120226,'Software Engineer II',4);
insert into staff values (783,'Burns','kburnslq@163.com','Male','Automotive','8/13/2004',44377,'Technical Writer',4);
insert into staff values (784,'Burns','aburnslr@squidoo.com','Male','Electronics','2/15/2008',102001,'Developer III',4);
insert into staff values (785,'Miller','nmillerls@behance.net','Male','Music','3/10/2009',99151,'Information Systems Manager',1);
insert into staff values (786,'Willis','jwillislt@instagram.com','Male','Garden','10/8/2000',123427,'General Manager',4);
insert into staff values (787,'Williamson','twilliamsonlu@ow.ly','Female','Tools','3/9/2003',135695,'Budget/Accounting Analyst III',6);
insert into staff values (788,'Phillips','dphillipslv@domainmarket.com','Female','Toys','4/29/2004',102793,'Editor',4);
insert into staff values (789,'James','kjameslw@yellowbook.com','Male','Clothing','3/20/2005',130188,'Structural Analysis Engineer',1);
insert into staff values (790,'Murray','cmurraylx@icio.us','Female','Home','4/25/2013',97607,'Accountant IV',3);
insert into staff values (791,'Phillips','tphillipsly@globo.com','Female','Sports','12/11/2013',93534,'Health Coach IV',1);
insert into staff values (792,'Mccoy','jmccoylz@samsung.com','Male','Industrial','9/20/2007',95787,'Engineer IV',2);
insert into staff values (793,'Kelly','akellym0@unblog.fr','Female','Games','4/16/2011',120086,'Professor',6);
insert into staff values (794,'Larson','mlarsonm1@blinklist.com','Female','Outdoors','1/1/2009',119414,'Research Assistant II',1);
insert into staff values (795,'Hansen','dhansenm2@thetimes.co.uk','Female','Garden','9/12/2008',79952,'Compensation Analyst',4);
insert into staff values (796,'Owens','jowensm3@mail.ru','Male','Beauty','8/17/2004',138682,'Analyst Programmer',7);
insert into staff values (797,'Ramos','aramosm4@issuu.com','Female','Health','5/20/2003',49667,'Help Desk Technician',6);
insert into staff values (798,'Kim','akimm5@vimeo.com','Male','Garden','7/13/2008',83798,'Technical Writer',5);
insert into staff values (799,'Sims','asimsm6@lycos.com','Female','Clothing','3/9/2013',146024,'Actuary',7);
insert into staff values (800,'Peterson','apetersonm7@eepurl.com','Male','Outdoors','9/8/2000',144841,'Web Developer I',4);
insert into staff values (801,'Gomez','tgomezm8@ucoz.ru','Female','Movies','9/20/2012',101582,'Biostatistician II',7);
insert into staff values (802,'Knight','dknightm9@quantcast.com','Female','Movies','5/30/2006',100716,'Help Desk Operator',3);
insert into staff values (803,'Hunt','ahuntma@g.co','Female','Beauty','3/16/2011',72016,'Computer Systems Analyst I',4);
insert into staff values (804,'Hunter','hhuntermb@reverbnation.com','Female','Books','7/31/2005',123156,'Social Worker',1);
insert into staff values (805,'Gordon','pgordonmc@creativecommons.org','Male','Baby','8/13/2014',110058,'Business Systems Development Analyst',1);
insert into staff values (806,'Hill','shillmd@ca.gov','Male','Shoes','12/15/2011',117092,'VP Product Management',5);
insert into staff values (807,'Gibson','hgibsonme@ox.ac.uk','Male','Industrial','12/15/2005',148816,'Operator',4);
insert into staff values (808,'Mills','jmillsmf@seesaa.net','Female','Games','4/14/2009',79031,'Electrical Engineer',3);
insert into staff values (809,'Butler','rbutlermg@netvibes.com','Male','Automotive','8/9/2006',128448,'Technical Writer',3);
insert into staff values (810,'Foster','lfostermh@blog.com','Female','Health','1/7/2013',138478,'Software Test Engineer IV',4);
insert into staff values (811,'Harrison','eharrisonmi@cdbaby.com','Male','Jewelery','10/8/2010',41026,'Professor',1);
insert into staff values (812,'Harvey','jharveymj@yandex.ru','Male','Beauty','9/25/2006',131816,'Sales Representative',1);
insert into staff values (813,'Collins','dcollinsmk@salon.com','Female','Grocery','11/11/2013',85647,'Speech Pathologist',6);
insert into staff values (814,'Hayes','shayesml@usda.gov','Male','Jewelery','2/28/2000',49457,'Compensation Analyst',4);
insert into staff values (815,'Burton','rburtonmm@ow.ly','Female','Garden','10/1/2014',80763,'Community Outreach Specialist',3);
insert into staff values (816,'Jackson','pjacksonmn@dailymotion.com','Female','Beauty','12/29/2013',107093,'Electrical Engineer',3);
insert into staff values (817,'Dixon','sdixonmo@marriott.com','Male','Baby','1/15/2008',138970,'Structural Analysis Engineer',7);
insert into staff values (818,'Rice','jricemp@columbia.edu','Female','Movies','4/5/2002',82077,'Data Coordiator',4);
insert into staff values (819,'Murray','jmurraymq@spiegel.de','Male','Industrial','12/6/2014',83237,'Editor',4);
insert into staff values (820,'Baker','jbakermr@cafepress.com','Male','Toys','1/20/2002',107749,'Graphic Designer',2);
insert into staff values (821,'Riley','rrileyms@uiuc.edu','Male','Jewelery','6/19/2012',149114,'Business Systems Development Analyst',7);
insert into staff values (822,'Gonzalez','jgonzalezmt@nsw.gov.au','Male','Health','8/9/2007',107240,'Financial Analyst',4);
insert into staff values (823,'Harrison','mharrisonmu@guardian.co.uk','Female','Baby','5/30/2008',134334,'Accountant II',7);
insert into staff values (824,'Morris','mmorrismv@tumblr.com','Male','Grocery','9/26/2002',72008,'GIS Technical Architect',2);
insert into staff values (825,'Turner','jturnermw@mapy.cz','Male','Books','4/3/2000',89285,'Community Outreach Specialist',5);
insert into staff values (826,'Garcia','cgarciamx@vistaprint.com','Female','Grocery','8/10/2003',131075,'Help Desk Operator',2);
insert into staff values (827,'Fowler','hfowlermy@nps.gov','Male','Baby','5/7/2009',110383,'Chief Design Engineer',4);
insert into staff values (828,'Allen','wallenmz@gnu.org','Female','Tools','7/18/2005',149586,'Account Coordinator',1);
insert into staff values (829,'Parker','bparkern0@weibo.com','Male','Health','11/27/2002',89503,'Research Associate',2);
insert into staff values (830,'Stewart','cstewartn1@hugedomains.com','Female','Computers','3/14/2010',149336,'Senior Sales Associate',1);
insert into staff values (831,'Rodriguez','drodriguezn2@guardian.co.uk','Female','Outdoors','8/30/2006',140276,'Electrical Engineer',5);
insert into staff values (832,'Turner','hturnern3@tumblr.com','Female','Games','4/8/2001',127875,'Accountant III',7);
insert into staff values (833,'Chavez','rchavezn4@tamu.edu','Female','Music','5/29/2009',137704,'Help Desk Technician',4);
insert into staff values (834,'Cox','kcoxn5@dyndns.org','Female','Games','1/17/2013',149221,'Senior Financial Analyst',2);
insert into staff values (835,'Tucker','btuckern6@ovh.net','Male','Baby','6/4/2014',148573,'Nurse Practicioner',4);
insert into staff values (836,'Vasquez','svasquezn7@1und1.de','Female','Games','9/20/2002',125378,'Senior Developer',4);
insert into staff values (837,'Cole','wcolen8@php.net','Female','Jewelery','9/12/2006',66420,'Clinical Specialist',7);
insert into staff values (838,'Black','rblackn9@sun.com','Male','Toys','9/28/2008',117171,'Electrical Engineer',4);
insert into staff values (839,'Richardson','trichardsonna@cbsnews.com','Female','Health','10/23/2008',145962,'Cost Accountant',3);
insert into staff values (840,'Hamilton','phamiltonnb@earthlink.net','Male','Books','10/19/2001',73778,'Sales Representative',2);
insert into staff values (841,'Sullivan','ssullivannc@clickbank.net','Male','Kids','3/4/2008',76731,'Accounting Assistant II',2);
insert into staff values (842,'Carpenter','acarpenternd@prlog.org','Female','Beauty','7/13/2008',101653,'Web Designer II',6);
insert into staff values (843,'Ross','rrossne@salon.com','Male','Garden','1/11/2001',62534,'Senior Editor',3);
insert into staff values (844,'Hall','jhallnf@1und1.de','Male','Outdoors','4/30/2013',100428,'Web Designer I',3);
insert into staff values (845,'Washington','iwashingtonng@freewebs.com','Male','Kids','12/2/2001',109828,'VP Quality Control',6);
insert into staff values (846,'Moreno','dmorenonh@webs.com','Female','Jewelery','3/21/2001',63133,'Clinical Specialist',5);
insert into staff values (847,'Knight','dknightni@unc.edu','Female','Clothing','3/22/2008',91532,'Operator',4);
insert into staff values (848,'Austin','jaustinnj@gov.uk','Female','Shoes','1/26/2005',101646,'Environmental Tech',1);
insert into staff values (849,'Rice','kricenk@cyberchimps.com','Male','Grocery','8/2/2002',68034,'Senior Financial Analyst',4);
insert into staff values (850,'Kelley','pkelleynl@biglobe.ne.jp','Male','Kids','4/4/2012',55214,'Senior Quality Engineer',2);
insert into staff values (851,'Gordon','bgordonnm@imdb.com','Female','Automotive','12/29/2002',136448,'Media Manager II',4);
insert into staff values (852,'Rose','srosenn@flavors.me','Male','Shoes','5/1/2010',76086,'Statistician I',7);
insert into staff values (853,'Mendoza','emendozano@edublogs.org','Male','Beauty','8/3/2013',128947,'Help Desk Operator',5);
insert into staff values (854,'Hanson','ghansonnp@free.fr','Male','Tools','10/14/2006',113354,'VP Quality Control',4);
insert into staff values (855,'Perry','eperrynq@imdb.com','Male','Garden','5/21/2012',75125,'VP Marketing',7);
insert into staff values (856,'Roberts','trobertsnr@over-blog.com','Female','Clothing','2/21/2004',139714,'Help Desk Operator',2);
insert into staff values (857,'Nichols','dnicholsns@ifeng.com','Male','Toys','10/20/2003',43537,'Help Desk Operator',4);
insert into staff values (858,'Wright','lwrightnt@house.gov','Female','Automotive','11/23/2001',127521,'Nurse',4);
insert into staff values (859,'Clark','mclarknu@bigcartel.com','Male','Health','2/19/2007',112510,'Information Systems Manager',4);
insert into staff values (860,'Anderson','landersonnv@sakura.ne.jp','Male','Sports','12/26/2004',115009,'Structural Engineer',4);
insert into staff values (861,'Foster','kfosternw@a8.net','Female','Electronics','5/1/2013',64381,'Professor',7);
insert into staff values (862,'Stanley','bstanleynx@phoca.cz','Female','Grocery','2/10/2001',149929,'Director of Sales',6);
insert into staff values (863,'Gonzales','fgonzalesny@squarespace.com','Female','Automotive','9/7/2001',101006,'Sales Associate',2);
insert into staff values (864,'Jones','sjonesnz@chron.com','Female','Beauty','9/1/2013',47716,'Quality Engineer',2);
insert into staff values (865,'Dixon','mdixono0@cbc.ca','Female','Sports','12/29/2008',126420,'Structural Analysis Engineer',6);
insert into staff values (866,'Kelly','jkellyo1@ameblo.jp','Female','Sports','9/1/2011',55265,'Paralegal',1);
insert into staff values (867,'Johnson','bjohnsono2@toplist.cz','Female','Books','3/18/2012',95679,'Associate Professor',3);
insert into staff values (868,'Price','jpriceo3@google.it','Male','Movies','1/24/2003',52612,'Analyst Programmer',7);
insert into staff values (869,'Turner','pturnero4@tamu.edu','Female','Shoes','12/10/2010',130849,'Desktop Support Technician',5);
insert into staff values (870,'Howard','ghowardo5@ow.ly','Male','Outdoors','8/21/2006',141753,'Assistant Professor',3);
insert into staff values (871,'Hanson','thansono6@paginegialle.it','Male','Health','8/27/2007',133492,'Accountant II',3);
insert into staff values (872,'Hall','thallo7@hud.gov','Male','Kids','12/28/2004',112126,'Information Systems Manager',3);
insert into staff values (873,'Alexander','aalexandero8@histats.com','Female','Toys','7/5/2006',140078,'Environmental Specialist',3);
insert into staff values (874,'Spencer','kspencero9@eventbrite.com','Male','Books','9/29/2012',119769,'Director of Sales',2);
insert into staff values (875,'Jenkins','rjenkinsoa@answers.com','Female','Health','2/15/2007',115911,'Civil Engineer',7);
insert into staff values (876,'Montgomery','amontgomeryob@dmoz.org','Male','Shoes','12/22/2003',75676,'Recruiting Manager',3);
insert into staff values (877,'Webb','rwebboc@a8.net','Male','Outdoors','4/13/2005',144932,'Marketing Assistant',4);
insert into staff values (878,'Williamson','pwilliamsonod@utexas.edu','Male','Industrial','10/25/2010',80102,'Graphic Designer',2);
insert into staff values (879,'Hill','shilloe@ft.com','Male','Tools','10/3/2011',144661,'Registered Nurse',3);
insert into staff values (880,'Grant','kgrantof@phoca.cz','Female','Music','9/26/2001',60268,'Registered Nurse',3);
insert into staff values (881,'Wright','cwrightog@trellian.com','Female','Tools','9/10/2014',94072,'Social Worker',3);
insert into staff values (882,'George','wgeorgeoh@mail.ru','Male','Shoes','2/23/2006',85249,'Engineer I',2);
insert into staff values (883,'George','lgeorgeoi@jigsy.com','Male','Grocery','10/12/2007',66059,'Software Test Engineer IV',5);
insert into staff values (884,'Ford','bfordoj@spiegel.de','Female','Electronics','11/26/2005',80931,'Cost Accountant',1);
insert into staff values (885,'Wallace','mwallaceok@abc.net.au','Female','Toys','9/17/2011',118793,'Research Assistant III',3);
insert into staff values (886,'Murphy','fmurphyol@tumblr.com','Female','Baby','9/26/2014',62114,'Analyst Programmer',7);
insert into staff values (887,'Vasquez','jvasquezom@networksolutions.com','Male','Beauty','5/3/2014',131811,'Social Worker',4);
insert into staff values (888,'Collins','bcollinson@google.pl','Female','Outdoors','9/30/2007',143034,'Budget/Accounting Analyst III',3);
insert into staff values (889,'Jackson','ajacksonoo@slate.com','Male','Games','5/7/2013',41516,'Nurse',1);
insert into staff values (890,'Howell','ehowellop@dailymotion.com','Female','Baby','11/26/2012',72534,'Account Executive',4);
insert into staff values (891,'Richards','arichardsoq@so-net.ne.jp','Male','Baby','6/9/2011',140004,'Design Engineer',7);
insert into staff values (892,'Crawford','pcrawfordor@gnu.org','Male','Beauty','6/23/2004',114436,'Account Representative IV',5);
insert into staff values (893,'Dixon','jdixonos@msu.edu','Male','Grocery','3/31/2009',68684,'Staff Scientist',3);
insert into staff values (894,'Owens','jowensot@gmpg.org','Male','Automotive','9/18/2000',135326,'Graphic Designer',1);
insert into staff values (895,'Moore','kmooreou@slate.com','Male','Industrial','2/23/2014',40194,'Environmental Specialist',5);
insert into staff values (896,'Carpenter','rcarpenterov@pagesperso-orange.fr','Female','Home','10/28/2010',134813,'Health Coach I',7);
insert into staff values (897,'Reid','sreidow@smugmug.com','Male','Beauty','3/9/2002',79718,'Marketing Manager',4);
insert into staff values (898,'Lee','kleeox@nature.com','Female','Industrial','12/9/2010',115085,'Senior Quality Engineer',7);
insert into staff values (899,'Burton','kburtonoy@army.mil','Female','Shoes','3/5/2005',67758,'Chemical Engineer',2);
insert into staff values (900,'Jordan','tjordanoz@instagram.com','Male','Toys','2/23/2012',115776,'Database Administrator I',2);
insert into staff values (901,'Perry','kperryp0@chron.com','Male','Books','12/15/2013',146701,'Research Assistant II',7);
insert into staff values (902,'Wright','bwrightp1@deviantart.com','Male','Shoes','12/16/2011',109233,'Mechanical Systems Engineer',4);
insert into staff values (903,'Burns','eburnsp2@discuz.net','Female','Outdoors','1/7/2007',113654,'Health Coach IV',1);
insert into staff values (904,'Roberts','drobertsp3@ed.gov','Female','Tools','8/25/2004',90937,'Cost Accountant',6);
insert into staff values (905,'Webb','dwebbp4@about.com','Male','Automotive','10/10/2007',111689,'GIS Technical Architect',5);
insert into staff values (906,'Spencer','sspencerp5@mtv.com','Male','Electronics','4/18/2014',110881,'Electrical Engineer',1);
insert into staff values (907,'Frazier','kfrazierp6@dailymail.co.uk','Female','Tools','9/22/2009',104326,'Assistant Manager',5);
insert into staff values (908,'Hanson','jhansonp7@1688.com','Female','Electronics','11/27/2003',144767,'Executive Secretary',5);
insert into staff values (909,'Mcdonald','hmcdonaldp8@facebook.com','Male','Automotive','12/26/2009',111041,'Research Assistant II',6);
insert into staff values (910,'Reyes','freyesp9@ft.com','Female','Garden','12/21/2005',148860,'Product Engineer',4);
insert into staff values (911,'Peterson','jpetersonpa@unblog.fr','Male','Automotive','1/20/2002',53964,'Pharmacist',1);
insert into staff values (912,'Fisher','sfisherpb@answers.com','Female','Beauty','3/1/2007',131152,'Database Administrator IV',2);
insert into staff values (913,'Kelley','mkelleypc@sourceforge.net','Female','Clothing','2/20/2012',116266,'Marketing Assistant',6);
insert into staff values (914,'Armstrong','carmstrongpd@4shared.com','Female','Beauty','6/7/2006',143853,'Design Engineer',2);
insert into staff values (915,'Bell','cbellpe@npr.org','Male','Tools','5/26/2010',92561,'Senior Sales Associate',1);
insert into staff values (916,'Payne','bpaynepf@cbsnews.com','Female','Grocery','8/10/2006',45486,'GIS Technical Architect',1);
insert into staff values (917,'Gutierrez','sgutierrezpg@bloglovin.com','Male','Beauty','12/11/2004',95424,'VP Product Management',2);
insert into staff values (918,'Miller','amillerph@skype.com','Female','Baby','9/30/2004',73905,'Design Engineer',7);
insert into staff values (919,'Bishop','kbishoppi@ovh.net','Female','Movies','12/18/2010',53798,'Mechanical Systems Engineer',1);
insert into staff values (920,'Cole','scolepj@odnoklassniki.ru','Female','Tools','5/2/2010',116766,'Account Representative IV',4);
insert into staff values (921,'Moore','jmoorepk@home.pl','Female','Beauty','6/23/2013',142101,'Paralegal',2);
insert into staff values (922,'Watkins','swatkinspl@google.fr','Female','Beauty','4/19/2000',41299,'Computer Systems Analyst IV',5);
insert into staff values (923,'White','jwhitepm@elpais.com','Male','Grocery','1/7/2003',122130,'Project Manager',1);
insert into staff values (924,'Wilson','bwilsonpn@chron.com','Male','Beauty','3/6/2003',122446,'Systems Administrator II',6);
insert into staff values (925,'Phillips','dphillipspo@adobe.com','Female','Garden','10/3/2011',127367,'Recruiting Manager',4);
insert into staff values (926,'Austin','raustinpp@house.gov','Male','Toys','4/1/2014',50161,'Account Executive',3);
insert into staff values (927,'Howard','dhowardpq@ocn.ne.jp','Male','Music','11/10/2003',82080,'Analog Circuit Design manager',2);
insert into staff values (928,'Young','lyoungpr@psu.edu','Female','Kids','12/21/2009',62799,'Operator',1);
insert into staff values (929,'Rice','ericeps@reference.com','Female','Clothing','8/8/2003',66357,'Cost Accountant',3);
insert into staff values (930,'Hansen','jhansenpt@slate.com','Female','Garden','4/26/2013',129746,'Geological Engineer',1);
insert into staff values (931,'Burton','jburtonpu@wufoo.com','Female','Toys','8/24/2004',63682,'Recruiting Manager',5);
insert into staff values (932,'Reyes','lreyespv@tuttocitta.it','Female','Garden','5/27/2009',134114,'Accounting Assistant IV',2);
insert into staff values (933,'Williams','gwilliamspw@columbia.edu','Male','Baby','3/23/2014',131273,'Web Developer IV',6);
insert into staff values (934,'Morrison','tmorrisonpx@free.fr','Male','Toys','9/22/2005',93714,'Social Worker',5);
insert into staff values (935,'Hudson','mhudsonpy@altervista.org','Male','Books','12/8/2001',146745,'Assistant Media Planner',1);
insert into staff values (936,'Weaver','mweaverpz@delicious.com','Female','Computers','12/20/2010',126307,'Professor',4);
insert into staff values (937,'Hawkins','chawkinsq0@bravesites.com','Male','Sports','9/25/2011',134931,'Tax Accountant',1);
insert into staff values (938,'Jones','djonesq1@tamu.edu','Female','Home','2/10/2002',73668,'Environmental Specialist',2);
insert into staff values (939,'Austin','kaustinq2@soup.io','Male','Industrial','1/19/2012',48840,'Product Engineer',1);
insert into staff values (940,'Turner','lturnerq3@ycombinator.com','Male','Grocery','3/9/2014',146952,'Dental Hygienist',2);
insert into staff values (941,'Cunningham','gcunninghamq4@webmd.com','Female','Garden','5/7/2006',73565,'Mechanical Systems Engineer',7);
insert into staff values (942,'Lopez','llopezq5@usgs.gov','Male','Shoes','6/7/2010',64443,'Senior Sales Associate',6);
insert into staff values (943,'Phillips','kphillipsq6@soup.io','Female','Electronics','1/5/2008',127171,'Cost Accountant',4);
insert into staff values (944,'Adams','jadamsq7@aol.com','Female','Automotive','2/11/2002',79045,'VP Product Management',3);
insert into staff values (945,'Lee','pleeq8@noaa.gov','Female','Jewelery','3/16/2006',117147,'Staff Accountant III',1);
insert into staff values (946,'Phillips','dphillipsq9@stanford.edu','Female','Outdoors','1/6/2014',69807,'Account Representative IV',3);
insert into staff values (947,'Kelly','ckellyqa@boston.com','Female','Shoes','1/9/2004',128646,'Senior Editor',1);
insert into staff values (948,'James','bjamesqb@hubpages.com','Male','Tools','2/13/2008',47271,'Programmer Analyst IV',1);
insert into staff values (949,'Woods','jwoodsqc@patch.com','Male','Shoes','12/25/2005',59363,'Programmer Analyst IV',1);
insert into staff values (950,'Kennedy','jkennedyqd@nba.com','Female','Shoes','7/22/2008',68364,'Professor',5);
insert into staff values (951,'Lewis','jlewisqe@etsy.com','Female','Toys','12/17/2012',115975,'Social Worker',7);
insert into staff values (952,'Cole','acoleqf@unblog.fr','Female','Shoes','10/21/2008',53905,'Editor',7);
insert into staff values (953,'Edwards','pedwardsqg@cnbc.com','Male','Grocery','9/3/2003',115360,'Social Worker',6);
insert into staff values (954,'Cooper','ncooperqh@wp.com','Female','Electronics','7/19/2011',120108,'Computer Systems Analyst II',5);
insert into staff values (955,'Marshall','wmarshallqi@fastcompany.com','Male','Clothing','4/18/2005',59234,'VP Product Management',7);
insert into staff values (956,'Austin','saustinqj@vimeo.com','Female','Grocery','1/28/2007',76812,'Biostatistician III',7);
insert into staff values (957,'Franklin','cfranklinqk@dyndns.org','Female','Games','5/8/2012',42347,'VP Product Management',3);
insert into staff values (958,'Wood','bwoodql@epa.gov','Male','Tools','12/5/2003',82164,'Compensation Analyst',1);
insert into staff values (959,'Young','jyoungqm@xing.com','Male','Music','11/29/2000',114695,'Statistician IV',1);
insert into staff values (960,'Lane','glaneqn@google.fr','Male','Computers','12/31/2002',47541,'Payment Adjustment Coordinator',2);
insert into staff values (961,'Bowman','rbowmanqo@auda.org.au','Female','Baby','11/14/2011',116355,'Structural Engineer',5);
insert into staff values (962,'Hayes','ahayesqp@npr.org','Female','Health','10/13/2000',48339,'Engineer III',5);
insert into staff values (963,'Burton','cburtonqq@github.io','Female','Clothing','6/20/2012',58697,'Teacher',4);
insert into staff values (964,'Ramos','mramosqr@is.gd','Male','Garden','3/2/2002',127268,'Nurse Practicioner',4);
insert into staff values (965,'Butler','sbutlerqs@ow.ly','Male','Games','4/2/2014',115541,'Pharmacist',6);
insert into staff values (966,'Kelly','ckellyqt@canalblog.com','Female','Industrial','2/13/2008',54876,'Research Associate',2);
insert into staff values (967,'Lawson','clawsonqu@cargocollective.com','Female','Beauty','8/13/2012',55081,'Mechanical Systems Engineer',5);
insert into staff values (968,'Moreno','nmorenoqv@chronoengine.com','Male','Beauty','9/26/2009',123017,'Speech Pathologist',6);
insert into staff values (969,'Richards','jrichardsqw@blog.com','Male','Clothing','7/5/2014',85294,'Media Manager I',4);
insert into staff values (970,'James','pjamesqx@nymag.com','Male','Kids','8/5/2004',54470,'Accounting Assistant IV',2);
insert into staff values (971,'Dunn','mdunnqy@chronoengine.com','Female','Outdoors','6/11/2011',148889,'Help Desk Operator',4);
insert into staff values (972,'Bailey','mbaileyqz@howstuffworks.com','Female','Baby','1/10/2008',94049,'Senior Financial Analyst',7);
insert into staff values (973,'Walker','swalkerr0@sina.com.cn','Female','Movies','5/11/2009',51132,'Assistant Manager',4);
insert into staff values (974,'Welch','rwelchr1@eventbrite.com','Male','Toys','6/14/2002',87422,'Research Nurse',3);
insert into staff values (975,'Fowler','kfowlerr2@wp.com','Female','Garden','9/15/2014',88439,'Media Manager III',2);
insert into staff values (976,'Chapman','achapmanr3@list-manage.com','Male','Beauty','2/25/2005',110749,'Legal Assistant',7);
insert into staff values (977,'Collins','acollinsr4@jiathis.com','Male','Beauty','10/26/2006',137911,'Accountant IV',4);
insert into staff values (978,'Hunt','ghuntr5@moonfruit.com','Male','Electronics','6/18/2009',93665,'Health Coach I',3);
insert into staff values (979,'Medina','bmedinar6@1688.com','Male','Baby','12/31/2009',90068,'Quality Control Specialist',6);
insert into staff values (980,'Sanchez','tsanchezr7@lycos.com','Female','Home','12/19/2014',83704,'Editor',5);
insert into staff values (981,'Simmons','dsimmonsr8@craigslist.org','Male','Beauty','6/27/2011',116767,'Environmental Tech',3);
insert into staff values (982,'Mendoza','bmendozar9@reference.com','Female','Toys','8/26/2000',54599,'Assistant Media Planner',3);
insert into staff values (983,'Lopez','llopezra@blogger.com','Female','Sports','2/17/2014',94685,'Research Nurse',4);
insert into staff values (984,'Williams','hwilliamsrb@webnode.com','Male','Jewelery','10/20/2004',91608,'Staff Scientist',5);
insert into staff values (985,'Stevens','hstevensrc@hugedomains.com','Male','Electronics','2/28/2006',118791,'Safety Technician IV',1);
insert into staff values (986,'Ryan','hryanrd@networkadvertising.org','Male','Beauty','11/27/2002',115888,'Librarian',6);
insert into staff values (987,'Lawrence','slawrencere@cdbaby.com','Female','Tools','12/17/2000',60743,'Civil Engineer',5);
insert into staff values (988,'Cole','ecolerf@scientificamerican.com','Female','Beauty','4/17/2005',117962,'Accountant III',7);
insert into staff values (989,'Fields','dfieldsrg@examiner.com','Female','Music','3/7/2004',67817,'Registered Nurse',7);
insert into staff values (990,'Thomas','lthomasrh@elegantthemes.com','Male','Kids','8/6/2003',76229,'Business Systems Development Analyst',4);
insert into staff values (991,'Turner','rturnerri@a8.net','Female','Electronics','12/13/2009',62286,'Senior Sales Associate',2);
insert into staff values (992,'Edwards','nedwardsrj@wikimedia.org','Male','Outdoors','10/30/2006',121713,'Director of Sales',5);
insert into staff values (993,'Anderson','sandersonrk@businesswire.com','Female','Books','3/7/2009',139486,'Product Engineer',7);
insert into staff values (994,'Hamilton','rhamiltonrl@skype.com','Female','Health','10/29/2002',141375,'Desktop Support Technician',7);
insert into staff values (995,'Wood','kwoodrm@indiegogo.com','Female','Jewelery','4/5/2010',83404,'Pharmacist',2);
insert into staff values (996,'James','tjamesrn@soundcloud.com','Female','Games','11/17/2013',78433,'Accountant II',7);
insert into staff values (997,'Reynolds','dreynoldsro@blogtalkradio.com','Female','Computers','4/16/2007',120138,'Statistician IV',1);
insert into staff values (998,'Walker','kwalkerrp@unicef.org','Female','Games','2/13/2010',60363,'Account Coordinator',1);
insert into staff values (999,'Kennedy','lkennedyrq@edublogs.org','Male','Industrial','9/22/2004',48050,'Graphic Designer',2);
insert into staff values (1000,'Howard','showardrr@addtoany.com','Male','Baby','11/7/2003',148687,'General Manager',3);





-- Data Analysis

-- 1.How many total employees in this company 

-- select * from information_schema.columns;

select count(*) as No_of_Employees from staff;

-- or 

select count(staff_id) as No_of_employees from staff;



-- 2.What about gender distribution?

select gender , count(gender) as No_of_staffs from staff group by gender;


-- 3.How many employees in each department


select department , 
       count(staff_id) as No_of_staffs 
	   from staff 
	   group by department 
	   order by department asc;


-- 4.How many distinct departments ?

select distinct department from staff;

-- or 


-- Rename table Comapny_divisions to Company_divisions;

--Exec sp_rename 'Comapny_divisions' , 'Company_divsions';

--Exec sp_rename 'Company_divsions' , 'Company_divisions';


select distinct department from company_divisions;


-- 5.What is the highest and lowest salary of employees?


select MAX(salary) as max_salary , MIN(salary) as min_salary from staff;


-- 6.what about salary distribution by gender group?

select gender , 
       Min(salary) as Min_salary ,
	   Max(salary) as Max_salary ,
	   avg(salary) as avg_salary
	   from staff 
	   group by gender;


-- 7.How much total salary company is spending each year?


select Datename(Year , start_date) as Year ,
       sum(Salary) as Total_Salary
	   from staff
	   group by Datename(Year , start_date)
	   order by year asc;


-- or

-- Postgresql

select extract(Year from start_date) as Year , 
       sum(Salary) as Total_Salary
	   from staff
	   group by extract(Year from start_date)
	   order by Year asc;



-- 8.want to know distribution of min, max average salary by department


select department , 
       Min(salary) as Min_salary , 
	   Max(Salary) as Max_salary,
	   avg(salary) as avg_salary ,
	   count(staff_id) as No_of_employees
	   from staff
	   group by department
	   order by department asc;


--9.how spread out those salary around the average salary in each department ?

select  department ,
        max(salary) as max_salary , 
       min(salary) as min_salary ,
	   avg(salary) as avg_salary ,
	   --var_pop(salary) as population_variance ,
	   STDEV(Salary) as Std_deviation
	   from staff
	   group by department
	   order by  avg_salary desc;



-- 10.which department has the highest salary spread out ? (which department has highest std of salary)


select department ,
       max(salary) as max_salary ,
	   min(salary) as min_salary ,
	   avg(salary) as avg_salary ,
	   stdev(salary) as std_salary
	   from staff
	   group by department
	   order by std_salary desc;

-- Health department has highest std of salary;


-- 11.Show health department salary

select department , 
       sum(salary) as Total_salary 
	   from staff 
	   where  department = 'Health' 
	   group by department;


-- 12.we will make 3 buckets to see the salary earning status for Health Department

Create view status_earning AS

select department ,
       salary,
       case
	       WHEN salary > 100000 THEN 'High Earning' 
		   WHEN salary > 50000 and salary <= 100000 THEN 'Middle Earning'
		   ELSE 'Low Earning'
       END  as salary_earning_statushealth_department
	   from staff
	   where department = 'Health'
	   group by department , salary;


select * from status_earning;


-- we can see that there are 24 high earners, 14 middle earners and 8 low earner


-- 13.Let's find out about Outdoors department salary categories


Create view Outdoors_Earning_status AS

select department ,
       salary ,
       case 
	       WHEN salary >= 100000 THEN 'High Earner'
		   WHEN salary > 50000 and salary < 100000 THEN 'Middle Earner'
		   ELSE 'Low Earner'
		END as Outdoors_salary_status
		from staff
		where department = 'Outdoors'
		group by department , salary;


select * from Outdoors_Earning_status;



-- 14.What are the deparment start with B


select distinct department from staff where department like 'B%';




-- 15.we want to know person's salary comparing to his/her department average salary 

select last_name , 
       salary , 
	   s1.department,
       (select avg(salary) as avg_salary from staff as s2  where s1.department = s2.department)
       from staff as s1 
	   group by last_name , salary , s1.department;



-- 16.how many people are earning above/below the average salary of his/her department

With salary_status_ AS(

select last_name ,
       salary ,
	   s1.department ,
	   (select avg(salary) from staff as s2 where s1.department = s2.department) as avg_salary_department ,
	   case
	       WHEN salary > (select avg(salary) from staff as s2 where s1.department = s2.department) THEN 'Above'
		   WHEN salary < (select avg(salary) from staff as s2 where s1.department = s2.department) THEN 'Below'
		END as salary_status_column
		from staff as s1
		group by last_name , salary , s1.department


)


-- select * from salary_status_;

select salary_status_column , 
     count(
           case
               WHEN salary_status_column = 'Above' THEN 1
			   WHEN salary_status_column = 'Below' THEN 1
			END) as count
		from salary_status_
		group by salary_status_column;



-- Above 478 and Below 475;



-- 17.Assume that people who earn at latest 100,000 salary is Executive.
-- We want to know the average salary for executives for each department.

-- Give me avg salary of that department whos employee salary >= 100000;

select department , avg(salary) as avg_salary from staff where salary >= 100000 group by department;

-- It gives avg_salary of that employee whom salary >= 10000;


-- 18.who earn the most in the company? 


select TOP 1 * from staff as s1 
       inner join company_divisions as d 
	   on s1.department = d.department 
       inner join company_regions as c 
	   on s1.region_id = c.region_id 
	   order by salary desc;

-- or 

With Most_Salaried_Employee AS(

select staff_id , 
       last_name , 
	   Email_id , 
	   Gender , 
	   s.department , 
	   start_date , 
	   salary , 
	   Job_Title , 
	   cr.region_id,
       Company_division,
	   company_regions , 
	   country ,
       Dense_Rank() over(order by salary desc) as Rank_last_name
       from staff as s 
	   inner join company_divisions as cd 
	   on s.department = cd.department 
	   inner join company_regions as cr on s.region_id = cr.region_id

)

select * from Most_Salaried_Employee where Rank_last_name <= 1;



-- 19.who earn the most in his/her own department


With  Most_salaried_Employee_in_department AS(


select staff_id , 
       last_name , 
	   Email_id , 
	   Gender , 
	   department , 
	   start_date , 
	   salary , 
	   job_title  , 
	   region_id ,
       Dense_Rank() over(partition by department order by salary desc) as Rank_Employee
       from staff

)

select * from Most_salaried_Employee_in_department where Rank_Employee <= 1;


-- 20.full details info of employees with company division


select * from staff as s 
       inner join company_divisions as cd 
	   on s.department = cd.department;


-- 21.now all 1000 staffs are returned, but some 47 people have missing company - division.


select * from staff as s 
       left join company_divisions as cd 
	   on s.department = cd.department;


-- 22.who are those people with missing company division? (Those people which are company_division null)

select * from staff as s 
       left join company_divisions as cd 
	   on s.department = cd.department 
       where cd.company_division is null;


-- 23.How many staffs are in each company regions


select s.region_id , 
       company_regions , 
	   count(staff_id) as No_of_Employees , 
	   count(last_name) as No_of_staff
       from staff as s 
	   inner join company_regions as cd 
	   on s.region_id = cd.region_id 
       group by s.region_id , company_regions;



-- 24.employees per regions and country


select country , 
       company_regions , 
	   count(staff_id) as No_of_Employees , 
	   count(last_name) as No_of_staff , 
       Row_number() over(partition by country order by count(staff_id) desc) as Rank_company_regions
       from staff as s 
	   inner join company_regions as cr 
	   on s.region_id = cr.region_id 
	   group by country , company_regions;


-- No_of_Eployees and no_of_staff is same thing I just want to cross checked it so I took . you can take
-- any but staff_id is good option because its primary key.

-- 25.number of employees per regions & country, Then sub totals per Country, Then total for whole table


With sum_countriwise AS(

select Country , Company_regions , count(staff_id) as no_of_employees_regionwise_of_country  , 
sum(count(staff_id)) over(partition by Country order by count(staff_id)desc) as sum_regions_countrywise 
from staff as s inner join 
company_regions as cr
on s.region_id = cr.region_id group by Country , Company_regions

)

select sum(no_of_employees_regionwise_of_country) as Total_of_table from sum_countriwise;



-- 26.What are the top salary earners ?


-- if u want Top 3 salaries from whole company


With Top_three_salaries AS(
select * ,
Dense_Rank() over(order by salary desc) as Rank_staff
from staff
)

select * from Top_three_salaries where Rank_staff <= 3;

-- or 

-- If u want Top salary earners from each department;

With Top_salaried_from_department AS(

select *  ,
Dense_Rank() over(partition by department order by salary desc) as Rank_employees
from staff

)

select * from Top_Salaried_from_department where Rank_employees <= 1;


-- for canada country we have 390 employees and for USA 563 employees are associated;

-- Total Employees of table are 953;


-- 27.Top 5 division with highest number of employees

-- Rename company_divsion to company_division;

-- Exec sp_rename 'Company_divisions.Company_divsion' , 'Company_division';



with Top_five_company_division_most_employees AS(

select Company_division , 
       count(staff_id) as No_of_employees  , 
       Dense_Rank() over(order by count(staff_id) desc) as Rank_company_division
       from staff as s inner join company_divisions as cd on s.department = cd.department
       group by Company_division

)


select * from Top_five_company_division_most_employees where Rank_company_division <= 5;


-- or



select TOP 5 Company_division , 
       count(staff_id) as No_of_employees 
       from staff as s 
	   inner join company_divisions as cd 
	   on s.department = cd.department
       group by Company_division 
	   order by No_of_employees desc;





-- 28.employee salary vs average salary of his/her department


-- By windows function 

select staff_id , 
       last_name , 
	   department , 
	   salary as Employees_salary , 
	   avg(salary) over(partition by department) as avg_salary_department
	   from staff;

-- without windows function;


select staff_id ,
       last_name , 
	   salary ,
	   s1.department ,
	   (select avg(salary) from staff as s2 where s1.department = s2.department)
	   from staff as s1
	   order by s1.department;





-- 29.employee salary vs max salary of his/her department

select staff_id ,
       last_name ,
	   salary ,
	   department,
	   max(salary) over(partition by department) as max_Employee_salary_from_department
	   from staff;



-- 30.employee salary vs min salary of his/her Company Region

select staff_id ,
       last_name ,
	   salary , 
	   company_regions , 
	   min(salary) over(partition by company_regions) as min_salary_department
	   from staff as s inner join company_regions as cr on s.region_id = cr.region_id;


-- 31. compare salary of employee vs max salary of department


select staff_id ,
       last_name , 
	   salary ,
	   department ,
	   FIRST_VALUE(salary) over(partition by department order by salary desc) as Highest_salary_from_department
	   from staff;


-- First value exactly same as we do it Dense_Rank or Rank function;



-- 32.compare with the salary of person whose last name is in ascenidng in that department(Use first value)
-- salary of employee vs first value(whose last name is ascending)

select staff_id ,
       last_name , 
	   salary , 
	   department ,
	   first_value(last_name) over(partition by department order by last_name asc) as first_value_Employee
	   from staff;

-- 33.give the rank by salary decending order withint the specific department group.


select *  , 
      Dense_Rank() over(partition by department order by salary desc) as Rank_Employees
	  from staff where department = 'Automotive';


-- 34.Find out salary in desc order of specific department by row_number;


select staff_id ,
       last_name ,
	   salary  ,
	   department ,
	   Row_number() over(partition by department order by salary desc) as Row_number_employee_salary
	   from staff where department = 'Automotive';





-- 35. by lag ()

select staff_id ,
       last_name ,
	   salary ,
	   department , 
	   LAG(salary) over(partition by department order by salary desc) as LAG_Employees_salary
	   from staff;


-- LAG is just showing prevuous record value in current record in other column like here
-- it showing salary of current employee with salary of previous employee in the record;


-- 36. compare employee salary with next employee salary(by LEAD)

select staff_id ,
       last_name ,
	   department ,
	   salary as Employee_salary ,
	   LEAD(salary) over(partition by department order by salary asc) as Lead_employee_salary
	   from staff;




-- LEAD give value of next record




-- 37.NTILE()

select staff_id ,
       last_name , 
	   salary ,
	   department ,
	   NTILE(10) over(partition by department order by salary desc) as NTILE_employee_salary
	   from staff;


-- It create that number of buckets like here it create 10 buckets in each group of depattment  
-- make buckets of each department like total number of records dvide by value of NTILE like here
-- for automotive department has 46 records so it create 10 buckets of 46 records .. means it create buckets of 
-- 5 records 




-- 38.Average salary per department


select department , 
       avg(salary) as avg_salary_of_department
	   from staff 
	   group by department 
	   order by department asc;


-- 39.Female employees in USA


select * 
       from staff as s 
	   inner join company_regions as cr 
	   on s.region_id = cr.region_id 
       where gender = 'female' and country = 'USA';

-- 40.Top 3 highest paid employees

select TOP 3 * from staff order by salary desc;

-- or 


With Top_three_highest_paid_employees AS(

select *  , 
      Dense_rank() over(order by salary desc) as Rank_Employee_salary
	  from staff

)

select * from Top_three_highest_paid_employees where Rank_Employee_salary <= 3;




-- 41.Highest paid employee in each department

With highest_paid_employee_from_department AS(


select * ,
       Dense_rank() over(partition by department order by salary desc) as Rank_Employee_salary_in_department
	   from staff

)

select * from highest_paid_employee_from_department where Rank_Employee_salary_in_department <= 1;


-- 42.Divide salaries into 4 bands within each department;


select *  , 
       NTILE(4) over(partition by department order by salary desc) as buckets_of_employee_salaries
	   from staff;




-- 43.Employees who joined before 2010

select * from staff where datename(Year , start_date) < 2010;


-- 44.Count of employees per region

select s.region_id ,
       company_regions , 
	   count(staff_id) as No_of_employees_per_region
	   from staff as s inner join company_regions as cr on s.region_id = cr.region_id
	   group by s.region_id , company_regions
	   order by No_of_employees_per_region desc;


-- 45.Employees earning more than department average

select staff_id ,
       last_name ,
	   department ,
	   salary as Employee_salary ,
	   (select avg(salary) from staff as s1  where s1.department = s2.department group by department) 
	   as avg_salary_group
	   from staff as s2 
	   where salary > (select avg(salary) from staff as s1 where s1.department = s2.department group by department);



-- 46.Employees with invalid department or region (referential integrity check)

-- Here they want to show those depatment which is not available in staff table and same they want those
-- region which is not avaialble in staff so for that reason we need to left join staff table with company_divisions
-- and staff with company region respectively so left join will work first of all common records from both table
-- then uncommon records of left table (means all records of left table) so that time right table contains null values
-- if right tables department is not match with left table so basically we want those 
-- departments and region which are actually null


select staff_id ,
       last_name , 
	   cd.department , 
	   cr.region_id 
	   from staff as s left join company_divisions as cd on s.department = cd.department 
	   left join company_regions as cr  on s.region_id = cr.region_id 
	   where cd.department is null or cr.region_id is null;











































































------ Data Wrangling / Data Muniging ----------------


-- Make uppercase department;


select Upper(department) as Department from staff;


-- Lowercase


select lower(department) as department from staff;



select last_name , 
       concat(Job_title , ' - ' , department) as Job_title_with_department
	   from staff;