create database Hospital
use Hospital

create table patient (patid int primary key, number int , email varchar (50), gender varchar (50), Bloodgroup varchar (50), BD date)

create table Doctor (Docid int primary key, Stime time, Etime time, Schedule varchar (50), number int, email varchar (50), GD varchar (50), major varchar (50)) 

create table Appoinments (type varchar (55), status varchar (55), date date, noshow varchar (50), Schedule varchar(50), completed varchar (50), cancelled varchar (50)) 

create table Services (category_id int primary key, price int , name varchar (50), type varchar (50), category_name varchar (50))

create table paymethod (payment_id int primary key, amount int , Method varchar (50), payment_date date)

create table Insurance (Providername varchar (50))

create table records (Docid int, patid int,
foreign key (patid) references patient (patid),
foreign key (Docid) references Doctor (Docid))

create table Departments (Depname int primary key)

alter table Doctor
ADD Depname int CONSTRAINT Dnamee FOREIGN KEY (Docid)
REFERENCES Doctor(Docid);

alter table Departments
ADD Docid int CONSTRAINT Did FOREIGN KEY (Depname)
REFERENCES Departments(Depname);

drop table Insurance

create table Insurance (insurid int primary key,providername varchar(50), patid int,
foreign key (patid) references patient (patid))
