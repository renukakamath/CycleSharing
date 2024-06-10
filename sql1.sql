/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - cycle_sharing
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cycle_sharing` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cycle_sharing`;

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `hours` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `booking` */

insert  into `booking`(`b_id`,`r_id`,`c_id`,`amount`,`hours`,`status`) values 
(1,1,1,'20','1','Paid'),
(2,1,1,'40','2','Dropped'),
(3,1,1,'40','2','Dropped'),
(4,1,1,'20','1','Dropped'),
(5,1,4,'40','2','Dropped');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `hours` varchar(100) DEFAULT NULL,
  `complaint` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`co_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`co_id`,`r_id`,`c_id`,`hours`,`complaint`) values 
(1,1,1,'2','fr');

/*Table structure for table `cycle` */

DROP TABLE IF EXISTS `cycle`;

CREATE TABLE `cycle` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `cycle_name` varchar(100) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `cycle` */

insert  into `cycle`(`c_id`,`o_id`,`s_id`,`latitude`,`longitude`,`cycle_name`,`image`,`status`) values 
(1,1,3,'9.988293036447752','76.28811836242676','bike','static/imagebbfeea0a-7749-4252-b50a-702ef7da4ebfdownload (4) - Copy.jfif','Avaliable'),
(4,1,4,'9.973963660249042','76.28810305294128','bike1','static/image8db941f2-6eb0-4091-979c-08c1a0b32d2fdownload.jfif','Avaliable');

/*Table structure for table `cycle_station` */

DROP TABLE IF EXISTS `cycle_station`;

CREATE TABLE `cycle_station` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(100) DEFAULT NULL,
  `no_of_cycle` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `cycle_station` */

insert  into `cycle_station`(`s_id`,`sname`,`no_of_cycle`,`location`) values 
(3,'kaloor','24','ernakulam'),
(2,'shop1','22','ernakulam1'),
(4,'mg road','1','ernakulam');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`user_type`) values 
(1,'admin','admin','admin'),
(2,'owner','owner','owner'),
(3,'rider','rider','Rider'),
(4,'hsjwj','hsjwjq','pending'),
(5,'anna','anna','Rider'),
(6,'staff','owner','owner'),
(7,'good','good','owner');

/*Table structure for table `owner` */

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `hname` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `owner` */

insert  into `owner`(`o_id`,`login_id`,`f_name`,`l_name`,`city`,`hname`,`street`) values 
(1,2,'owner','owner','Ernakulam','sdhkwaj','hsdkja'),
(2,6,'vendor','userrr','Ernakulam','skdw house dwandkjwa ndbja','nsdbkja house sndb shvd'),
(3,7,'vendor','userrr','Ernakulam','skdw house dwandkjwa ndbja','nsdbkja house sndb shvd');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(100) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `b_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`p_id`,`amount`,`r_id`,`date`,`b_id`) values 
(1,'20',1,'2022-12-31','1'),
(2,'40',1,'2022-12-31','2'),
(3,'40',1,'2022-12-31','3'),
(4,'40',1,'2022-12-31','3'),
(5,'40',1,'2022-12-31','2'),
(6,'20',1,'2022-12-31','4'),
(7,'40',1,'2022-12-31','5');

/*Table structure for table `rider` */

DROP TABLE IF EXISTS `rider`;

CREATE TABLE `rider` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `hname` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `rider` */

insert  into `rider`(`r_id`,`login_id`,`f_name`,`l_name`,`city`,`hname`,`street`,`latitude`,`longitude`) values 
(1,3,'sdafa','sdafa','dsfd','dfdf','dafwefew','9.976319','76.2862472'),
(2,4,'vghb','xnsns','bxjsjsj','hcwjjw','bdwjs','0','0'),
(3,5,'anna','mary','kottayam','abs','kottayam','0','0');

/*Table structure for table `wallet` */

DROP TABLE IF EXISTS `wallet`;

CREATE TABLE `wallet` (
  `w_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(100) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`w_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `wallet` */

insert  into `wallet`(`w_id`,`amount`,`r_id`) values 
(1,'220',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
