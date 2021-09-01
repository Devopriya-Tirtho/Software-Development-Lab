create database edoctor;

--------doctor table------
create table DOCTOR
(
	dId int primary key,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Age dec NOT NULL,
	dLocation varchar(50) NOT NULL,
	Sector varchar(50) NOT NULL,
	ExperienceYear int NOT NULL,
	Number varchar(50) NOT NULL,
	Fee varchar(50) NOT NULL,
	dPassword varchar(50) NOT NULL,
	dEmail varchar(50) NOT NULL
)
drop table DOCTOR;
---------user table-------
create table users
(
	UserId int primary key,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Age dec NOT NULL,
	uLocation varchar(50) NOT NULL,
	Number varchar(50) NOT NULL,
	uPassword varchar(50) NOT NULL,
	uEmail varchar(50) NOT NULL
)

drop table users;

---------admin table-----
create table administrator
(
	aId int primary key,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	aPassword varchar(50) NOT NULL,
	aEmail varchar(50) NOT NULL
)

drop table administrator;

-----appointment table---

create table appointment
(
	appointmentId int primary key,
	appointmentDate date NOT NULL,
	appointmentTime time NOT NULL,
	dId int NOT NULL,
	FOREIGN KEY (dId) references DOCTOR(dId)
)
drop table appointment;

--------blog table-------

create table blog
(
	blogId int primary key,
	blogText text,
	userid int,
	FOREIGN KEY (userId) references users(userId)
)
drop table blog;


-----Payment table-----
create table payment
(
	paymentId int primary key,
	paymentStatus char(1) ,  ---y/n-----
	dId int NOT NULL,
	FOREIGN KEY (dId) references DOCTOR(dId),
	userid int,
	FOREIGN KEY (userId) references users(userId)
)

drop table payment;

-------general remedies------
create table generalRemedies
(
	DiseaseName varchar(50),
	Severeness int,------1 to 5----
	Remedy text NOT NULL
)

drop table generalRemedies;

-----Prescription table-----

create table prescription
(
	prescriptionId int primary key,
	prescriptionText text,
	dId int NOT NULL,
	FOREIGN KEY (dId) references DOCTOR(dId),
	userid int,
	FOREIGN KEY (userId) references users(userId)
)

drop table prescription;

------medical history table------

create table medicalHistory
(
	prescriptionId int,
	FOREIGN KEY (prescriptionId) references prescription(prescriptionId),
	userid int,
	FOREIGN KEY (userId) references users(userId)
)
drop table medicalHistory;

-----confirmappointment----
create table confirmAppointment
(
	confirmAppointmentId int primary key,
	dId int NOT NULL,
	FOREIGN KEY (dId) references DOCTOR(dId),
	userId int,
	FOREIGN KEY (userId) references users(userId)

)
drop table confirmAppointment;

----select doctor----
create table selectDoctor
(
	selectDoctorId int primary key,
	dId int NOT NULL,
	FOREIGN KEY (dId) references DOCTOR(dId),
	userId int,
	FOREIGN KEY (userId) references users(userId)

)

----------queries-------------

---search by location---
select FirstName,LastName,Age,dLocation,Sector,Fee,ExperienceYear 
from DOCTOR
where dlocation=' ';

---search by sector---
select FirstName,LastName,Age,dLocation,Sector,Fee,ExperienceYear 
from DOCTOR
where Sector=' ';

---------filtering by fee-----

select FirstName,LastName,Age,dLocation,Sector,Fee,ExperienceYear 
from DOCTOR
where dlocation=' ' order by Fee ASC;

select FirstName,LastName,Age,dLocation,Sector,Fee,ExperienceYear 
from DOCTOR
where Sector=' ' order by Fee ASC;

-----filtering by experience year-----
select FirstName,LastName,Age,dLocation,Sector,Fee,ExperienceYear 
from DOCTOR
where dlocation=' ' order by ExperienceYear ASC;

select FirstName,LastName,Age,dLocation,Sector,Fee,ExperienceYear 
from DOCTOR
where Sector=' ' order by ExperienceYear ASC;

----appointment by location----

select appointmentDate,AppointmentTime
from appointment
where(select dId from DOCTOR where dLocation=' ')

UPDATE selectDoctor
SET dId = dId
WHERE( select dId from DOCTOR where dLocation=' ')

UPDATE selectDoctor
SET userId = userId
WHERE( select userId from users where userId='')-----------

----appointment by Experience----
select appointmentDate,AppointmentTime
from appointment
where(select dId from DOCTOR where Sector=' ')

UPDATE selectDoctor
SET dId = dId
WHERE( select dId from DOCTOR where ExperienceYear=' ')

UPDATE selectDoctor
SET userId = userId
WHERE( select userId from users where userId='')

----appointment confirm-----
UPDATE confirmAppointment
SET dId = dId
WHERE( select dId from DOCTOR where dLocation=' ')

UPDATE confirmAppointment
SET userId = userId
WHERE( select userId from selectDoctor where userID='' )------------

-----payment confirmation--------
UPDATE payment
SET paymentStatus=''------y/n------
where(select dID from confirmAppointment where userId='')
UPDATE payment
SET userId=userID
where(select userId from confirmAppointment where userId='')

----------prescription-------


---------medical history-------

-------general remedies-------