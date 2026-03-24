create database testdb;
use testdb;
select * from studentdetails;

create table employee(E_Id INT PRIMARY KEY,Name Varchar(40),Dept Varchar(40));

Delimiter $$
Create procedure insert_employee(
			     In p_id int,
                 In p_name varchar(40),
                 In p_dept varchar(40)
)
Begin 
    insert into employee(E_Id,Name,Dept)
    values(p_id,p_name,p_dept);
    End $$
Delimiter ;
    
Show procedure status where Db='testdb';

-- 
Delimiter $$
create procedure get_all_employees()
Begin
    select *from employee;
End $$
delimiter ;


Delimiter $$
create procedure update_employee(
                IN p_id int,in p_dept varchar(40)
           )
begin
   update employee set Dept=p_dept where E_Id=p_id;
End $$
Delimiter ;

Delimiter $$
create procedure delete_employee(
                IN p_id int
                )
begin
   delete from employee where E_Id=p_id;
End $$
Delimiter ;


    
Show procedure status where Db='testdb';


Delimiter $$
Create procedure get_employee_by_id(
			     In p_id int,
                 out o_name varchar(40),
                 out o_dept varchar(40)
)
Begin 
   select Name,Dept INTO o_name,o_dept from employee where E_Id=p_id;
End $$
Delimiter ;





    




