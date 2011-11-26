/*
SQLyog Community Edition- MySQL GUI v5.22a
Host - 5.0.19-nt : Database - Ufone Customer Information System
*********************************************************************
Server version : 5.0.19-nt
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `ufone`;

USE `ufone`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


/*DDL Commands */
/*Table structure for table `Customer` */

DROP TABLE IF EXISTS `Customer`;

CREATE TABLE Customer(
C_id   NUMBER(8) NOT NULL,
C_nic  VARCHAR2(12) NOT NULL,
C_name  VARCHAR2(24)NOT NULL,
C_fname VARCHAR2(2),
C_age    NUMBER(2),       
C_city   VARCHAR2(16),
c_email VARCHAR(20) NOT NULL,
CONSTRAINT diff_email UNIQUE(c_email),
CONSTRAINT cid_pk PRIMARY KEY(C_ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE AUTO_INCREMENT for a column cid_seq
       INCREMENT BY 1
       START WITH 1
       MAXVALUE 10000
       NOCACHE
       NOCYCLE;



/*Table structure for table `Mobile_info` */

DROP TABLE IF EXISTS `Mobile_Info`;



CREATE TABLE Mobile_Info(
Mob_num   NUMBER(8) NOT NULL,
Ref_name  VARCHAR2(12),
Ref_nic    NUMBER(12),       
Ref_phnum NUMBER(8),
CONSTRAINT mobile_num PRIMARY KEY(Mob_num),
C_ID       NUMBER(8),
CONSTRAINT ccid_fk FOREIGN KEY (c_id) REFERENCES Customer(c_id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


/*Table structure for table `Service_Class` */

DROP TABLE IF EXISTS `Service_Class`;

CREATE TABLE Service_Class(
P_id   NUMBER(8) NOT NULL,
P_name  VARCHAR2(12) NOT NULL,
GPRS  VARCHAR2(24)NOT NULL,
MMS VARCHAR2(2),
CONSTRAINT pid_pk PRIMARY KEY(P_ID),
mob_num     NUMBER(8),
CONSTRAINT mobnum FOREIGN KEY (mob_num) REFERENCES mobile_info(mob_num)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;




/*Table structure for table `Sim_Info` */

DROP TABLE IF EXISTS `Sim_Info`;


CREATE TABLE Sim_Info
( Sim# Number(8) NOT NULL,
  mob_num NUMBER(8),
  cust_type VARCHAR2(12),
  Prom_code NUMBER(8),
  Waiver_Code Number(8),
 CONSTRAINT simnum_pk PRIMARY KEY (Sim#),
 CONSTRAINT mobnum_fk FOREIGN KEY (mob_num) REFERENCES Mobile_Info(mob_num)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



/*DML Commands */

/* insert commands */

INSERT INTO Customer( C_ID, C_NIC, C_NAME, C_FNAME, C_AGE, C_CITY, C_EMAIL )
VALUES(cid_seq.Nextval,5131513153,'Sami Baig',NULL,20,'Islamabad','sami_baaig');

INSERT INTO Mobile_Info( Mob_Num, Ref_Name, Ref_NIC, Ref_Phnum, C_ID)
VALUES(34347908,'Saba',1234567,33190933,cid_seq.CURRVAL);

INSERT INTO service_class
Values(200,'Pre-Paid','Y','N',34347908);


Insert into Sim_info
VALUES(790,34347908,'Active',900,532);

/*alter commands  */

ALTER table customer
ADD Constraint cnic_unique UNIQUE(c_nic);

ALTER TABLE Customer
ADD (c_email VARCHAR(20));

ALTER table customer 
Modify (c_fname  VARCHAR2(24));

Alter table Customer
drop Column c_ufonenum;

ALTER TABLE Customer
ADD CONSTRAINT pid_fk FOREIGN KEY(P_id) REFERENCES Service_class(P_id);

ALTER TABLE Service_Class
ADD CONSTRAINT cust_fk FOREIGN KEY (C_id) REFERENCES Customer(C_id);

ALTER TABLE Customer
ADD CONSTRAINT diff_num UNIQUE(c_ufonenum);

ALTER table Customer
ADD mob_num  NUMBER(10);

ALTER TABLE Customer
ADD CONSTRAINT MobInfo_fk FOREIGN KEY (Mob_num) REFERENCES Mobile_Info(Mob_num);

/* update commands */
Update customer
set c_fname='Zafar'
where c_id=3;

UPDATE Mobile_Info
SET REF1_NIC=2567893
Where mob_num=3439479083;




 

