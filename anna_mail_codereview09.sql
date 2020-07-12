SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*creating DATABASE*/

CREATE DATABASE IF NOT EXISTS `anna_mail_codereview09` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `anna_mail_codereview09`;

/*Table structure for table `sender`*/

CREATE TABLE `sender` (
 `sender_id` int(11) NOT NULL,
 `first_name` varchar(35) DEFAULT NULL,
 `last_name` varchar(35) DEFAULT NULL,
 `email` varchar(40) DEFAULT NULL,
 `fk_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `address`*/

CREATE TABLE `address` (
 `address_id` int(11) NOT NULL,
 `street` varchar(35) DEFAULT NULL,
 `house_num` int(9) DEFAULT NULL,
 `door_num` int(9) DEFAULT NULL,
 `zip` int(15) DEFAULT NULL,
 `phone` int(15) DEFAULT NULL,
 `type` ENUM('sender', 'receiver', 'postoffice', 'districenter') DEFAULT null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

/*Table structure for table `employee`*/

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8

/*Table structure for table `package`*/

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `weight` int(10) DEFAULT NULL,
  `fk_date_received` datetime DEFAULT NULL,
  `fk_sender_id` int(11) DEFAULT NULL,
  `fk_receiver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8

/*Table structure for table `distribution_center`*/

CREATE TABLE `distribution_center` (
  `distribution_id` int(11) NOT NULL,
  `fk_address_id` int(11) NOT NULL,
  `phone_distribution` int(15) DEFAULT NULL,
  `date_received` datetime DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8

/*Table structure for table `post_office`*/

CREATE TABLE `post_office` (
  `post_id` int(11) NOT NULL,
  `fk_address_id` int(11) NOT NULL,
  `phone_post` int(15) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8

/*Table structure for table `receiver`*/

CREATE TABLE `receiver` (
  `receiver_id` int(11) NOT NULL,
  `fk_address_id` int(11) NOT NULL,
  `first_name` varchar(35) DEFAULT NULL,
  `last_name` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8


/*defining primary and foreign key for table `sender`*/
ALTER TABLE `sender` ADD PRIMARY KEY( `sender_id`);
ALTER TABLE `sender` ADD FOREIGN KEY(`fk_address_id`) REFERENCES address(`address_id`);

/*defining primary for table `address*/
ALTER TABLE `address` ADD PRIMARY KEY( `address_id`);

/*defining primary key for table `employee`*/
ALTER TABLE `employee` ADD PRIMARY KEY( `employee_id`);

/*defining primary and foreign key for table `package`*/
ALTER TABLE `package` ADD PRIMARY KEY( `package_id`);
ALTER TABLE `package` ADD FOREIGN KEY(`fk_sender_id`) REFERENCES sender(`sender_id`);
ALTER TABLE `package` ADD FOREIGN KEY(`fk_receiver_id`) REFERENCES receiver(`receiver_id`);
ALTER TABLE `package` ADD FOREIGN KEY(`fk_distribution_id`) REFERENCES distribution_center(`distribution_id`);

/*defining primary and foreign key for table `distribution_center`*/
ALTER TABLE `distribution_center` ADD PRIMARY KEY( `distribution_id`);
ALTER TABLE `distribution_center` ADD FOREIGN KEY(`fk_address_id`) REFERENCES address(`address_id`);
ALTER TABLE `distribution_center` ADD FOREIGN KEY(`fk_package_id`) REFERENCES package(`package_id`);
ALTER TABLE `distribution_center` ADD FOREIGN KEY(`fk_employee_id`) REFERENCES employee(`employee_id`);
ALTER TABLE `distribution_center` ADD FOREIGN KEY(`fk_sender_id`) REFERENCES sender(`sender_id`);
ALTER TABLE `distribution_center` ADD FOREIGN KEY(`fk_receiver_id`) REFERENCES receiver(`receiver_id`);

/*defining primary and foreign key for table `distribution_center`*/
ALTER TABLE `post_office` ADD PRIMARY KEY( `post_id`);
ALTER TABLE `post_office` ADD FOREIGN KEY(`fk_address_id`) REFERENCES address(`address_id`);
ALTER TABLE `post_office` ADD FOREIGN KEY(`fk_package_id`) REFERENCES package(`package_id`);
ALTER TABLE `post_office` ADD FOREIGN KEY(`fk_employee_id`) REFERENCES employee(`employee_id`);

/*defining primary and foreign key for table `receiver`*/
ALTER TABLE `receiver` ADD PRIMARY KEY( `receiver_id`);
ALTER TABLE `receiver` ADD FOREIGN KEY(`fk_address_id`) REFERENCES address(`address_id`);


/* setting values for table `address`*/

INSERT INTO address VALUES(1,'kampstrasse',10,2,1200,87348274,'postoffice');
INSERT INTO address VALUES(2,'burgasse',10,1,1700,82423453,'postoffice');
INSERT INTO address VALUES(3,'ringstrasse',24,13,1100,7323823,'postoffice');
INSERT INTO address VALUES(4,'qualquerstrasse',42,16,1500,83711423,'districenter');
INSERT INTO address VALUES(5,'tremstrasse',74,3,1220,8337126437,'districenter');
INSERT INTO address VALUES(6,'maisumastrasse',59,29,1900,889493827,'districenter');
INSERT INTO address VALUES(7,'outrastrasse',652,40,1300,87520294,'sender');
INSERT INTO address VALUES(8,'naoparastrasse',344,38,1400,889058374,'sender');
INSERT INTO address VALUES(9,'qualquerstrasse',84,30,1210,80392873,'sender');
INSERT INTO address VALUES(10,'decimastrasse',10,10,1000,81010101,'receiver');
INSERT INTO address VALUES(11,'naoacaboustrasse',420,2,1700,83828403,'receiver');
INSERT INTO address VALUES(12,'acaboustrasse',132,51,1800,83939328,'receiver');

/* setting values for table `sender`*/

INSERT INTO sender VALUES(1,'Anna','Costa','anna@gmail.com',7);
INSERT INTO sender VALUES(2,'Pedro','Lima','pedro@gmail.com',8);
INSERT INTO sender VALUES(3,'Maria','Bethania','maria@gmail.com',9);

/* setting values for table `employee`*/

INSERT INTO employee VALUES(1,'Carlos','Britto','1989/02/01','2017/12/04');
INSERT INTO employee VALUES(2,'Chico','Holanda',,'1990/04/28', '2019/05/30');
INSERT INTO employee VALUES(3,'Caetano','Veloso',,'1977/01/15','2018/10/16');

/* setting values for table `receiver`*/

INSERT INTO receiver VALUES(1,10,'Paulo','Domingues');
INSERT INTO receiver VALUES(2,11,'Izabella','Freitas');
INSERT INTO receiver VALUES(3,12,'Eunice','Carlota');

/* setting values for table `distribution_center`*/

INSERT INTO distribution_center(`distribution_id`, `fk_address_id`, `phone_distribution`,`date_received`,`fk_employee_id`)
VALUES (1, 4, 38383838,'2018-02-09 10:11:50', 1);
INSERT INTO distribution_center(`distribution_id`, `fk_address_id`, `phone_distribution`,`date_received`,`fk_employee_id`)
VALUES (2, 5, 33998764,'2019-10-10 08:45:03', 2);
INSERT INTO distribution_center(`distribution_id`, `fk_address_id`, `phone_distribution`,`date_received`,`fk_employee_id`)
VALUES (3, 6, 30392846,'2010-04-22 08:54:30', 3);

/* setting values for table `package`*/

INSERT INTO package VALUES(1,'2018-02-07 11:32:10',05,1,1,1);
INSERT INTO package VALUES(2,'2019-10-08 08:15:03',3,2,2,2);
INSERT INTO package VALUES(3,'2010-04-20 10:05:40',2,3,3,3);

/* setting fk_PACKAGE_ID, `fk_receiver_id`, `fk_sender_id` for table `distribution_center`*/

INSERT INTO distribution_center(`fk_package_id`)
VALUES (1);
INSERT INTO distribution_center(`fk_package_id`)
VALUES (2);
INSERT INTO distribution_center(`fk_package_id`)
VALUES (3);


UPDATE `distribution_center` SET `fk_receiver_id` = '1' WHERE `distribution_center`.`distribution_id` = 1;
UPDATE `distribution_center` SET `fk_receiver_id` = '2' WHERE `distribution_center`.`distribution_id` = 2;
UPDATE `distribution_center` SET `fk_receiver_id` = '3' WHERE `distribution_center`.`distribution_id` = 3;
UPDATE `distribution_center` SET `fk_sender_id` = '1' WHERE `distribution_center`.`distribution_id` = 1;
UPDATE `distribution_center` SET `fk_sender_id` = '2' WHERE `distribution_center`.`distribution_id` = 2;
UPDATE `distribution_center` SET `fk_sender_id` = '3' WHERE `distribution_center`.`distribution_id` = 3;

/* setting values for table `post_office`*/

INSERT INTO post_office VALUES(1,1,60795849,1,1);
INSERT INTO post_office VALUES(2,2,69472547,2,2);
INSERT INTO post_office VALUES(3,3,62535294,3,3);

