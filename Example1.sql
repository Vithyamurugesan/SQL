create database university;
use university;
Select database();
show databases;
create table Student(StudentID varchar(10),name varchar(50),email varchar(50),dob date,major varchar(20));
alter table Student add column phone varchar(15);
alter table Student add column (address varchar(100),gender char(1));
alter table Student add column departmentID varchar(10);
alter table Student drop column phone;
Select * from Student;
alter table Student modify address varchar(10);
alter table Student rename column phone To phonenumber;
alter table student rename to students;
select *from students;
drop table Student;
drop database University;

create table department(departmentID varchar(10) NOT NULL,name varchar(50) not null,building varchar(50));
drop table department;
create table department_details(departmentID varchar(10) NOT NULL unique,name varchar(50) not null,building varchar(50));
drop table department_details;
create table department1(departmentID varchar(10) Primary key,name varchar(50) not null,building varchar(50));

create table courses(courseID varchar(10) primary key,
                    title varchar(100) not null,
					credits int check(credits>0),
                    departmentID varchar(10),
					foreign key(departmentID) references department1(departmentID));
                    
create table department2(departmentID varchar(10),name varchar(50) not null,building varchar(50)default 'main block');

alter table department2 drop primary key;
                    
Alter table department2 
add constraint PK_department2 primary key(departmentID);











																																																																																																																																																																								










































































































































