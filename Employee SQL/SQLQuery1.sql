create database Mohammed9

create table EMD (SSN int primary key, Fname varchar (50), Lname varchar (50), BD varchar (50), GN varchar (50))

create table Dept (Dnum int primary key, Dname varchar (50), Hiredate varchar (50))

create table project (Pnum int primary key, Pname varchar (50), Loc varchar (50))

create table workon (WH int )

create table Dependen (Dnum2 int primary key, GN varchar(50), BD date)


ALTER TABLE EMD
ADD SuperID int CONSTRAINT SuperID FOREIGN KEY (SSN)
REFERENCES EMD(SSN);


ALTER TABLE EMD
ADD Dnum int CONSTRAINT Dnumber FOREIGN KEY (SSN)
REFERENCES EMD(SSN);

ALTER TABLE Dept
ADD mangid int CONSTRAINT manageridd FOREIGN KEY (Dnum)
REFERENCES Dept(Dnum);

ALTER TABLE Dept
ADD managid int CONSTRAINT managerid FOREIGN KEY (Dnum)
REFERENCES Dept(Dnum);

create table Dept_Loc (Loc varchar (50) )

alter table Dept_Loc
add Dnum int constraint Dnumb Foreign key (Dnum)
REFERENCES Dept(Dnum);

select * from Dept_Loc

alter table Project
add Dnum int constraint Dnumbe Foreign key (Dnum)
REFERENCES Dept(Dnum)

select * from Dependen

alter table workon
add SSN int constraint SSNn Foreign key (SSN)
REFERENCES EMD(SSN)

alter table workon
add Pnum int constraint Pnumm Foreign key (Pnum)
REFERENCES project(Pnum)

use Mohammed9

alter table Dependen
add SSN int constraint SSNn2 Foreign key (SSN)
REFERENCES EMD(SSN)