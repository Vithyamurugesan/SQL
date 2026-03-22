use university;

Insert into students values('01','vithya','vithya44@gmail.com','2004-10-20','AIDS','4815654865','pnp','f','54');
Insert into students values('02','john','john@gmail.com','2005-10-6','AIDS','54846353165','salem','m','56');
INSERT INTO students
VALUES 
('03','priya','priya@gmail.com','2004-07-15','AIDS','9876543210','chennai','f','57'),
('04','arun','arun@gmail.com','2003-12-01','AIDS','9123456780','coimbatore','m','58'),
('05','divya','divya@gmail.com','2004-03-25','AIDS','9012345678','madurai','f','59');
select *from students;
update students set major='CSE';
update students set major='cse' where studentID='02';
update students set major='AIDS';


delete from students where address='pnp';
