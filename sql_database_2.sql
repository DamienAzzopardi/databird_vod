-- Last version 10/06/21 1:00

DROP TABLE IF EXISTS cars;
create table cars
(car_id varchar(60) not null,
 maker  varchar(60) not null,
 CO2_code varchar(60) not null,
 colour varchar(60) not null,
 year INT not null,
 plate varchar(10) not null,
 CONSTRAINT id_pk_car primary key (`car_id`)
);

DROP TABLE IF EXISTS `members`;
create table `members`
(member_id varchar(60) not null,
 first_name  varchar(60) not null,
 last_name varchar(60) not null,
 gender varchar(1) not null,
 mobile_number varchar(15) not null,
 email varchar(120) not null,
 inscription_date date not null,
 birthdate date not null,
 is_ride_owner char(10) not null,
 license_driving_number varchar(20),
 license_driving_date date,
 pet_preference char(10),
 smoking_preference char(10),
 bank_account varchar(120) not null,
 CONSTRAINT id_pk_car primary key (member_id)
);

DROP TABLE IF EXISTS `member_car`;
create table `member_car`
(member_car_id varchar(60) not null,
 member_id  varchar(60) not null,
 car_id varchar(60) not null,
CONSTRAINT id_pk_member_car primary key (member_car_id)
);


DROP TABLE IF EXISTS `messages`;
create table `messages`
(message_id varchar(60) not null,
 sender_id  varchar(60) not null,
 receiver_id varchar(60) not null,
 body varchar(800) not null,
 CONSTRAINT id_pk_message primary key (message_id)
);


DROP TABLE IF EXISTS ratings;
create table `ratings`
(rating_id varchar(60) not null,
 rating_giver_id  varchar(60) not null,
 rating_receiver_id varchar(60) not null,
 comments varchar(800) not null,
 grades INT not null,
 CONSTRAINT id_pk_rating primary key (rating_id)
);


DROP TABLE IF EXISTS `cities`;
create table `cities`
(city_id varchar(60) not null,
 city_name  varchar(60) not null,
 state varchar(60) not null,
 country varchar(60) not null,
 CONSTRAINT id_pk_city primary key (city_id)
);

DROP TABLE IF EXISTS luggage_types;
create table luggage_types
(luggage_type_id varchar(60) not null,
 type  varchar(60) not null,
 CONSTRAINT id_pk_luggage primary key (luggage_type_id)
);


DROP TABLE IF EXISTS `rides`;
create table `rides`
(ride_id varchar(60) not null,
 member_car_id  varchar(60) not null,
 departure_date date not null,
 departure_time varchar(60) not null,
 starting_city_id  varchar(60) not null,
 destination_city_id varchar(60) not null,
 number_seats INT not null,
 contribution_per_passenger  INT not null,
 luggage_id varchar(60) not null,
 CONSTRAINT id_pk_ride primary key (ride_id)
);



DROP TABLE IF EXISTS requests;
create table requests
(request_id varchar(60) not null,
 ride_id varchar(60) not null,
 requester_id varchar(60) not null,
 request_status  varchar(60) not null,
 CONSTRAINT id_pk_request primary key (request_id)
);


DROP TABLE IF EXISTS request_status;
create table request_status
(request_status_id varchar(60) not null,
 status  varchar(60) not null,
 CONSTRAINT id_pk_request_status primary key (request_status_id)
);


ALTER TABLE `member_car` ADD FOREIGN KEY (member_id) REFERENCES `members` (`member_id`) ON DELETE CASCADE;
ALTER TABLE `member_car` ADD FOREIGN KEY (car_id) REFERENCES `cars` (`car_id`) ON DELETE CASCADE;

ALTER TABLE `messages` ADD FOREIGN KEY (sender_id) REFERENCES `members` (`member_id`) ON DELETE CASCADE;
ALTER TABLE `messages` ADD FOREIGN KEY (receiver_id) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

ALTER TABLE `ratings` ADD FOREIGN KEY (rating_giver_id) REFERENCES `members` (`member_id`) ON DELETE CASCADE;
ALTER TABLE `ratings` ADD FOREIGN KEY (rating_receiver_id) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

ALTER TABLE `rides` ADD FOREIGN KEY (member_car_id) REFERENCES `member_car` (`member_car_id`) ON DELETE CASCADE;
ALTER TABLE `rides` ADD FOREIGN KEY (starting_city_id) REFERENCES `cities` (`city_id`) ON DELETE CASCADE;
ALTER TABLE `rides` ADD FOREIGN KEY (destination_city_id) REFERENCES `cities` (`city_id`) ON DELETE CASCADE;
ALTER TABLE `rides` ADD FOREIGN KEY (luggage_id) REFERENCES `luggage_types` (`luggage_type_id`) ON DELETE CASCADE;

ALTER TABLE `requests` ADD FOREIGN KEY (requester_id) REFERENCES `members` (`member_id`) ON DELETE CASCADE;
ALTER TABLE `requests` ADD FOREIGN KEY (ride_id) REFERENCES `rides` (`ride_id`) ON DELETE CASCADE;
ALTER TABLE `requests` ADD FOREIGN KEY (request_status) REFERENCES `request_status` (`request_status_id`) ON DELETE CASCADE;

insert into `members` values ('mem-8902951','Jaleesa','Dirks','F','+33 632 665748','Jaleesa-Dirks86@outlook.com','2019-01-02','1968-3-3','0',NULL,NULL,'yes','yes','DE78779128651878995');
insert into `members` values ('mem-7170618','Yolanda','Wertman','F','+33 632 284063','Yolanda-Wertman74@gmail.com','2017-06-30','1974-9-22','0',NULL,NULL,'yes','no','FR42381867691746108');
insert into `members` values ('mem-4764322','Kiersten','Iraheta','M','+33 632 659890','Kiersten.Iraheta56@hotmail.com','2019-08-24','1992-4-29','1','lic-425/541701427','2010-4-12','no','no','LU46309087264834802');
insert into `members` values ('mem-4205665','Clorinda','Hutcheson','M','+33 632 574108','Clorinda.Hutcheson31@hotmail.com','2018-06-23','1996-1-7','0',NULL,NULL,'no','yes','DE52605181624289466');
insert into `members` values ('mem-8297494','Mao','Hutcheson','F','+33 632 735072','Mao-Hutcheson51@hotmail.com','2019-10-18','1999-11-30','0',NULL,NULL,'yes','yes','LU73123166599596727');
insert into `members` values ('mem-2221918','Kiersten','Dirks','M','+33 632 775903','Kiersten.Dirks10@HEC.com','2019-03-23','1986-3-21','1','lic-846/177599663','2007-9-10','yes','no','FR81455734959203336');
insert into `members` values ('mem-5055691','Shyla','Iraheta','F','+33 632 269712','Shyla.Iraheta74@mail.com','2018-02-12','1987-9-18','0',NULL,NULL,'yes','no','UK47922985747168887');
insert into `members` values ('mem-7295951','Kiersten','Pointer','M','+33 632 578083','Kiersten_Pointer82@mail.com','2017-09-03','1980-6-21','0',NULL,NULL,'yes','yes','LU41900047155643480');
insert into `members` values ('mem-9767683','Mammie','Mcenaney','F','+33 632 426009','Mammie.Mcenaney74@gmail.com','2018-11-17','1993-9-16','0',NULL,NULL,'no','no','UK59502819853252333');
insert into `members` values ('mem-9185626','Lynetta','Pacifico','F','+33 632 959954','Lynetta-Pacifico72@mail.com','2017-05-14','1972-2-11','1','lic-589/568855670','1994-7-26','yes','no','UK14369898624865558');
insert into `members` values ('mem-8460693','Zelma','Callejas','F','+33 632 235423','Zelma.Callejas94@gmail.com','2018-05-06','1993-11-21','0',NULL,NULL,'no','yes','LU95490723834758566');
insert into `members` values ('mem-5670820','Keeley','Watlington','F','+33 632 415306','Keeley_Watlington25@mail.com','2019-10-31','1993-8-23','0',NULL,NULL,'yes','no','DE52452476411139360');
insert into `members` values ('mem-2525276','Kimberley','Bianchi','M','+33 632 741014','Kimberley.Bianchi88@yahoo.com','2018-05-07','1987-8-21','0',NULL,NULL,'no','yes','LU61150158388562650');
insert into `members` values ('mem-9238906','Jaleesa','Mcenaney','M','+33 632 379082','Jaleesa.Mcenaney39@hotmail.com','2018-04-19','1985-6-23','1','lic-348/298904342','2008-11-19','yes','no','LU35706539143953580');
insert into `members` values ('mem-4230876','Clorinda','Bearden','F','+33 632 805000','Clorinda-Bearden32@hotmail.com','2017-06-13','1998-2-17','1','lic-617/158841037','2017-5-29','yes','no','UK63162592375991796');
insert into `members` values ('mem-4114012','Mao','Callejas','F','+33 632 404782','Mao-Callejas11@hotmail.com','2019-08-18','1984-2-26','1','lic-453/174638705','2002-10-25','yes','yes','FR92147172953765857');
insert into `members` values ('mem-1451150','Jaleesa','Iraheta','M','+33 632 318514','Jaleesa_Iraheta95@HEC.com','2018-09-03','2000-6-23','0',NULL,NULL,'no','no','DE78416963062737191');
insert into `members` values ('mem-5992513','Chang','Wertman','F','+33 632 613576','Chang_Wertman94@gmail.com','2017-11-13','1995-7-27','0',NULL,NULL,'yes','no','FR48429363078750307');
insert into `members` values ('mem-2257987','Marcy','Botsford','F','+33 632 730127','Marcy_Botsford88@outlook.com','2019-05-10','1987-4-1','0',NULL,NULL,'no','no','LU33602812016018857');
insert into `members` values ('mem-4267474','Yolanda','Shelley','F','+33 632 958971','Yolanda-Shelley30@gmail.com','2017-09-09','1992-8-5','0',NULL,NULL,'yes','no','LU18464494802895302');
insert into `members` values ('mem-1688422','Jaleesa','Watlington','F','+33 632 368292','Jaleesa-Watlington17@outlook.com','2018-08-01','1993-8-5','0',NULL,NULL,'yes','yes','FR79994325033427268');
insert into `members` values ('mem-1570790','Clorinda','Bearden','M','+33 632 295288','Clorinda-Bearden67@HEC.com','2018-04-26','1985-5-15','0',NULL,NULL,'yes','yes','FR62352657732193907');
insert into `members` values ('mem-7382076','Chang','Guglielmo','M','+33 632 493163','Chang.Guglielmo43@hotmail.com','2017-10-12','1965-10-28','0',NULL,NULL,'no','yes','UK22368443216276655');
insert into `members` values ('mem-7758431','Jaleesa','Dirks','M','+33 632 968602','Jaleesa-Dirks52@HEC.com','2017-10-11','1995-6-20','1','lic-915/251598579','2013-7-26','yes','no','DE58351633883538276');
insert into `members` values ('mem-5089917','Zelma','Pointer','M','+33 632 455840','Zelma_Pointer58@gmail.com','2018-02-03','1984-9-22','0',NULL,NULL,'yes','no','UK29290797414594127');
insert into `members` values ('mem-3307468','Kiersten','Trevizo','M','+33 632 315738','Kiersten-Trevizo91@mail.com','2019-11-18','1979-9-9','0',NULL,NULL,'no','yes','DE79154177746730972');
insert into `members` values ('mem-8747358','Danyel','Pesina','M','+33 632 942141','Danyel_Pesina21@mail.com','2019-04-25','2001-5-19','0',NULL,NULL,'yes','yes','LU70237983951991649');
insert into `members` values ('mem-1612906','Steffanie','Dirks','F','+33 632 821414','Steffanie.Dirks17@gmail.com','2018-04-05','1969-7-20','0',NULL,NULL,'yes','yes','UK73356885837570814');
insert into `members` values ('mem-2532082','Mao','Mcenaney','M','+33 632 770987','Mao_Mcenaney91@yahoo.com','2018-05-12','1986-2-6','0',NULL,NULL,'yes','no','LU20935819793777112');
insert into `members` values ('mem-7697934','Rene','Callejas','M','+33 632 533331','Rene-Callejas54@yahoo.com','2018-01-08','1997-6-5','0',NULL,NULL,'yes','no','LU16695022729722174');
insert into `members` values ('mem-3470182','Tam','Iraheta','M','+33 632 516100','Tam-Iraheta16@mail.com','2019-04-19','1980-6-15','0',NULL,NULL,'no','yes','FR16380115118692825');
insert into `members` values ('mem-7980564','Marcy','Watlington','F','+33 632 698168','Marcy.Watlington12@gmail.com','2018-06-06','1994-11-27','0',NULL,NULL,'no','yes','LU28856495513408144');
insert into `members` values ('mem-1167206','Marcy','Escobar','F','+33 632 139990','Marcy.Escobar38@HEC.com','2018-06-01','1997-4-20','0',NULL,NULL,'yes','yes','LU93996583807733798');
insert into `members` values ('mem-9715334','Jaleesa','Wertman','M','+33 632 556414','Jaleesa_Wertman66@hotmail.com','2018-05-09','1967-10-20','1','lic-453/660824130','1985-3-10','no','no','DE14502882625116775');
insert into `members` values ('mem-7733883','Steffanie','Pacifico','F','+33 632 102602','Steffanie-Pacifico47@mail.com','2017-03-22','1975-6-2','0',NULL,NULL,'no','no','UK78912443019912574');
insert into `members` values ('mem-8614720','Keeley','Bearden','M','+33 632 562657','Keeley_Bearden31@hotmail.com','2019-07-13','1993-4-12','0',NULL,NULL,'no','no','FR92842977699016209');
insert into `members` values ('mem-3764964','Chang','Randall','F','+33 632 850681','Chang_Randall53@yahoo.com','2017-07-06','1969-9-27','0',NULL,NULL,'yes','no','LU90421358783450106');
insert into `members` values ('mem-3798002','Jeanine','Randall','M','+33 632 168875','Jeanine.Randall86@gmail.com','2017-08-31','1969-3-3','0',NULL,NULL,'yes','no','LU69513114712999178');
insert into `members` values ('mem-8045504','Shyla','Iraheta','F','+33 632 258713','Shyla.Iraheta93@yahoo.com','2018-07-16','1980-2-6','0',NULL,NULL,'no','no','LU79882533463058763');
insert into `members` values ('mem-3122499','Lynetta','Mcenaney','M','+33 632 594400','Lynetta-Mcenaney27@HEC.com','2017-12-31','1989-1-28','1','lic-287/343659246','2012-9-16','no','yes','UK38882585355231382');
insert into `members` values ('mem-4599833','Jenniffer','Watlington','F','+33 632 824874','Jenniffer_Watlington86@gmail.com','2017-11-17','2001-11-12','0',NULL,NULL,'yes','no','DE50784670415241991');
insert into `members` values ('mem-3804070','Mao','Dirks','F','+33 632 677401','Mao-Dirks21@mail.com','2017-06-13','1989-2-24','0',NULL,NULL,'no','no','LU53465312085725517');
insert into `members` values ('mem-3725927','Jaleesa','Bianchi','M','+33 632 589315','Jaleesa-Bianchi71@outlook.com','2017-09-26','1990-4-9','0',NULL,NULL,'no','yes','DE31950328551411985');
insert into `members` values ('mem-1101746','Steffanie','Guglielmo','M','+33 632 526922','Steffanie_Guglielmo80@HEC.com','2017-02-09','1973-8-23','0',NULL,NULL,'yes','yes','LU17114483582851810');
insert into `members` values ('mem-3418649','Lynetta','Hartwell','F','+33 632 250929','Lynetta.Hartwell53@yahoo.com','2018-01-06','1971-6-17','0',NULL,NULL,'yes','no','FR96262317697582284');
insert into `members` values ('mem-9714080','Chang','Pointer','M','+33 632 135126','Chang.Pointer88@mail.com','2019-01-13','1989-7-5','0',NULL,NULL,'yes','no','LU14144952513171648');
insert into `members` values ('mem-8649963','Steffanie','Pointer','M','+33 632 342602','Steffanie-Pointer60@HEC.com','2017-02-03','1985-7-4','0',NULL,NULL,'no','no','FR32333148683379207');
insert into `members` values ('mem-2331394','Lynetta','Callejas','F','+33 632 214891','Lynetta_Callejas45@gmail.com','2017-02-16','2001-6-26','0',NULL,NULL,'yes','no','DE42995295239932140');
insert into `members` values ('mem-2426507','Zelma','Iraheta','M','+33 632 214865','Zelma_Iraheta62@outlook.com','2017-02-28','1993-10-27','1','lic-429/148201882','2015-6-29','no','yes','FR23181577356621592');
insert into `members` values ('mem-1003508','Blanch','Wertman','M','+33 632 381883','Blanch_Wertman73@mail.com','2018-12-14','1991-7-15','0',NULL,NULL,'yes','no','FR72725966488638432');
insert into `members` values ('mem-7921758','Marcy','Pointer','F','+33 632 782490','Marcy-Pointer13@outlook.com','2019-04-02','1990-10-30','0',NULL,NULL,'yes','no','LU44975833814647806');
insert into `members` values ('mem-3835624','Jeanine','Iraheta','F','+33 632 103793','Jeanine-Iraheta18@hotmail.com','2019-02-27','1973-4-6','0',NULL,NULL,'no','yes','FR14918359241995802');
insert into `members` values ('mem-8274901','Clorinda','Bianchi','F','+33 632 467221','Clorinda_Bianchi16@hotmail.com','2017-07-15','1982-3-25','0',NULL,NULL,'no','no','FR44627883703310575');
insert into `members` values ('mem-1599896','Jaleesa','Iraheta','F','+33 632 186867','Jaleesa_Iraheta51@hotmail.com','2018-10-23','2000-1-9','0',NULL,NULL,'yes','no','DE70327732882477993');
insert into `members` values ('mem-5274509','Chang','Pesina','F','+33 632 682336','Chang.Pesina61@outlook.com','2018-06-15','1968-2-27','0',NULL,NULL,'yes','no','LU76385264662572956');
insert into `members` values ('mem-8618305','Blanch','Wertman','M','+33 632 979534','Blanch.Wertman33@gmail.com','2019-01-04','1990-8-6','0',NULL,NULL,'yes','yes','FR19120318481649439');
insert into `members` values ('mem-8961756','Mao','Winburn','M','+33 632 625725','Mao-Winburn42@outlook.com','2017-11-26','1997-5-15','0',NULL,NULL,'no','yes','FR40145219482397304');
insert into `members` values ('mem-3580873','Marcy','Watlington','M','+33 632 663266','Marcy.Watlington23@HEC.com','2017-05-25','1970-7-26','1','lic-972/991023554','1988-2-19','no','no','FR84827085741734714');
insert into `members` values ('mem-9428037','Yolanda','Pointer','M','+33 632 561071','Yolanda-Pointer46@HEC.com','2018-01-23','2000-8-26','0',NULL,NULL,'no','yes','FR93376196078862665');
insert into `members` values ('mem-2926213','Lynetta','Hutcheson','M','+33 632 575041','Lynetta_Hutcheson56@hotmail.com','2017-04-30','1967-8-21','0',NULL,NULL,'yes','yes','FR58131344798198886');
insert into `members` values ('mem-6123422','Maribeth','Pesina','F','+33 632 763653','Maribeth_Pesina39@mail.com','2019-10-21','1967-9-6','0',NULL,NULL,'yes','yes','UK13322416176017248');
insert into `members` values ('mem-2027330','Lynetta','Randall','M','+33 632 952863','Lynetta-Randall68@mail.com','2018-04-17','1995-1-2','1','lic-426/130320556','2017-7-18','no','no','FR10817424677142657');
insert into `members` values ('mem-4344480','Kiersten','Wertman','M','+33 632 665440','Kiersten-Wertman42@mail.com','2018-04-24','1987-5-28','1','lic-619/838918491','2006-1-25','no','no','UK20608490194469612');
insert into `members` values ('mem-7167156','Tam','Watlington','M','+33 632 152918','Tam.Watlington87@outlook.com','2018-08-10','1995-8-7','0',NULL,NULL,'yes','no','DE66239067996750393');
insert into `members` values ('mem-1988561','Marcy','Escobar','M','+33 632 950045','Marcy.Escobar41@outlook.com','2018-08-22','1991-1-6','1','lic-916/276438921','2011-9-28','yes','yes','DE68860697708118745');
insert into `members` values ('mem-9611221','Jeanine','Winburn','F','+33 632 298789','Jeanine-Winburn52@mail.com','2019-09-05','1966-3-12','0',NULL,NULL,'no','yes','LU29586576799620767');
insert into `members` values ('mem-2509055','Jeanine','Bearden','M','+33 632 846988','Jeanine.Bearden82@gmail.com','2017-05-10','2000-7-28','0',NULL,NULL,'no','yes','LU28114830654261703');
insert into `members` values ('mem-4903288','Kimberley','Winburn','M','+33 632 718605','Kimberley.Winburn69@mail.com','2019-01-13','1997-4-20','0',NULL,NULL,'no','no','UK21833837977846189');
insert into `members` values ('mem-3980469','Steffanie','Mcenaney','F','+33 632 482370','Steffanie.Mcenaney98@mail.com','2019-12-01','1969-3-2','0',NULL,NULL,'yes','yes','FR25753889506279184');
insert into `members` values ('mem-4097319','Kimberley','Iraheta','F','+33 632 816504','Kimberley.Iraheta80@HEC.com','2017-04-16','1976-7-21','1','lic-354/146784666','1996-3-21','yes','no','DE35322753365467860');
insert into `members` values ('mem-8550994','Tam','Winburn','F','+33 632 102978','Tam_Winburn29@HEC.com','2018-03-20','1998-1-19','0',NULL,NULL,'no','no','UK84900591869915748');
insert into `members` values ('mem-1446885','Tam','Mcenaney','M','+33 632 542329','Tam-Mcenaney90@mail.com','2017-04-08','1978-1-16','0',NULL,NULL,'yes','yes','UK81809089379411887');
insert into `members` values ('mem-6486914','Mao','Trevizo','M','+33 632 703135','Mao.Trevizo58@mail.com','2018-03-17','2001-7-1','0',NULL,NULL,'yes','yes','DE36791685191834401');
insert into `members` values ('mem-7196858','Marcy','Callejas','M','+33 632 201706','Marcy_Callejas70@outlook.com','2018-04-10','1981-6-12','0',NULL,NULL,'yes','no','DE80233716841859325');
insert into `members` values ('mem-1201687','Clorinda','Hartwell','F','+33 632 783507','Clorinda.Hartwell24@outlook.com','2019-12-29','1980-5-11','0',NULL,NULL,'no','no','LU59223392765192943');
insert into `members` values ('mem-5654890','Shyla','Winburn','F','+33 632 883757','Shyla.Winburn30@gmail.com','2017-08-29','1985-5-4','0',NULL,NULL,'no','no','LU88690193715358171');
insert into `members` values ('mem-5674753','Jaleesa','Guglielmo','M','+33 632 109657','Jaleesa.Guglielmo73@outlook.com','2018-10-18','1979-8-25','1','lic-213/221078575','2002-10-20','yes','yes','DE14997751946544833');
insert into `members` values ('mem-9254258','Chang','Pacifico','M','+33 632 316326','Chang-Pacifico57@gmail.com','2019-03-28','1970-9-13','0',NULL,NULL,'yes','yes','FR79493118107585372');
insert into `members` values ('mem-6261940','Shyla','Guglielmo','M','+33 632 758855','Shyla-Guglielmo95@HEC.com','2017-07-03','1992-8-24','0',NULL,NULL,'yes','yes','DE50525463782743968');
insert into `members` values ('mem-4796329','Maribeth','Callejas','F','+33 632 266381','Maribeth_Callejas12@HEC.com','2019-09-16','1991-1-27','1','lic-633/541221917','2015-1-26','yes','yes','DE88812969815959932');
insert into `members` values ('mem-1541797','Chang','Bearden','M','+33 632 182151','Chang-Bearden87@hotmail.com','2019-03-14','1979-7-8','0',NULL,NULL,'no','yes','UK72944025409019757');
insert into `members` values ('mem-1525114','Marcy','Shelley','M','+33 632 240240','Marcy.Shelley93@outlook.com','2018-06-11','1982-2-27','0',NULL,NULL,'yes','no','DE77711393008288778');
insert into `members` values ('mem-1220038','Mammie','Dirks','F','+33 632 858411','Mammie-Dirks32@outlook.com','2019-09-24','1986-2-15','0',NULL,NULL,'yes','yes','UK25934944562683765');
insert into `members` values ('mem-2883275','Steffanie','Botsford','F','+33 632 243401','Steffanie.Botsford57@gmail.com','2018-04-14','1979-11-28','0',NULL,NULL,'yes','yes','LU59426487734598183');
insert into `members` values ('mem-5961838','Zelma','Hartwell','M','+33 632 561310','Zelma-Hartwell63@hotmail.com','2017-05-17','1965-7-13','0',NULL,NULL,'yes','no','UK12147283639411431');
insert into `members` values ('mem-1353047','Mao','Watlington','F','+33 632 652350','Mao_Watlington70@mail.com','2017-01-17','1974-2-28','1','lic-840/875602015','1995-9-25','no','no','DE84321316576191471');
insert into `members` values ('mem-9916130','Zelma','Guglielmo','M','+33 632 461665','Zelma.Guglielmo55@mail.com','2019-10-26','1988-10-13','0',NULL,NULL,'no','yes','FR28481673417293149');
insert into `members` values ('mem-2758152','Kimberley','Shelley','F','+33 632 337195','Kimberley_Shelley70@gmail.com','2017-06-18','1989-8-10','0',NULL,NULL,'no','yes','LU44885115951753899');
insert into `members` values ('mem-5617608','Mao','Hutcheson','F','+33 632 730497','Mao.Hutcheson89@gmail.com','2017-01-19','1995-11-21','0',NULL,NULL,'yes','no','FR23443817936714237');
insert into `members` values ('mem-5830958','Lynetta','Pesina','F','+33 632 141230','Lynetta-Pesina57@mail.com','2019-02-26','1973-3-13','0',NULL,NULL,'yes','yes','LU13640339982135618');
insert into `members` values ('mem-7833095','Marcy','Pointer','F','+33 632 165882','Marcy_Pointer70@yahoo.com','2019-04-17','1965-8-10','1','lic-797/613542664','1989-1-28','no','yes','UK27126584878852515');
insert into `members` values ('mem-6437439','Tam','Pointer','F','+33 632 507970','Tam-Pointer11@outlook.com','2018-03-08','1968-6-1','0',NULL,NULL,'yes','yes','LU25724448553329753');
insert into `members` values ('mem-7442928','Steffanie','Pacifico','M','+33 632 614768','Steffanie_Pacifico98@HEC.com','2017-02-21','2001-11-10','1','lic-733/102075177','2021-6-28','no','yes','LU22671048598580868');
insert into `members` values ('mem-9042938','Rene','Bianchi','M','+33 632 318101','Rene_Bianchi31@gmail.com','2019-05-21','1980-4-28','0',NULL,NULL,'no','no','FR16126999986519103');
insert into `members` values ('mem-2677806','Clorinda','Hutcheson','F','+33 632 796638','Clorinda_Hutcheson14@mail.com','2017-11-30','1987-8-4','0',NULL,NULL,'no','no','FR72198683409435794');
insert into `members` values ('mem-7287474','Yolanda','Bianchi','F','+33 632 331369','Yolanda.Bianchi95@hotmail.com','2018-02-06','1978-5-22','0',NULL,NULL,'no','no','UK59173117218990136');
insert into `members` values ('mem-9732887','Mao','Escobar','F','+33 632 446587','Mao-Escobar68@outlook.com','2018-11-20','1986-3-27','0',NULL,NULL,'no','no','DE82325293291579806');
insert into `members` values ('mem-5605301','Kiersten','Iraheta','F','+33 632 116882','Kiersten-Iraheta27@outlook.com','2017-01-17','1985-1-8','0',NULL,NULL,'yes','no','LU21268050464460466');
insert into `members` values ('mem-7257451','Shyla','Botsford','M','+33 632 912790','Shyla.Botsford89@gmail.com','2019-08-05','1968-4-24','0',NULL,NULL,'yes','yes','UK38520871666208518');
insert into `members` values ('mem-1860416','Danyel','Mcenaney','M','+33 632 850379','Danyel_Mcenaney43@yahoo.com','2018-04-11','1981-9-27','0',NULL,NULL,'no','no','DE10999053931465887');
insert into `members` values ('mem-8954067','Tam','Escobar','F','+33 632 206419','Tam-Escobar12@mail.com','2018-05-14','1970-1-14','0',NULL,NULL,'no','yes','LU94274189205290654');
insert into `members` values ('mem-9629145','Danyel','Iraheta','M','+33 632 733962','Danyel_Iraheta35@hotmail.com','2019-10-02','1978-10-23','0',NULL,NULL,'yes','no','LU96661181357458961');
insert into `members` values ('mem-3267423','Steffanie','Pointer','F','+33 632 721128','Steffanie-Pointer25@hotmail.com','2017-12-25','1982-8-2','0',NULL,NULL,'no','yes','FR70231629759445252');
insert into `members` values ('mem-6510799','Kiersten','Wertman','M','+33 632 255337','Kiersten_Wertman66@gmail.com','2018-07-10','1978-6-20','0',NULL,NULL,'yes','yes','DE47843233837283546');
insert into `members` values ('mem-6250900','Jeanine','Hartwell','F','+33 632 422295','Jeanine.Hartwell74@hotmail.com','2019-09-25','1971-2-15','0',NULL,NULL,'no','yes','DE29464733396281298');
insert into `members` values ('mem-4003334','Yolanda','Shelley','F','+33 632 696312','Yolanda.Shelley32@outlook.com','2017-01-05','1988-3-22','0',NULL,NULL,'yes','no','DE67782583103997264');
insert into `members` values ('mem-1703083','Steffanie','Iraheta','F','+33 632 251490','Steffanie.Iraheta25@hotmail.com','2017-11-27','1985-9-9','0',NULL,NULL,'no','no','LU15852743592058406');
insert into `members` values ('mem-4948829','Rene','Randall','M','+33 632 221902','Rene-Randall96@outlook.com','2018-11-29','1983-9-9','0',NULL,NULL,'yes','no','LU57394425757388879');
insert into `members` values ('mem-7781385','Danyel','Pacifico','F','+33 632 949549','Danyel.Pacifico89@mail.com','2019-06-15','1996-5-3','0',NULL,NULL,'yes','yes','DE91120327815420389');
insert into `members` values ('mem-3565334','Danyel','Callejas','M','+33 632 182668','Danyel.Callejas71@yahoo.com','2017-09-10','1994-9-23','1','lic-930/439488785','2014-11-4','no','no','UK25148736232117673');
insert into `members` values ('mem-2407091','Rene','Mcenaney','F','+33 632 366745','Rene_Mcenaney93@mail.com','2017-06-10','1971-3-1','0',NULL,NULL,'yes','yes','UK33843574624254601');
insert into `members` values ('mem-2311238','Tam','Iraheta','M','+33 632 744421','Tam.Iraheta78@gmail.com','2019-02-21','2000-1-18','1','lic-836/816979262','2023-1-17','no','no','FR83716838074960732');
insert into `members` values ('mem-8252770','Shyla','Shelley','M','+33 632 754026','Shyla_Shelley52@yahoo.com','2018-06-27','1985-1-27','0',NULL,NULL,'no','no','DE42582758133544684');
insert into `members` values ('mem-6546690','Zelma','Botsford','F','+33 632 313737','Zelma-Botsford20@HEC.com','2017-02-23','1990-10-20','0',NULL,NULL,'no','no','FR47105797617815424');
insert into `members` values ('mem-1391067','Kimberley','Iraheta','F','+33 632 959649','Kimberley.Iraheta52@HEC.com','2018-01-29','2000-8-15','1','lic-830/576784415','2019-7-5','no','yes','LU70754435134838781');
insert into `members` values ('mem-5188915','Jaleesa','Pesina','F','+33 632 424785','Jaleesa_Pesina57@gmail.com','2019-06-21','1985-4-1','0',NULL,NULL,'no','no','FR77679899783041694');
insert into `members` values ('mem-6707135','Rene','Hartwell','F','+33 632 644440','Rene.Hartwell14@hotmail.com','2018-07-16','1990-2-19','0',NULL,NULL,'no','yes','UK32652641369794224');
insert into `members` values ('mem-9303023','Steffanie','Dirks','F','+33 632 890749','Steffanie_Dirks84@mail.com','2017-03-12','1971-4-20','0',NULL,NULL,'no','no','DE24378856517545887');
insert into `members` values ('mem-7565092','Jenniffer','Shelley','F','+33 632 454573','Jenniffer_Shelley92@yahoo.com','2019-07-14','1981-4-4','0',NULL,NULL,'no','yes','FR61593313653732345');
insert into `members` values ('mem-3716538','Zelma','Pointer','F','+33 632 140349','Zelma.Pointer96@outlook.com','2018-11-26','1971-8-16','0',NULL,NULL,'yes','yes','LU66840078341047836');
insert into `members` values ('mem-5911536','Zelma','Randall','M','+33 632 666948','Zelma.Randall52@hotmail.com','2017-01-24','1987-4-7','0',NULL,NULL,'no','yes','UK39691535705904658');
insert into `members` values ('mem-8802778','Jeanine','Iraheta','M','+33 632 597152','Jeanine.Iraheta31@outlook.com','2018-10-04','1999-9-2','0',NULL,NULL,'yes','yes','UK48493054898803664');
insert into `members` values ('mem-5954620','Danyel','Hutcheson','F','+33 632 466102','Danyel.Hutcheson67@hotmail.com','2019-02-27','1995-11-18','0',NULL,NULL,'no','yes','LU62464941097734412');
insert into `members` values ('mem-1462013','Mao','Pesina','M','+33 632 571698','Mao_Pesina15@mail.com','2017-02-24','1982-3-18','1','lic-221/107550971','2001-1-29','yes','yes','DE60370811829680153');
insert into `members` values ('mem-1243151','Jeanine','Escobar','M','+33 632 266669','Jeanine-Escobar93@outlook.com','2019-04-21','1973-8-25','1','lic-386/349539616','1994-1-4','no','no','UK80120252351161393');
insert into `members` values ('mem-8540471','Danyel','Iraheta','M','+33 632 826514','Danyel-Iraheta90@mail.com','2019-07-16','1973-1-20','0',NULL,NULL,'yes','yes','LU34119033103324464');
insert into `members` values ('mem-5284809','Jeanine','Shelley','M','+33 632 796596','Jeanine.Shelley21@hotmail.com','2017-11-21','1975-2-23','0',NULL,NULL,'yes','no','LU80410866181536989');
insert into `members` values ('mem-7251531','Rene','Wertman','F','+33 632 135292','Rene_Wertman31@yahoo.com','2018-02-08','1999-3-12','1','lic-390/166931358','2017-2-3','no','yes','LU35334835693859962');
insert into `members` values ('mem-2964127','Mao','Pointer','F','+33 632 429066','Mao_Pointer13@hotmail.com','2019-02-24','1979-3-1','0',NULL,NULL,'yes','yes','FR14419165889624100');
insert into `members` values ('mem-7020040','Danyel','Bearden','M','+33 632 855155','Danyel-Bearden18@HEC.com','2018-03-11','2001-8-21','0',NULL,NULL,'yes','yes','DE93137896563636225');
insert into `members` values ('mem-3967691','Zelma','Callejas','F','+33 632 449692','Zelma-Callejas55@hotmail.com','2017-05-04','1985-6-18','0',NULL,NULL,'no','yes','FR59980158184532995');
insert into `members` values ('mem-3333107','Kiersten','Escobar','F','+33 632 181235','Kiersten_Escobar43@mail.com','2019-02-04','1980-10-12','1','lic-670/801069803','1999-7-16','yes','yes','UK11195065831665486');
insert into `members` values ('mem-3455901','Shyla','Hartwell','F','+33 632 100040','Shyla.Hartwell80@gmail.com','2017-08-23','1994-2-17','0',NULL,NULL,'yes','yes','UK34857322769178950');
insert into `members` values ('mem-8181614','Kimberley','Pacifico','M','+33 632 532642','Kimberley-Pacifico71@HEC.com','2017-04-08','1975-7-6','0',NULL,NULL,'no','no','DE36412495687791381');
insert into `members` values ('mem-6274663','Keeley','Hutcheson','M','+33 632 902470','Keeley.Hutcheson47@outlook.com','2017-08-30','1981-9-8','0',NULL,NULL,'yes','yes','UK33172236641883810');
insert into `members` values ('mem-6510063','Keeley','Escobar','F','+33 632 787415','Keeley_Escobar56@HEC.com','2019-07-03','1989-7-24','0',NULL,NULL,'yes','no','UK72470679269866321');
insert into `members` values ('mem-4862913','Mao','Iraheta','M','+33 632 641308','Mao-Iraheta45@hotmail.com','2018-03-03','1976-11-12','0',NULL,NULL,'yes','yes','LU22919985662266450');
insert into `members` values ('mem-8185304','Lynetta','Wertman','M','+33 632 257107','Lynetta-Wertman91@HEC.com','2019-09-07','1992-4-9','0',NULL,NULL,'yes','yes','UK92794452831841904');
insert into `members` values ('mem-5503483','Jaleesa','Bearden','M','+33 632 951418','Jaleesa_Bearden66@outlook.com','2019-12-19','1986-10-28','0',NULL,NULL,'no','no','UK26149979325893605');
insert into `members` values ('mem-7318914','Kimberley','Watlington','F','+33 632 937558','Kimberley_Watlington38@yahoo.com','2018-07-08','1983-5-15','0',NULL,NULL,'no','yes','DE52358497719033195');
insert into `members` values ('mem-1906036','Mao','Hartwell','F','+33 632 379350','Mao.Hartwell50@hotmail.com','2017-03-29','1973-1-21','0',NULL,NULL,'yes','no','LU76286280257661254');
insert into `members` values ('mem-8047078','Keeley','Watlington','M','+33 632 526826','Keeley-Watlington88@HEC.com','2019-08-23','1969-10-18','0',NULL,NULL,'yes','yes','UK78724011852169988');
insert into `members` values ('mem-7539417','Kimberley','Shelley','M','+33 632 947283','Kimberley_Shelley95@mail.com','2017-02-22','1966-2-18','0',NULL,NULL,'no','no','FR33839019934115430');
insert into `members` values ('mem-4672564','Mao','Hutcheson','F','+33 632 200916','Mao-Hutcheson81@hotmail.com','2019-01-10','1970-4-9','0',NULL,NULL,'yes','yes','LU62574880976442143');
insert into `members` values ('mem-6704528','Lynetta','Callejas','F','+33 632 461423','Lynetta_Callejas82@outlook.com','2019-05-15','1979-7-9','0',NULL,NULL,'no','no','UK82304339086129307');
insert into `members` values ('mem-2559009','Maribeth','Iraheta','F','+33 632 504738','Maribeth-Iraheta93@yahoo.com','2018-10-12','2000-3-26','1','lic-530/645295820','2018-5-20','no','yes','LU75795583661226721');
insert into `members` values ('mem-3255089','Marcy','Bearden','M','+33 632 220043','Marcy-Bearden15@mail.com','2019-11-25','1977-2-5','1','lic-219/236466671','1996-9-13','no','yes','FR87804399327771393');
insert into `members` values ('mem-7424153','Tam','Escobar','F','+33 632 910078','Tam.Escobar31@hotmail.com','2019-06-12','1979-6-10','0',NULL,NULL,'yes','yes','LU39649336493349743');
insert into `members` values ('mem-1486665','Maribeth','Iraheta','M','+33 632 868439','Maribeth_Iraheta89@hotmail.com','2017-10-27','1988-4-23','0',NULL,NULL,'no','yes','FR73951360649839352');
insert into `members` values ('mem-2817067','Kimberley','Pointer','M','+33 632 988395','Kimberley-Pointer53@outlook.com','2018-05-07','1990-8-25','0',NULL,NULL,'no','yes','DE16983048831797453');

insert into cars values ('1','BMW','653Z','red' , 1994 , '18-FIR-87');
insert into cars values ('2','BMW','741F','black' , 2005 , '46-QHD-96');
insert into cars values ('3','Land Rover','332E','orange' , 2009 , '76-PFC-22');
insert into cars values ('4','Land Rover','653Z','pink' , 2000 , '25-PKR-73');
insert into cars values ('5','Citroen','122A','grey' , 1997 , '10-GHJ-48');
insert into cars values ('6','Citroen','612G','yellow' , 2009 , '93-RKD-55');
insert into cars values ('7','Renault','101','orange' , 1992 , '94-DNH-41');
insert into cars values ('8','Daymler','741F','red' , 1999 , '35-NCO-33');
insert into cars values ('9','Land Rover','224C','dark blue' , 1999 , '22-KOR-63');
insert into cars values ('10','Land Rover','321E','red' , 2007 , '42-KOD-73');
insert into cars values ('11','Fiat','332E','white' , 1993 , '39-KAE-82');
insert into cars values ('12','Chrisler','111A','grey' , 2001 , '47-IHJ-13');
insert into cars values ('13','Daymler','653Z','grey' , 2003 , '81-BRJ-95');
insert into cars values ('14','Land Rover','224C','white' , 2013 , '35-KSB-23');
insert into cars values ('15','Citroen','224C','white' , 1993 , '76-IPQ-36');
insert into cars values ('16','Daymler','111A','dark grey' , 2013 , '68-GFS-14');
insert into cars values ('17','Mercedes','332E','dark blue' , 2015 , '70-QAF-69');
insert into cars values ('18','Volkswagen','202A','blue' , 2002 , '94-DNC-78');
insert into cars values ('19','BMW','224C','pink' , 1990 , '29-JOQ-81');
insert into cars values ('20','Volkswagen','111A','orange' , 2009 , '87-HID-23');

insert into `member_car` values ('1','mem-4764322','1');
insert into `member_car` values ('2','mem-2221918','2');
insert into `member_car` values ('3','mem-9185626','2');
insert into `member_car` values ('4','mem-9238906','3');
insert into `member_car` values ('5','mem-4230876','4');
insert into `member_car` values ('6','mem-4114012','4');
insert into `member_car` values ('7','mem-7758431','4');
insert into `member_car` values ('8','mem-9715334','5');
insert into `member_car` values ('9','mem-3122499','6');
insert into `member_car` values ('10','mem-2426507','6');
insert into `member_car` values ('11','mem-3580873','7');
insert into `member_car` values ('12','mem-2027330','8');
insert into `member_car` values ('13','mem-4344480','8');
insert into `member_car` values ('14','mem-1988561','9');
insert into `member_car` values ('15','mem-4097319','10');
insert into `member_car` values ('16','mem-5674753','11');
insert into `member_car` values ('17','mem-4796329','12');
insert into `member_car` values ('18','mem-1353047','13');
insert into `member_car` values ('19','mem-7833095','14');
insert into `member_car` values ('20','mem-7442928','15');
insert into `member_car` values ('21','mem-3565334','16');
insert into `member_car` values ('22','mem-2311238','17');
insert into `member_car` values ('23','mem-1391067','18');
insert into `member_car` values ('24','mem-1462013','19');
insert into `member_car` values ('25','mem-1243151','19');
insert into `member_car` values ('26','mem-7251531','20');
insert into `member_car` values ('27','mem-4344480','2');
insert into `member_car` values ('28','mem-7251531','19');


insert into cities values ('1','Paris','IDF','France');
insert into cities values ('2','Versailles','Yvelines','France');
insert into cities values ('3','Tour','Indre-et-Loire','France');
insert into cities values ('4','Orléans','Loiret','France');
insert into cities values ('5','Lyon','Bourgogne','France');
insert into cities values ('6','Bruxelles','NA','Belgique');
insert into cities values ('7','Marseille','Rhone','France');

insert into luggage_types values ('1','petit');
insert into luggage_types values ('2','moyen');
insert into luggage_types values ('3','gros');

insert into rides values ('1','7','2020-03-02','19h32','7','4','1',15,'1');
insert into rides values ('2','10','2020-01-10','16h26','6','3','2',15,'2');
insert into rides values ('3','4','2020-04-21','18h27','6','2','3',20,'1');
insert into rides values ('4','6','2020-03-04','7h32','6','7','4',5,'3');
insert into rides values ('5','19','2020-04-26','5h57','3','7','4',20,'3');
insert into rides values ('6','3','2020-04-25','17h24','2','3','3',5,'2');
insert into rides values ('7','6','2020-02-09','14h55','3','2','4',5,'3');
insert into rides values ('8','14','2020-02-06','9h44','4','3','1',5,'3');
insert into rides values ('9','20','2020-01-11','23h58','6','2','4',20,'1');
insert into rides values ('10','18','2020-04-22','4h24','2','3','4',5,'2');
insert into rides values ('11','2','2020-03-08','22h45','5','1','4',20,'2');
insert into rides values ('12','15','2020-01-10','4h21','1','2','2',5,'1');
insert into rides values ('13','8','2020-02-24','20h31','7','6','3',5,'2');
insert into rides values ('14','23','2020-05-17','1h54','3','7','3',20,'1');
insert into rides values ('15','24','2020-02-02','16h55','2','4','2',10,'2');
insert into rides values ('16','10','2020-04-12','16h15','4','2','4',10,'1');
insert into rides values ('17','8','2020-04-19','5h51','2','5','4',15,'1');
insert into rides values ('18','7','2020-05-26','15h26','1','4','3',15,'1');
insert into rides values ('19','26','2020-02-14','18h22','7','2','2',25,'2');
insert into rides values ('20','21','2020-03-16','14h24','6','7','1',5,'2');
insert into rides values ('21','13','2020-01-21','23h54','6','2','4',20,'3');
insert into rides values ('22','20','2020-04-30','2h22','7','4','3',15,'2');
insert into rides values ('23','2','2020-03-16','8h32','7','3','3',20,'1');
insert into rides values ('24','2','2020-01-20','9h51','4','5','3',5,'2');
insert into rides values ('25','18','2020-03-18','18h41','7','6','1',5,'1');
insert into rides values ('26','24','2020-01-15','21h13','6','4','2',10,'2');
insert into rides values ('27','14','2020-02-26','13h38','3','5','3',10,'1');
insert into rides values ('28','14','2020-03-24','1h23','3','7','4',20,'1');
insert into rides values ('29','19','2020-04-06','7h41','3','6','2',15,'2');
insert into rides values ('30','6','2020-01-19','3h42','4','7','2',15,'2');
insert into rides values ('31','12','2020-03-19','22h37','5','6','1',5,'2');
insert into rides values ('32','18','2020-03-24','11h55','5','3','2',10,'1');
insert into rides values ('33','20','2020-01-18','23h18','7','4','3',15,'2');
insert into rides values ('34','20','2020-04-17','7h54','7','2','3',25,'3');
insert into rides values ('35','24','2020-01-24','21h42','3','1','2',10,'3');
insert into rides values ('36','3','2020-01-27','9h37','7','4','1',15,'2');
insert into rides values ('37','17','2020-04-05','9h37','6','7','2',5,'2');
insert into rides values ('38','4','2020-04-10','13h45','6','7','2',5,'2');
insert into rides values ('39','12','2020-02-04','19h47','1','3','1',10,'2');
insert into rides values ('40','4','2020-04-19','3h14','6','4','2',10,'1');
insert into rides values ('41','25','2020-04-16','2h54','4','5','4',5,'1');
insert into rides values ('42','24','2020-01-04','11h21','4','1','4',15,'3');
insert into rides values ('43','14','2020-04-19','2h45','1','5','2',20,'1');
insert into rides values ('44','5','2020-04-08','20h23','2','3','3',5,'2');
insert into rides values ('45','23','2020-01-13','2h34','4','6','2',10,'2');
insert into rides values ('46','14','2020-02-17','5h15','2','5','4',15,'1');
insert into rides values ('47','8','2020-05-20','6h26','2','1','1',5,'3');
insert into rides values ('48','8','2020-05-29','3h34','6','1','3',25,'3');
insert into rides values ('49','14','2020-01-09','4h13','1','2','1',5,'1');
insert into rides values ('50','5','2020-01-31','20h48','5','6','4',5,'2');
insert into rides values ('51','16','2020-02-14','21h22','1','2','2',5,'1');
insert into rides values ('52','26','2020-04-26','19h38','7','5','4',10,'2');
insert into rides values ('53','17','2020-02-04','19h37','1','4','3',15,'2');
insert into rides values ('54','25','2020-05-27','7h15','6','7','2',5,'3');
insert into rides values ('55','9','2020-02-07','23h35','3','4','3',5,'2');
insert into rides values ('56','7','2020-02-10','5h21','4','2','1',10,'3');
insert into rides values ('57','15','2020-05-20','21h35','1','5','4',20,'3');
insert into rides values ('58','5','2020-02-28','3h35','7','5','1',10,'3');
insert into rides values ('59','7','2020-03-25','6h47','4','7','3',15,'2');
insert into rides values ('60','2','2020-02-27','7h41','7','6','1',5,'2');
insert into rides values ('61','1','2020-01-12','21h15','6','3','3',15,'1');
insert into rides values ('62','1','2020-03-20','13h45','5','3','2',10,'2');
insert into rides values ('63','3','2020-03-11','20h18','2','3','4',5,'2');
insert into rides values ('64','15','2020-02-23','4h37','7','6','3',5,'2');
insert into rides values ('65','5','2020-04-23','9h25','4','5','3',5,'1');
insert into rides values ('66','17','2020-05-03','14h43','3','4','4',5,'3');
insert into rides values ('67','4','2020-05-15','21h32','3','1','1',10,'3');
insert into rides values ('68','1','2020-03-22','8h33','3','5','3',10,'3');
insert into rides values ('69','16','2020-02-09','22h26','3','4','3',5,'1');
insert into rides values ('70','23','2020-05-16','9h58','1','4','1',15,'2');
insert into rides values ('71','13','2020-01-10','8h27','7','5','1',10,'2');
insert into rides values ('72','2','2020-01-18','10h47','5','4','2',5,'1');
insert into rides values ('73','21','2020-01-22','2h17','5','3','2',10,'1');
insert into rides values ('74','9','2020-01-05','8h23','3','7','1',20,'2');
insert into rides values ('75','16','2020-01-17','6h16','3','1','2',10,'2');
insert into rides values ('76','24','2020-05-15','16h56','4','6','2',10,'1');
insert into rides values ('77','5','2020-05-17','13h31','1','6','2',25,'1');
insert into rides values ('78','26','2020-01-28','10h42','7','6','4',5,'2');
insert into rides values ('79','21','2020-01-01','7h32','5','4','1',5,'2');
insert into rides values ('80','8','2020-03-16','13h31','3','1','3',10,'2');
insert into rides values ('81','3','2020-02-10','7h58','6','3','3',15,'1');
insert into rides values ('82','13','2020-04-14','2h17','3','2','3',5,'2');
insert into rides values ('83','22','2020-01-10','12h38','6','5','1',5,'1');
insert into rides values ('84','9','2020-02-11','16h42','3','6','4',15,'1');
insert into rides values ('85','21','2020-04-02','14h13','7','6','3',5,'1');
insert into rides values ('86','19','2020-05-13','13h18','6','2','4',20,'2');
insert into rides values ('87','12','2020-05-01','18h57','2','1','3',5,'2');
insert into rides values ('88','20','2020-01-24','19h44','6','1','1',25,'2');
insert into rides values ('89','21','2020-03-07','7h32','2','6','2',20,'3');
insert into rides values ('90','9','2020-02-15','21h38','2','5','4',15,'2');
insert into rides values ('91','10','2020-05-03','3h53','2','7','3',25,'2');
insert into rides values ('92','9','2020-05-26','17h36','6','7','4',5,'3');
insert into rides values ('93','4','2020-04-10','11h12','3','7','2',20,'2');
insert into rides values ('94','19','2020-01-20','13h12','6','4','3',10,'1');
insert into rides values ('95','6','2020-05-07','22h55','2','7','4',25,'2');
insert into rides values ('96','10','2020-04-02','11h25','3','2','4',5,'2');
insert into rides values ('97','14','2020-04-19','17h44','4','6','1',10,'3');
insert into rides values ('98','7','2020-01-01','2h36','7','3','3',20,'2');
insert into rides values ('99','3','2020-02-12','2h17','6','5','2',5,'2');
insert into rides values ('100','11','2020-01-23','22h33','4','5','4',5,'1');
insert into rides values ('101','11','2020-03-26','6h46','2','4','1',10,'3');
insert into rides values ('102','7','2020-03-05','16h57','3','6','2',15,'2');
insert into rides values ('103','7','2020-05-05','14h37','6','7','2',5,'1');
insert into rides values ('104','15','2020-02-04','14h12','5','3','3',10,'2');
insert into rides values ('105','15','2020-01-16','12h32','4','5','4',5,'1');
insert into rides values ('106','5','2020-03-04','19h46','5','4','3',5,'1');
insert into rides values ('107','20','2020-01-25','15h57','3','4','2',5,'2');
insert into rides values ('108','23','2020-01-15','1h38','4','5','4',5,'3');
insert into rides values ('109','7','2020-03-01','13h47','5','3','4',10,'1');
insert into rides values ('110','7','2020-02-28','17h37','3','1','2',10,'1');
insert into rides values ('111','4','2020-03-31','1h37','3','4','2',5,'3');
insert into rides values ('112','12','2020-05-11','19h51','5','2','2',15,'1');
insert into rides values ('113','13','2020-04-30','16h36','1','3','3',10,'1');
insert into rides values ('114','8','2020-02-06','12h48','2','7','4',25,'2');
insert into rides values ('115','10','2020-04-14','17h31','2','5','1',15,'1');
insert into rides values ('116','9','2020-04-29','23h51','3','1','4',10,'3');
insert into rides values ('117','9','2020-03-17','8h12','4','5','4',5,'2');
insert into rides values ('118','24','2020-04-01','2h46','1','7','4',30,'3');
insert into rides values ('119','23','2020-01-14','17h36','3','6','4',15,'3');
insert into rides values ('120','20','2020-02-03','15h25','6','1','2',25,'3');
insert into rides values ('121','23','2020-04-28','9h37','4','3','1',5,'3');
insert into rides values ('122','19','2020-01-03','23h15','3','1','3',10,'3');
insert into rides values ('123','14','2020-02-11','21h33','6','5','3',5,'3');
insert into rides values ('124','24','2020-02-08','9h17','1','6','1',25,'1');
insert into rides values ('125','9','2020-04-12','14h18','6','7','3',5,'2');
insert into rides values ('126','3','2020-02-17','21h11','2','7','2',25,'1');
insert into rides values ('127','9','2020-03-21','17h54','6','7','3',5,'3');
insert into rides values ('128','18','2020-05-09','4h44','1','5','1',20,'1');
insert into rides values ('129','15','2020-05-24','15h15','4','3','1',5,'1');
insert into rides values ('130','24','2020-03-17','2h18','3','2','4',5,'3');
insert into rides values ('131','13','2020-02-04','10h24','3','5','2',10,'1');
insert into rides values ('132','12','2020-03-20','20h16','4','7','1',15,'3');
insert into rides values ('133','16','2020-01-28','22h48','2','1','3',5,'1');
insert into rides values ('134','21','2020-01-05','9h57','4','7','4',15,'2');
insert into rides values ('135','3','2020-02-27','20h41','4','2','2',10,'2');
insert into rides values ('136','19','2020-03-21','23h13','2','7','3',25,'3');
insert into rides values ('137','21','2020-05-20','7h35','6','2','1',20,'3');
insert into rides values ('138','19','2020-02-19','10h44','7','4','3',15,'1');
insert into rides values ('139','15','2020-01-02','14h23','4','5','1',5,'1');
insert into rides values ('140','13','2020-03-08','20h21','7','5','3',10,'3');
insert into rides values ('141','2','2020-01-10','4h41','1','6','3',25,'3');
insert into rides values ('142','16','2020-04-20','8h56','7','5','1',10,'3');
insert into rides values ('143','20','2020-02-02','20h28','3','1','4',10,'2');
insert into rides values ('144','3','2020-03-25','20h37','3','4','1',5,'3');
insert into rides values ('145','1','2020-03-05','12h42','3','1','1',10,'1');
insert into rides values ('146','8','2020-05-21','17h48','3','6','4',15,'1');
insert into rides values ('147','16','2020-01-07','5h24','3','7','3',20,'3');
insert into rides values ('148','16','2020-05-11','5h48','7','4','2',15,'2');
insert into rides values ('149','22','2020-01-10','21h58','3','4','2',5,'3');
insert into rides values ('150','9','2020-03-19','6h36','2','3','4',5,'2');
insert into rides values ('151','6','2020-05-22','21h56','6','7','2',5,'1');
insert into rides values ('152','18','2020-01-15','20h32','6','7','3',5,'1');
insert into rides values ('153','17','2020-02-13','9h18','5','4','2',5,'3');
insert into rides values ('154','12','2020-04-25','10h12','7','4','3',15,'2');
insert into rides values ('155','23','2020-02-21','18h11','5','6','1',5,'3');
insert into rides values ('156','24','2020-02-05','5h46','4','5','2',5,'1');
insert into rides values ('157','23','2020-03-04','8h47','2','1','4',5,'1');
insert into rides values ('158','4','2020-05-18','18h13','2','3','1',5,'3');
insert into rides values ('159','22','2020-04-03','22h45','2','1','2',5,'3');
insert into rides values ('160','23','2020-04-12','11h17','2','1','4',5,'2');
insert into rides values ('161','25','2020-03-02','13h47','5','4','3',5,'3');
insert into rides values ('162','10','2020-02-09','6h38','4','5','1',5,'1');
insert into rides values ('163','20','2020-04-11','7h36','1','7','2',30,'3');
insert into rides values ('164','23','2020-05-20','12h38','3','4','3',5,'3');
insert into rides values ('165','6','2020-01-23','20h25','6','2','2',20,'3');
insert into rides values ('166','14','2020-04-04','14h56','2','7','4',25,'2');
insert into rides values ('167','11','2020-03-25','6h43','4','5','2',5,'3');
insert into rides values ('168','5','2020-03-19','16h43','3','1','4',10,'3');
insert into rides values ('169','12','2020-04-22','4h11','3','2','1',5,'2');
insert into rides values ('170','4','2020-03-09','1h14','2','6','1',20,'1');
insert into rides values ('171','23','2020-01-28','5h37','3','1','2',10,'2');
insert into rides values ('172','20','2020-03-02','12h15','4','6','4',10,'3');
insert into rides values ('173','18','2020-02-20','10h16','7','3','1',20,'2');
insert into rides values ('174','21','2020-03-20','17h18','4','3','3',5,'3');
insert into rides values ('175','5','2020-05-26','9h56','4','5','2',5,'1');
insert into rides values ('176','6','2020-04-23','20h25','3','2','3',5,'2');
insert into rides values ('177','3','2020-02-11','3h28','1','4','1',15,'1');
insert into rides values ('178','16','2020-01-19','16h35','5','2','2',15,'1');
insert into rides values ('179','10','2020-01-19','3h22','5','1','2',20,'3');
insert into rides values ('180','2','2020-04-02','11h51','3','2','2',5,'3');
insert into rides values ('181','3','2020-05-25','10h52','2','5','2',15,'1');
insert into rides values ('182','6','2020-02-29','8h14','1','4','2',15,'2');
insert into rides values ('183','15','2020-05-26','14h36','7','2','2',25,'2');
insert into rides values ('184','14','2020-05-15','5h41','1','7','1',30,'3');
insert into rides values ('185','11','2020-02-09','11h36','1','7','2',30,'2');
insert into rides values ('186','20','2020-02-08','23h45','7','6','2',5,'2');
insert into rides values ('187','6','2020-03-13','13h32','4','7','4',15,'2');
insert into rides values ('188','25','2020-05-15','5h53','2','5','4',15,'3');
insert into rides values ('189','21','2020-01-23','18h11','2','1','1',5,'2');
insert into rides values ('190','24','2020-02-21','20h42','7','6','4',5,'2');
insert into rides values ('191','8','2020-02-26','13h33','5','7','2',10,'2');
insert into rides values ('192','26','2020-05-29','1h58','2','4','2',10,'1');
insert into rides values ('193','1','2020-02-18','21h27','5','1','1',20,'2');
insert into rides values ('194','13','2020-01-19','9h45','1','5','4',20,'2');
insert into rides values ('195','13','2020-03-24','11h22','2','7','4',25,'3');
insert into rides values ('196','26','2020-05-02','22h18','7','6','4',5,'2');
insert into rides values ('197','10','2020-02-03','2h45','5','4','3',5,'3');
insert into rides values ('198','2','2020-03-12','20h31','2','6','1',20,'2');
insert into rides values ('199','6','2020-02-04','21h53','1','4','3',15,'2');
insert into rides values ('200','9','2020-02-25','1h55','4','5','3',5,'1');
insert into rides values ('201','22','2020-04-10','11h27','6','2','2',20,'1');
insert into rides values ('202','9','2020-03-10','13h37','5','6','4',5,'3');
insert into rides values ('203','9','2020-02-15','4h42','1','3','3',10,'3');
insert into rides values ('204','15','2020-04-18','17h16','7','6','4',5,'2');
insert into rides values ('205','9','2020-01-22','12h34','4','7','1',15,'1');
insert into rides values ('206','24','2020-04-14','11h32','6','3','2',15,'3');
insert into rides values ('207','16','2020-03-25','14h54','4','5','2',5,'2');
insert into rides values ('208','15','2020-04-07','17h28','5','2','1',15,'1');
insert into rides values ('209','1','2020-04-08','22h27','2','3','2',5,'1');
insert into rides values ('210','2','2020-04-08','15h15','4','1','4',15,'1');
insert into rides values ('211','13','2020-05-27','22h27','1','2','4',5,'3');
insert into rides values ('212','24','2020-03-01','8h36','7','3','2',20,'1');
insert into rides values ('213','21','2020-03-06','19h14','4','1','4',15,'2');
insert into rides values ('214','17','2020-03-16','21h42','4','7','2',15,'2');
insert into rides values ('215','8','2020-05-10','18h57','2','1','2',5,'3');
insert into rides values ('216','13','2020-05-29','23h11','5','2','3',15,'2');
insert into rides values ('217','13','2020-05-21','21h55','5','3','3',10,'1');
insert into rides values ('218','14','2020-04-22','13h46','4','7','4',15,'3');
insert into rides values ('219','13','2020-02-04','7h52','6','2','1',20,'2');
insert into rides values ('220','10','2020-04-27','20h54','3','6','3',15,'2');
insert into rides values ('221','7','2020-05-17','22h12','1','4','2',15,'1');
insert into rides values ('222','16','2020-01-29','23h58','4','5','2',5,'3');
insert into rides values ('223','15','2020-01-17','6h41','1','7','3',30,'1');
insert into rides values ('224','17','2020-01-10','6h33','6','4','2',10,'1');
insert into rides values ('225','3','2020-02-17','20h32','5','4','3',5,'3');
insert into rides values ('226','14','2020-04-17','2h54','2','7','1',25,'2');
insert into rides values ('227','8','2020-02-19','15h52','3','2','4',5,'1');
insert into rides values ('228','21','2020-05-03','15h18','4','5','3',5,'3');
insert into rides values ('229','12','2020-05-28','4h45','4','3','4',5,'2');
insert into rides values ('230','5','2020-05-05','7h16','7','2','2',25,'2');
insert into rides values ('231','21','2020-01-31','21h47','4','6','4',10,'3');
insert into rides values ('232','17','2020-01-03','1h18','5','6','1',5,'1');
insert into rides values ('233','1','2020-04-06','14h25','5','3','2',10,'1');
insert into rides values ('234','19','2020-04-10','23h54','7','2','1',25,'3');
insert into rides values ('235','24','2020-02-14','10h53','3','2','2',5,'1');
insert into rides values ('236','12','2020-02-24','5h21','4','1','1',15,'3');
insert into rides values ('237','11','2020-02-08','2h53','7','5','2',10,'1');
insert into rides values ('238','20','2020-03-04','6h56','6','2','4',20,'3');
insert into rides values ('239','7','2020-04-02','20h17','3','2','2',5,'1');
insert into rides values ('240','22','2020-04-07','20h15','4','6','1',10,'3');
insert into rides values ('241','15','2020-02-29','17h58','6','4','2',10,'1');
insert into rides values ('242','22','2020-03-31','21h58','6','4','4',10,'1');
insert into rides values ('243','15','2020-02-03','16h26','2','1','2',5,'3');
insert into rides values ('244','12','2020-05-11','20h44','7','6','3',5,'2');
insert into rides values ('245','19','2020-04-11','12h47','3','1','3',10,'3');
insert into rides values ('246','17','2020-05-28','4h24','1','7','4',30,'3');
insert into rides values ('247','10','2020-01-30','12h18','6','1','1',25,'2');
insert into rides values ('248','7','2020-01-28','6h52','2','3','3',5,'1');
insert into rides values ('249','23','2020-03-15','1h12','1','3','2',10,'1');
insert into rides values ('250','8','2020-02-25','20h48','2','6','4',20,'1');
insert into rides values ('251','26','2020-04-07','9h44','3','4','3',5,'3');
insert into rides values ('252','13','2020-02-15','4h24','5','2','2',15,'2');
insert into rides values ('253','10','2020-01-14','1h52','1','5','3',20,'3');
insert into rides values ('254','14','2020-01-04','2h41','3','4','1',5,'1');
insert into rides values ('255','4','2020-01-11','23h58','5','3','2',10,'2');
insert into rides values ('256','7','2020-04-20','16h32','5','6','1',5,'1');
insert into rides values ('257','13','2020-02-03','23h54','2','3','3',5,'3');
insert into rides values ('258','21','2020-04-26','5h57','7','5','3',10,'3');
insert into rides values ('259','7','2020-05-06','17h52','5','6','3',5,'1');
insert into rides values ('260','16','2020-05-09','8h54','7','6','3',5,'3');
insert into rides values ('261','9','2020-05-23','13h31','6','1','4',25,'1');
insert into rides values ('262','1','2020-04-22','20h51','7','6','2',5,'1');
insert into rides values ('263','14','2020-05-09','23h34','5','1','1',20,'2');
insert into rides values ('264','21','2020-03-19','12h32','1','3','4',10,'2');
insert into rides values ('265','21','2020-01-28','22h54','2','7','4',25,'3');
insert into rides values ('266','19','2020-02-25','10h45','2','6','3',20,'3');
insert into rides values ('267','11','2020-03-02','14h23','5','6','1',5,'1');
insert into rides values ('268','15','2020-05-12','4h41','7','2','2',25,'2');
insert into rides values ('269','24','2020-04-03','9h31','7','5','2',10,'1');
insert into rides values ('270','20','2020-03-15','14h11','7','2','2',25,'1');
insert into rides values ('271','13','2020-05-19','9h18','2','5','4',15,'3');
insert into rides values ('272','13','2020-03-15','3h25','6','7','1',5,'3');
insert into rides values ('273','3','2020-03-12','19h12','5','6','1',5,'2');
insert into rides values ('274','16','2020-05-24','21h36','2','5','2',15,'3');
insert into rides values ('275','12','2020-02-24','7h37','4','5','2',5,'1');
insert into rides values ('276','11','2020-05-13','5h12','1','3','3',10,'3');
insert into rides values ('277','25','2020-01-30','18h45','3','5','1',10,'1');
insert into rides values ('278','10','2020-01-15','8h34','2','3','4',5,'1');
insert into rides values ('279','21','2020-03-19','15h18','1','2','4',5,'2');
insert into rides values ('280','10','2020-01-27','10h42','2','1','3',5,'2');
insert into rides values ('281','8','2020-01-12','2h24','5','2','2',15,'3');
insert into rides values ('282','4','2020-02-10','21h31','3','6','4',15,'1');
insert into rides values ('283','25','2020-05-27','23h47','5','7','2',10,'1');
insert into rides values ('284','26','2020-01-12','11h15','6','3','1',15,'3');
insert into rides values ('285','1','2020-03-03','19h27','1','7','1',30,'2');
insert into rides values ('286','6','2020-02-13','3h18','1','7','4',30,'1');
insert into rides values ('287','1','2020-01-21','20h34','3','4','3',5,'2');
insert into rides values ('288','7','2020-05-30','10h44','3','5','3',10,'2');
insert into rides values ('289','24','2020-04-28','16h34','6','3','4',15,'3');
insert into rides values ('290','4','2020-05-03','19h42','4','3','2',5,'2');
insert into rides values ('291','12','2020-01-05','8h31','6','2','3',20,'2');
insert into rides values ('292','3','2020-05-05','12h15','7','1','2',30,'1');
insert into rides values ('293','12','2020-05-25','17h47','3','5','1',10,'2');
insert into rides values ('294','10','2020-03-10','17h26','3','2','1',5,'1');
insert into rides values ('295','23','2020-04-29','19h47','3','4','3',5,'1');
insert into rides values ('296','22','2020-04-16','9h46','3','6','1',15,'1');
insert into rides values ('297','3','2020-05-29','5h14','4','3','3',5,'3');
insert into rides values ('298','9','2020-04-26','23h21','1','6','2',25,'1');
insert into rides values ('299','18','2020-04-28','18h53','6','4','4',10,'2');
insert into rides values ('300','23','2020-03-09','14h55','6','5','3',5,'2');
insert into rides values ('301','20','2020-05-02','2h46','2','5','1',15,'1');
insert into rides values ('302','10','2020-04-16','14h18','7','4','2',15,'3');
insert into rides values ('303','23','2020-05-22','9h15','4','7','1',15,'1');
insert into rides values ('304','15','2020-02-13','10h42','4','7','1',15,'1');
insert into rides values ('305','18','2020-03-31','11h37','7','3','1',20,'3');
insert into rides values ('306','24','2020-03-22','4h51','3','6','2',15,'2');
insert into rides values ('307','25','2020-03-02','6h56','2','6','1',20,'2');
insert into rides values ('308','18','2020-04-14','11h58','5','4','2',5,'3');
insert into rides values ('309','10','2020-03-26','9h33','7','4','2',15,'2');
insert into rides values ('310','18','2020-05-04','8h28','7','1','3',30,'2');
insert into rides values ('311','4','2020-04-27','4h51','4','5','3',5,'2');
insert into rides values ('312','24','2020-05-10','15h16','2','3','3',5,'3');
insert into rides values ('313','2','2020-01-13','4h24','7','3','2',20,'3');
insert into rides values ('314','2','2020-03-21','3h45','5','6','1',5,'2');
insert into rides values ('315','10','2020-02-01','17h44','6','2','4',20,'2');
insert into rides values ('316','11','2020-03-24','11h25','5','2','2',15,'1');
insert into rides values ('317','20','2020-05-20','14h31','6','4','4',10,'2');
insert into rides values ('318','17','2020-03-04','3h38','6','7','2',5,'3');
insert into rides values ('319','23','2020-03-01','15h12','3','4','1',5,'2');
insert into rides values ('320','17','2020-02-05','11h52','7','3','2',20,'1');
insert into rides values ('321','4','2020-04-19','14h17','7','1','2',30,'3');
insert into rides values ('322','9','2020-01-15','7h54','1','2','4',5,'1');
insert into rides values ('323','15','2020-04-13','10h47','4','7','2',15,'1');
insert into rides values ('324','17','2020-04-12','12h16','7','6','3',5,'1');
insert into rides values ('325','5','2020-04-24','16h53','7','6','2',5,'1');
insert into rides values ('326','2','2020-01-10','13h12','7','6','4',5,'3');
insert into rides values ('327','17','2020-05-09','3h13','2','1','2',5,'3');
insert into rides values ('328','18','2020-02-24','13h17','4','5','1',5,'2');
insert into rides values ('329','13','2020-02-29','2h38','3','6','4',15,'3');
insert into rides values ('330','10','2020-05-06','3h42','2','3','4',5,'2');
insert into rides values ('331','25','2020-01-17','8h43','6','5','2',5,'1');
insert into rides values ('332','6','2020-04-26','8h16','7','2','4',25,'1');
insert into rides values ('333','12','2020-04-18','15h33','2','1','1',5,'1');
insert into rides values ('334','2','2020-03-08','11h18','2','5','4',15,'2');
insert into rides values ('335','20','2020-03-07','8h47','5','4','4',5,'1');
insert into rides values ('336','13','2020-04-19','12h36','2','4','4',10,'3');
insert into rides values ('337','10','2020-01-29','9h16','4','5','4',5,'3');
insert into rides values ('338','25','2020-02-22','20h43','5','7','3',10,'2');
insert into rides values ('339','12','2020-03-05','19h55','5','7','2',10,'1');
insert into rides values ('340','17','2020-04-14','19h27','6','5','1',5,'1');
insert into rides values ('341','11','2020-02-16','23h33','5','7','4',10,'1');
insert into rides values ('342','15','2020-04-16','1h34','7','4','1',15,'1');
insert into rides values ('343','1','2020-01-03','10h37','2','4','4',10,'1');
insert into rides values ('344','14','2020-03-06','3h33','4','2','4',10,'3');
insert into rides values ('345','6','2020-02-05','22h42','5','4','1',5,'1');
insert into rides values ('346','4','2020-01-06','7h13','7','3','3',20,'3');
insert into rides values ('347','12','2020-01-11','21h18','6','3','2',15,'3');
insert into rides values ('348','5','2020-01-14','14h25','1','2','1',5,'1');
insert into rides values ('349','21','2020-04-26','9h18','6','2','3',20,'1');
insert into rides values ('350','10','2020-02-10','6h26','7','6','3',5,'1');
insert into rides values ('351','12','2020-01-05','3h41','7','6','1',5,'3');
insert into rides values ('352','4','2020-01-16','13h48','6','4','2',10,'2');
insert into rides values ('353','21','2020-02-28','5h37','5','6','1',5,'3');
insert into rides values ('354','8','2020-03-28','11h26','7','4','3',15,'2');
insert into rides values ('355','8','2020-03-03','3h28','4','2','1',10,'2');
insert into rides values ('356','7','2020-04-23','10h46','5','1','3',20,'2');
insert into rides values ('357','19','2020-03-28','9h18','2','7','1',25,'1');
insert into rides values ('358','4','2020-05-17','18h14','1','2','4',5,'3');
insert into rides values ('359','13','2020-03-17','18h46','7','6','4',5,'1');
insert into rides values ('360','26','2020-05-29','5h17','3','1','4',10,'1');
insert into rides values ('361','6','2020-02-14','12h25','7','1','1',30,'1');
insert into rides values ('362','4','2020-02-28','12h15','1','2','2',5,'3');
insert into rides values ('363','13','2020-03-03','22h47','4','1','3',15,'3');
insert into rides values ('364','1','2020-01-28','10h36','1','7','3',30,'3');
insert into rides values ('365','10','2020-02-08','6h14','3','7','3',20,'1');
insert into rides values ('366','20','2020-01-23','1h56','2','1','4',5,'3');
insert into rides values ('367','12','2020-02-17','4h21','1','2','1',5,'2');
insert into rides values ('368','24','2020-01-03','19h44','2','4','2',10,'1');
insert into rides values ('369','1','2020-02-24','19h14','5','4','2',5,'1');
insert into rides values ('370','24','2020-02-06','16h44','1','7','2',30,'2');
insert into rides values ('371','10','2020-04-11','14h44','1','4','3',15,'1');
insert into rides values ('372','3','2020-05-10','17h52','1','2','4',5,'1');
insert into rides values ('373','26','2020-04-26','20h11','7','1','4',30,'2');
insert into rides values ('374','25','2020-01-14','15h14','3','6','4',15,'2');
insert into rides values ('375','3','2020-02-06','18h43','7','3','2',20,'2');
insert into rides values ('376','14','2020-03-17','2h12','6','7','2',5,'2');
insert into rides values ('377','16','2020-01-09','5h41','5','7','1',10,'3');
insert into rides values ('378','15','2020-02-01','15h38','6','1','1',25,'2');
insert into rides values ('379','13','2020-01-26','6h51','1','2','4',5,'2');
insert into rides values ('380','10','2020-04-19','1h25','2','4','3',10,'2');
insert into rides values ('381','2','2020-02-07','3h52','2','3','4',5,'1');
insert into rides values ('382','4','2020-05-27','15h23','1','2','3',5,'3');
insert into rides values ('383','3','2020-02-16','19h24','7','4','1',15,'1');
insert into rides values ('384','20','2020-05-31','22h11','5','6','3',5,'3');
insert into rides values ('385','15','2020-02-17','10h24','4','1','2',15,'2');
insert into rides values ('386','19','2020-03-11','18h45','4','1','4',15,'1');
insert into rides values ('387','11','2020-05-27','23h26','2','4','2',10,'3');
insert into rides values ('388','21','2020-04-10','23h54','1','6','4',25,'2');
insert into rides values ('389','26','2020-04-25','23h33','5','1','2',20,'2');
insert into rides values ('390','10','2020-02-13','23h25','4','7','2',15,'2');
insert into rides values ('391','3','2020-01-20','17h41','1','6','3',25,'1');
insert into rides values ('392','8','2020-03-31','17h42','4','2','4',10,'3');
insert into rides values ('393','21','2020-04-30','19h54','5','6','3',5,'1');
insert into rides values ('394','19','2020-03-15','18h23','3','4','4',5,'1');
insert into rides values ('395','19','2020-04-14','19h45','3','1','3',10,'1');
insert into rides values ('396','20','2020-01-15','2h37','2','5','3',15,'1');
insert into rides values ('397','9','2020-02-22','14h16','5','3','4',10,'1');
insert into rides values ('398','26','2020-05-04','10h21','3','2','4',5,'3');
insert into rides values ('399','15','2020-01-08','2h54','3','1','2',10,'2');
insert into rides values ('400','5','2020-03-15','21h48','3','4','1',5,'1');
insert into rides values ('401','1','2020-04-13','7h18','1','3','1',10,'2');
insert into rides values ('402','17','2020-03-07','23h43','1','2','1',5,'3');
insert into rides values ('403','15','2020-01-31','12h33','3','2','1',5,'2');
insert into rides values ('404','25','2020-03-24','19h31','5','4','1',5,'2');
insert into rides values ('405','14','2020-04-24','5h27','5','6','2',5,'3');
insert into rides values ('406','10','2020-05-08','5h26','3','2','4',5,'1');
insert into rides values ('407','14','2020-01-30','10h22','5','1','1',20,'1');
insert into rides values ('408','26','2020-01-25','4h34','3','5','4',10,'1');
insert into rides values ('409','23','2020-04-07','2h43','2','7','1',25,'1');
insert into rides values ('410','11','2020-01-25','4h54','3','1','2',10,'3');
insert into rides values ('411','11','2020-04-07','11h17','3','4','3',5,'2');
insert into rides values ('412','12','2020-02-14','12h46','6','4','4',10,'3');
insert into rides values ('413','18','2020-01-01','8h36','3','1','2',10,'1');
insert into rides values ('414','12','2020-02-14','3h45','3','5','4',10,'2');
insert into rides values ('415','19','2020-04-05','2h12','6','1','3',25,'1');
insert into rides values ('416','13','2020-03-02','3h43','2','6','3',20,'3');
insert into rides values ('417','14','2020-02-09','18h35','1','6','1',25,'3');
insert into rides values ('418','20','2020-05-09','17h57','3','6','3',15,'1');
insert into rides values ('419','16','2020-02-08','1h32','5','6','1',5,'2');
insert into rides values ('420','13','2020-03-18','1h37','7','4','4',15,'1');
insert into rides values ('421','2','2020-05-30','8h41','6','7','4',5,'1');
insert into rides values ('422','11','2020-02-04','5h55','5','2','1',15,'1');
insert into rides values ('423','1','2020-02-06','4h21','2','7','1',25,'2');
insert into rides values ('424','1','2020-04-15','4h47','2','3','3',5,'1');
insert into rides values ('425','23','2020-03-19','2h13','1','2','3',5,'1');
insert into rides values ('426','21','2020-03-25','12h45','4','3','3',5,'3');
insert into rides values ('427','5','2020-02-17','12h51','4','1','1',15,'2');
insert into rides values ('428','13','2020-02-08','2h26','2','3','2',5,'1');
insert into rides values ('429','12','2020-02-10','12h25','7','2','1',25,'1');
insert into rides values ('430','11','2020-05-13','20h57','5','6','2',5,'2');
insert into rides values ('431','19','2020-04-15','17h52','7','5','1',10,'2');
insert into rides values ('432','14','2020-02-22','14h15','6','2','1',20,'2');
insert into rides values ('433','6','2020-01-11','5h31','3','4','1',5,'2');
insert into rides values ('434','5','2020-03-14','8h44','3','2','3',5,'1');
insert into rides values ('435','3','2020-05-03','8h47','4','7','1',15,'3');
insert into rides values ('436','6','2020-04-27','11h51','4','5','2',5,'2');
insert into rides values ('437','25','2020-01-09','22h56','7','3','2',20,'1');
insert into rides values ('438','12','2020-01-29','6h41','7','5','3',10,'3');
insert into rides values ('439','20','2020-03-25','22h11','2','1','1',5,'2');
insert into rides values ('440','13','2020-03-25','7h43','5','7','2',10,'1');
insert into rides values ('441','17','2020-01-30','17h41','1','5','3',20,'2');
insert into rides values ('442','23','2020-05-08','21h48','1','5','2',20,'1');
insert into rides values ('443','2','2020-01-01','2h51','7','3','1',20,'3');
insert into rides values ('444','17','2020-04-29','20h53','2','5','4',15,'1');
insert into rides values ('445','3','2020-03-14','15h57','2','4','1',10,'3');
insert into rides values ('446','4','2020-03-03','15h28','2','6','3',20,'3');
insert into rides values ('447','8','2020-04-01','9h33','7','4','2',15,'1');
insert into rides values ('448','22','2020-02-16','22h32','3','5','1',10,'1');
insert into rides values ('449','20','2020-03-15','11h36','2','6','2',20,'3');
insert into rides values ('450','15','2020-05-27','8h32','3','4','1',5,'1');
insert into rides values ('451','22','2020-01-06','8h16','1','7','1',30,'3');
insert into rides values ('452','26','2020-05-20','1h53','7','4','2',15,'3');
insert into rides values ('453','7','2020-04-07','16h23','6','7','2',5,'2');
insert into rides values ('454','26','2020-02-22','18h33','2','6','3',20,'2');
insert into rides values ('455','11','2020-02-06','6h21','7','3','1',20,'1');
insert into rides values ('456','3','2020-02-15','13h32','5','4','3',5,'1');
insert into rides values ('457','22','2020-04-10','9h44','6','7','4',5,'1');
insert into rides values ('458','1','2020-04-28','20h18','3','7','3',20,'1');
insert into rides values ('459','24','2020-05-25','16h15','7','1','2',30,'2');
insert into rides values ('460','17','2020-04-21','19h22','4','2','4',10,'1');
insert into rides values ('461','19','2020-05-03','13h28','2','4','4',10,'3');
insert into rides values ('462','24','2020-01-20','6h43','7','3','4',20,'3');
insert into rides values ('463','5','2020-04-12','18h55','3','7','3',20,'3');
insert into rides values ('464','24','2020-01-06','21h25','7','6','1',5,'1');
insert into rides values ('465','9','2020-01-19','17h37','3','7','1',20,'2');
insert into rides values ('466','13','2020-03-06','19h43','6','1','4',25,'2');
insert into rides values ('467','25','2020-02-21','11h17','2','1','4',5,'3');
insert into rides values ('468','10','2020-05-22','14h13','7','2','2',25,'3');
insert into rides values ('469','4','2020-03-26','14h31','7','4','4',15,'3');
insert into rides values ('470','19','2020-04-01','9h25','5','6','2',5,'3');
insert into rides values ('471','24','2020-05-22','16h14','7','1','4',30,'1');
insert into rides values ('472','9','2020-04-23','19h18','7','6','1',5,'1');
insert into rides values ('473','20','2020-01-19','8h31','2','6','2',20,'3');
insert into rides values ('474','15','2020-04-16','22h43','5','1','4',20,'1');
insert into rides values ('475','10','2020-02-08','5h26','1','3','1',10,'2');
insert into rides values ('476','18','2020-01-19','9h24','7','6','3',5,'1');
insert into rides values ('477','3','2020-01-09','12h42','4','5','1',5,'3');
insert into rides values ('478','21','2020-04-05','20h55','2','4','2',10,'1');
insert into rides values ('479','22','2020-02-16','14h48','2','3','1',5,'1');
insert into rides values ('480','21','2020-05-10','2h43','5','3','1',10,'2');
insert into rides values ('481','22','2020-04-11','20h24','6','5','4',5,'3');
insert into rides values ('482','24','2020-01-27','19h46','3','4','2',5,'1');
insert into rides values ('483','15','2020-04-06','11h38','4','1','2',15,'3');
insert into rides values ('484','4','2020-01-05','3h27','6','3','1',15,'1');
insert into rides values ('485','14','2020-02-21','5h43','5','6','1',5,'1');
insert into rides values ('486','12','2020-04-09','1h58','5','2','3',15,'3');
insert into rides values ('487','6','2020-02-19','12h23','4','5','2',5,'1');
insert into rides values ('488','16','2020-04-04','5h13','2','4','1',10,'2');
insert into rides values ('489','3','2020-02-09','6h55','6','7','2',5,'2');
insert into rides values ('490','22','2020-01-03','3h56','7','6','1',5,'1');
insert into rides values ('491','26','2020-02-07','9h42','6','5','2',5,'2');
insert into rides values ('492','22','2020-05-03','17h27','5','4','3',5,'2');
insert into rides values ('493','8','2020-01-09','14h42','1','7','1',30,'2');
insert into rides values ('494','9','2020-02-26','9h13','4','7','1',15,'2');
insert into rides values ('495','5','2020-02-20','2h35','2','3','1',5,'3');
insert into rides values ('496','11','2020-01-08','11h27','3','7','3',20,'3');
insert into rides values ('497','23','2020-04-15','23h58','7','5','2',10,'2');
insert into rides values ('498','7','2020-04-30','11h58','6','3','3',15,'3');
insert into rides values ('499','3','2020-03-01','4h42','7','3','3',20,'3');
insert into rides values ('500','6','2020-02-06','21h14','5','4','3',5,'3');

insert into request_status values ('1','Accepted');
insert into request_status values ('2','Pending');
insert into request_status values ('3','Refused');

insert into requests values ('1','116','mem-7196858','1');
insert into requests values ('2','182','mem-4003334','1');
insert into requests values ('3','143','mem-7287474','1');
insert into requests values ('4','142','mem-3418649','1');
insert into requests values ('5','191','mem-5188915','1');
insert into requests values ('6','21','mem-5830958','1');
insert into requests values ('7','58','mem-5503483','2');
insert into requests values ('8','377','mem-9715334','1');
insert into requests values ('9','439','mem-3967691','2');
insert into requests values ('10','239','mem-3804070','2');
insert into requests values ('11','202','mem-1201687','2');
insert into requests values ('12','465','mem-3333107','1');
insert into requests values ('13','14','mem-1243151','1');
insert into requests values ('14','369','mem-2311238','2');
insert into requests values ('15','130','mem-2426507','2');
insert into requests values ('16','449','mem-5911536','1');
insert into requests values ('17','50','mem-5830958','2');
insert into requests values ('18','352','mem-5992513','2');
insert into requests values ('19','11','mem-7565092','1');
insert into requests values ('20','108','mem-1703083','2');
insert into requests values ('21','423','mem-3725927','1');
insert into requests values ('22','488','mem-5089917','1');
insert into requests values ('23','219','mem-6510063','1');
insert into requests values ('24','304','mem-1446885','1');
insert into requests values ('25','50','mem-1599896','1');
insert into requests values ('26','153','mem-2758152','1');
insert into requests values ('27','385','mem-3255089','2');
insert into requests values ('28','61','mem-1570790','1');
insert into requests values ('29','245','mem-5055691','1');
insert into requests values ('30','269','mem-2509055','2');
insert into requests values ('31','377','mem-8185304','1');
insert into requests values ('32','34','mem-8550994','2');
insert into requests values ('33','238','mem-5992513','1');
insert into requests values ('34','364','mem-6486914','1');
insert into requests values ('35','73','mem-5670820','1');
insert into requests values ('36','47','mem-8902951','1');
insert into requests values ('37','270','mem-6546690','1');
insert into requests values ('38','389','mem-9767683','1');
insert into requests values ('39','390','mem-2758152','2');
insert into requests values ('40','491','mem-8902951','1');
insert into requests values ('41','214','mem-5055691','2');
insert into requests values ('42','380','mem-1353047','1');
insert into requests values ('43','498','mem-7539417','2');
insert into requests values ('44','211','mem-4948829','1');
insert into requests values ('45','31','mem-2311238','2');
insert into requests values ('46','29','mem-1446885','1');
insert into requests values ('47','487','mem-4948829','1');
insert into requests values ('48','454','mem-9767683','1');
insert into requests values ('49','420','mem-5055691','1');
insert into requests values ('50','3','mem-5089917','2');
insert into requests values ('51','280','mem-7781385','1');
insert into requests values ('52','183','mem-8540471','1');
insert into requests values ('53','352','mem-5188915','1');
insert into requests values ('54','189','mem-4903288','1');
insert into requests values ('55','63','mem-6510799','2');
insert into requests values ('56','331','mem-6510799','1');
insert into requests values ('57','341','mem-3798002','1');
insert into requests values ('58','315','mem-5284809','2');
insert into requests values ('59','389','mem-9715334','2');
insert into requests values ('60','202','mem-8297494','1');
insert into requests values ('61','342','mem-4097319','1');
insert into requests values ('62','416','mem-1243151','2');
insert into requests values ('63','430','mem-9611221','1');
insert into requests values ('64','195','mem-1612906','2');
insert into requests values ('65','354','mem-6274663','1');
insert into requests values ('66','89','mem-8802778','1');
insert into requests values ('67','154','mem-2817067','1');
insert into requests values ('68','385','mem-8274901','1');
insert into requests values ('69','110','mem-9732887','1');
insert into requests values ('70','490','mem-1525114','1');
insert into requests values ('71','230','mem-8550994','1');
insert into requests values ('72','84','mem-3980469','1');
insert into requests values ('73','38','mem-3967691','1');
insert into requests values ('74','154','mem-9715334','1');
insert into requests values ('75','390','mem-7539417','2');
insert into requests values ('76','173','mem-5274509','1');
insert into requests values ('77','61','mem-4796329','2');
insert into requests values ('78','60','mem-1201687','1');
insert into requests values ('79','264','mem-1860416','1');
insert into requests values ('80','133','mem-7442928','2');
insert into requests values ('81','92','mem-5961838','2');
insert into requests values ('82','419','mem-3307468','2');
insert into requests values ('83','203','mem-9629145','2');
insert into requests values ('84','4','mem-7295951','1');
insert into requests values ('85','86','mem-1906036','1');
insert into requests values ('86','446','mem-4599833','2');
insert into requests values ('87','65','mem-5188915','1');
insert into requests values ('88','422','mem-2426507','1');
insert into requests values ('89','172','mem-2758152','1');
insert into requests values ('90','334','mem-9611221','1');
insert into requests values ('91','430','mem-2426507','2');
insert into requests values ('92','134','mem-6250900','1');
insert into requests values ('93','51','mem-9254258','1');
insert into requests values ('94','360','mem-1688422','2');
insert into requests values ('95','401','mem-2221918','1');
insert into requests values ('96','85','mem-6123422','2');
insert into requests values ('97','186','mem-4205665','2');
insert into requests values ('98','458','mem-7781385','2');
insert into requests values ('99','335','mem-3122499','1');
insert into requests values ('100','226','mem-1688422','1');

insert into ratings values ('rat-3222679','mem-3455901','mem-8540471','',4);
insert into ratings values ('rat-7371655','mem-3580873','mem-9767683','would recommend',4);
insert into ratings values ('rat-3877698','mem-7921758','mem-6250900','',5);
insert into ratings values ('rat-1540994','mem-9767683','mem-2525276','',4);
insert into ratings values ('rat-9227352','mem-3725927','mem-9042938','',3);
insert into ratings values ('rat-5532644','mem-9254258','mem-4672564','',5);
insert into ratings values ('rat-1282222','mem-7921758','mem-1451150','',5);
insert into ratings values ('rat-4977131','mem-7318914','mem-3967691','cool!',3);
insert into ratings values ('rat-4978325','mem-7382076','mem-8961756','nice car',3);
insert into ratings values ('rat-4221659','mem-1703083','mem-6510063','',5);
insert into ratings values ('rat-1771386','mem-6704528','mem-8954067','',5);
insert into ratings values ('rat-4523830','mem-5911536','mem-2964127','',3);
insert into ratings values ('rat-8914122','mem-9254258','mem-1525114','cool!',5);
insert into ratings values ('rat-3336653','mem-5089917','mem-9714080','nice car',5);
insert into ratings values ('rat-1514700','mem-6510063','mem-3307468','cool!',4);
insert into ratings values ('rat-7070133','mem-8902951','mem-8460693','slightly dirty, but fine',3);
insert into ratings values ('rat-8849507','mem-7251531','mem-9238906','',5);
insert into ratings values ('rat-5170780','mem-8618305','mem-9428037','would recommend',2);
insert into ratings values ('rat-9059793','mem-7424153','mem-8618305','cool!',3);
insert into ratings values ('rat-9418915','mem-8045504','mem-5674753','',3);
insert into ratings values ('rat-7712936','mem-6707135','mem-6261940','',3);
insert into ratings values ('rat-9391413','mem-7733883','mem-3764964','slightly dirty, but fine',5);
insert into ratings values ('rat-2442054','mem-9042938','mem-4672564','cool!',4);
insert into ratings values ('rat-1672482','mem-6123422','mem-3725927','nice car',4);
insert into ratings values ('rat-2478968','mem-9238906','mem-1243151','',5);
insert into ratings values ('rat-9306204','mem-9916130','mem-1703083','',5);
insert into ratings values ('rat-8473237','mem-4267474','mem-7442928','',5);
insert into ratings values ('rat-4247178','mem-8185304','mem-9428037','',5);
insert into ratings values ('rat-1910162','mem-3470182','mem-1451150','',3);
insert into ratings values ('rat-2634945','mem-6261940','mem-5055691','cool!',4);
insert into ratings values ('rat-5875401','mem-4003334','mem-8747358','',5);
insert into ratings values ('rat-2133022','mem-7442928','mem-8550994','',4);
insert into ratings values ('rat-1490034','mem-2559009','mem-7295951','',1);
insert into ratings values ('rat-1636545','mem-5089917','mem-4796329','slightly dirty, but fine',3);
insert into ratings values ('rat-2714497','mem-8540471','mem-8961756','',3);
insert into ratings values ('rat-2781645','mem-7287474','mem-9185626','',4);
insert into ratings values ('rat-3286296','mem-9303023','mem-8181614','',3);
insert into ratings values ('rat-8044827','mem-2509055','mem-8649963','cool!',5);
insert into ratings values ('rat-7733858','mem-4948829','mem-1570790','',4);
insert into ratings values ('rat-9013666','mem-7781385','mem-1101746','cool!',4);
insert into ratings values ('rat-2558014','mem-3967691','mem-8550994','cool!',4);
insert into ratings values ('rat-2261406','mem-7382076','mem-7565092','',1);
insert into ratings values ('rat-5049142','mem-8252770','mem-3267423','',4);
insert into ratings values ('rat-2994263','mem-3716538','mem-3725927','',4);
insert into ratings values ('rat-7724803','mem-9303023','mem-2509055','',1);
insert into ratings values ('rat-6288133','mem-8802778','mem-9916130','',5);
insert into ratings values ('rat-6938330','mem-6261940','mem-5954620','',5);
insert into ratings values ('rat-2408278','mem-3565334','mem-9916130','would NOT recommend',4);
insert into ratings values ('rat-8111747','mem-2331394','mem-3470182','',4);
insert into ratings values ('rat-3413362','mem-3122499','mem-3455901','',1);
insert into ratings values ('rat-1184662','mem-6250900','mem-2257987','nice car',5);
insert into ratings values ('rat-9027560','mem-5670820','mem-6486914','',5);
insert into ratings values ('rat-6664714','mem-1243151','mem-9238906','nice car',4);
insert into ratings values ('rat-4690722','mem-7758431','mem-5961838','',5);
insert into ratings values ('rat-9543248','mem-7382076','mem-7733883','',5);
insert into ratings values ('rat-2354925','mem-7424153','mem-8185304','would NOT recommend',4);
insert into ratings values ('rat-3230486','mem-3470182','mem-3267423','slightly dirty, but fine',4);
insert into ratings values ('rat-5651689','mem-5605301','mem-6546690','would NOT recommend',5);
insert into ratings values ('rat-2709910','mem-2027330','mem-1541797','cool!',1);
insert into ratings values ('rat-8907905','mem-7257451','mem-6250900','would NOT recommend',3);
insert into ratings values ('rat-9324932','mem-4948829','mem-3967691','would NOT recommend',5);
insert into ratings values ('rat-9205115','mem-7565092','mem-4097319','',5);
insert into ratings values ('rat-6814245','mem-7318914','mem-1906036','',4);
insert into ratings values ('rat-1090186','mem-1612906','mem-4003334','',3);
insert into ratings values ('rat-1646205','mem-8747358','mem-9303023','',5);
insert into ratings values ('rat-7951820','mem-5670820','mem-1167206','',5);
insert into ratings values ('rat-4624068','mem-7287474','mem-1201687','would recommend',4);
insert into ratings values ('rat-3665843','mem-8954067','mem-2221918','would recommend',5);
insert into ratings values ('rat-2459159','mem-2758152','mem-8802778','',5);
insert into ratings values ('rat-8123736','mem-1860416','mem-1688422','would NOT recommend',5);
insert into ratings values ('rat-8526077','mem-6261940','mem-7318914','cool!',3);
insert into ratings values ('rat-5964995','mem-1988561','mem-8181614','slightly dirty, but fine',3);
insert into ratings values ('rat-8368732','mem-1906036','mem-4672564','',4);
insert into ratings values ('rat-4065169','mem-2964127','mem-8614720','',4);
insert into ratings values ('rat-7016595','mem-2426507','mem-1906036','would NOT recommend',5);
insert into ratings values ('rat-2243649','mem-8961756','mem-8618305','would NOT recommend',4);
insert into ratings values ('rat-3471426','mem-4764322','mem-3470182','',3);
insert into ratings values ('rat-7626244','mem-7257451','mem-1599896','would NOT recommend',5);
insert into ratings values ('rat-4215613','mem-9715334','mem-8045504','',5);
insert into ratings values ('rat-6229653','mem-7170618','mem-6546690','would NOT recommend',5);
insert into ratings values ('rat-6157642','mem-1599896','mem-3725927','cool!',5);
insert into ratings values ('rat-3736155','mem-1541797','mem-2677806','',4);
insert into ratings values ('rat-5620475','mem-3980469','mem-7382076','',5);
insert into ratings values ('rat-5930753','mem-3470182','mem-5654890','',5);
insert into ratings values ('rat-9395085','mem-7170618','mem-1167206','would recommend',5);
insert into ratings values ('rat-9238955','mem-6510063','mem-6437439','slightly dirty, but fine',5);
insert into ratings values ('rat-1087697','mem-9714080','mem-5670820','',4);
insert into ratings values ('rat-4524226','mem-3580873','mem-4267474','',5);
insert into ratings values ('rat-1157223','mem-1988561','mem-2758152','would NOT recommend',2);
insert into ratings values ('rat-4373298','mem-3267423','mem-1703083','nice car',4);
insert into ratings values ('rat-9140368','mem-1703083','mem-3798002','',5);
insert into ratings values ('rat-6472482','mem-3980469','mem-8961756','',5);
insert into ratings values ('rat-7451777','mem-8614720','mem-1541797','',4);
insert into ratings values ('rat-4615269','mem-9042938','mem-9916130','',5);
insert into ratings values ('rat-5262054','mem-4599833','mem-1003508','would NOT recommend',5);
insert into ratings values ('rat-4169528','mem-5284809','mem-5830958','',5);
insert into ratings values ('rat-1393596','mem-1003508','mem-5954620','would recommend',5);
insert into ratings values ('rat-1131065','mem-8747358','mem-3798002','would recommend',5);
insert into ratings values ('rat-3403707','mem-9629145','mem-2027330','slightly dirty, but fine',4);

insert into `messages` values ('mess-1493672','mem-7697934','mem-8252770','Hi');
insert into `messages` values ('mess-7293914','mem-4003334','mem-1101746','it is the first time i use this, how does it work?');
insert into `messages` values ('mess-6457367','mem-9767683','mem-5284809','cool car, I love it');
insert into `messages` values ('mess-7239200','mem-7424153','mem-5284809','Could you offer a discount?');
insert into `messages` values ('mess-2173423','mem-1988561','mem-6510063','How many people fit in the car?');
insert into `messages` values ('mess-9824053','mem-1988561','mem-1599896','Hey. How are you doing?');
insert into `messages` values ('mess-8064199','mem-1860416','mem-7020040','How many people fit in the car?');
insert into `messages` values ('mess-7578146','mem-3725927','mem-1988561','How many people fit in the car?');
insert into `messages` values ('mess-5118441','mem-5954620','mem-1525114','Hi');
insert into `messages` values ('mess-9980738','mem-7167156','mem-6510063','it is the first time i use this, how does it work?');