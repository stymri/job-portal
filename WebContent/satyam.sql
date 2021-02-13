-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.15-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- -----------------------------------------------------
-- Dumping database structure for satyam
CREATE DATABASE IF NOT EXISTS `satyam` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `satyam`;

CREATE TABLE IF NOT EXISTS `applyjob` (
  `jobid` int(11) NOT NULL,
  `umail` varchar(50) NOT NULL,
  KEY `FK__user` (`umail`),
  CONSTRAINT `FK__user` FOREIGN KEY (`umail`) REFERENCES `user` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `applyjob` (`jobid`, `umail`) VALUES
	(2, 'satyam@gmail.com');

CREATE TABLE IF NOT EXISTS `company` (
  `mail` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phno` varchar(10) NOT NULL,
  `info` varchar(1000) NOT NULL,
  `link` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) NOT NULL DEFAULT 'xxx',
  `pin` varchar(50) NOT NULL DEFAULT 'xxx',
  PRIMARY KEY (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `deletedapp` (
  `jobid` bigint(20) NOT NULL,
  `umail` varchar(50) NOT NULL,
  `msg` varchar(2000) NOT NULL,
  PRIMARY KEY (`umail`,`jobid`),
  KEY `FK_deletedapp_job` (`jobid`),
  CONSTRAINT `FK_deletedapp_job` FOREIGN KEY (`jobid`) REFERENCES `job` (`id`),
  CONSTRAINT `FK_deletedapp_user` FOREIGN KEY (`umail`) REFERENCES `user` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lastdate` varchar(50) NOT NULL,
  `cmail` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `criteria` varchar(100) NOT NULL,
  `salary` varchar(50) NOT NULL,
  `info` varchar(1000) NOT NULL,
  `state` varchar(50) NOT NULL DEFAULT 'xxx',
  PRIMARY KEY (`id`),
  CONSTRAINT `FK__company` FOREIGN KEY (`cmail`) REFERENCES `company` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `shortlistapp` (
  `jobid` bigint(20) NOT NULL,
  `umail` varchar(50) NOT NULL,
  `msg` varchar(2000) NOT NULL,
  PRIMARY KEY (`umail`,`jobid`),
  KEY `FK_shortlistapp_job` (`jobid`),
  CONSTRAINT `FK_shortlistapp_job` FOREIGN KEY (`jobid`) REFERENCES `job` (`id`),
  CONSTRAINT `FK_shortlistapp_user` FOREIGN KEY (`umail`) REFERENCES `user` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `shortlistapp` (`jobid`, `umail`, `msg`) VALUES
	(1, 'satyam@gmail.com', 'this message is send for the '),
	(2, 'satyam@gmail.com', 'ersrdesgdfgfvf');

CREATE TABLE IF NOT EXISTS `user` (
  `mail` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phno` varchar(10) DEFAULT NULL,
  `sex` varchar(6) NOT NULL DEFAULT 'male',
  `dateofbirth` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL DEFAULT 'xxx',
  `pin` varchar(6) NOT NULL DEFAULT '111111',
  PRIMARY KEY (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user` (`mail`, `password`, `name`, `phno`, `sex`, `dateofbirth`, `address`, `city`, `state`, `pin`) VALUES
	('satyam@gmail.com', '12345', 'satyam', '9555137514', 'male', '1996-06-26', 'Rz 1155 gali no 5/6 main sagar pur', 'new delhi', 'Delhi', '110046');

CREATE TABLE IF NOT EXISTS `userexp` (
  `mail` varchar(50) NOT NULL,
  `educational` varchar(1) NOT NULL,
  `sno` int(10) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  `expname` varchar(50) NOT NULL,
  `percentage` varchar(5) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pin` varchar(50) NOT NULL,
  KEY `mail` (`mail`),
  KEY `type` (`type`),
  KEY `expname` (`expname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `userexp` (`mail`, `educational`, `sno`, `type`, `expname`, `percentage`, `address`, `city`, `state`, `pin`) VALUES
	('satyam@gmail.com', 'n', 0, 'developer', 'self', '2', 'home', 'new', 'delhi', '110064'),
	('satyam@gmail.com', 'y', 3, 'B.Tech', 'usict', '72', 'hari', 'new', 'delhi', '110064'),
	('satyam@gmail.com', 'y', 1, '10th', 'R.p.v.v', '93', 'hari', 'new', 'delhi', '110064'),
	('satyam@gmail.com', 'y', 2, '12th', 'R.P.V.V', '90', 'hari nagar', 'new delhi', 'delhi', '110064');