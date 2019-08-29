CREATE DATABASE scrum;

Use scrum;

CREATE TABLE Employees(Soeid varchar(10) PRIMARY KEY,Name varchar(50),Role varchar(15),Sec_scrum varchar(3),Manager_Soeid varchar(10),Project_id varchar(10));
drop table Employees;
INSERT INTO employees(Soeid,Name,Role,Sec_Scrum) VALUES('rr67654','Radha Ravi','Head','NO');
SELECT *FROM Employees;
ALTER TABLE Employees ADD foreign key fk_id(Manager_Soeid) REFERENCES Employees(Soeid) ON DELETE SET NULL;
INSERT INTO employees VALUES('bs65643','Bala Subramanian','Manager','NO','rr67654','FX1234');
SELECT *FROM Employees;
INSERT INTO employees VALUES('sr63573','Seetha Rajan','Dev','NO','bs65643','FX1234');
INSERT INTO employees VALUES('rs63572','ramesh Sarvanan','DBDev','NO','bs65643','FX1234');
INSERT INTO employees VALUES('vj69875','Vijay Jaganadhan','QA','NO','bs65643','FX1234');
INSERT INTO employees VALUES('sp62345','Shreya Prakash','BA','NO','bs65643','FX1234');



CREATE TABLE login(Username varchar(10) PRIMARY KEY, Password varchar(20));
ALTER TABLE login ADD foreign key fk_user(Username) REFERENCES Employees(Soeid);
select *from login;
INSERT INTO login VALUES('bs65643','12345');
DROP TABLE login;


CREATE TABLE Task_details(Jira_no varchar(10) PRIMARY KEY,Task_name varchar(50),Owner varchar(10),start_date date, end_date date,Task_status varchar(30),update_space varchar(100));
ALTER TABLE task_details ADD foreign key fk_owner(Owner) REFERENCES Employees(Soeid);
INSERT INTO task_details VALUES('ET1234','Trade testing','vj69875','2019-08-29','2019-09-03','Requirement Analysis','Types of Test cases are being considered');
Select *from task_details;

