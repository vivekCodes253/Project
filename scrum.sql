DROP DATABASE  IF EXISTS SCRUM;
CREATE DATABASE SCRUM;
USE SCRUM;

-- Drop Commands
DROP TABLE  IF EXISTS Employees;
DROP TABLE   IF EXISTS EmployeeMail;
DROP TABLE  IF EXISTS Task_Detals;
DROP TABLE  IF EXISTS Update_Details;
DROP TABLE  IF EXISTS Login;

-- Create Commands
CREATE TABLE Employees(Soeid varchar(10) PRIMARY KEY,Name varchar(50),Role varchar(15),Sec_scrum varchar(3),Manager_Soeid varchar(10),Project_id varchar(10));
CREATE TABLE EmployeeMail(Soeid varchar(10),email_id varchar(30));
CREATE TABLE Task_details(Jira_no varchar(10) PRIMARY KEY,Task_name varchar(50),Owner varchar(10),start_date date, end_date date,Task_status varchar(30),update_space varchar(100));
CREATE TABLE update_details(Jira_no varchar(20),Owner varchar(20),update_space text);
CREATE TABLE login(Username varchar(10) PRIMARY KEY, Password varchar(20));


-- Foreign Key Additions
ALTER TABLE Employees ADD foreign key fk_id(Manager_Soeid) REFERENCES Employees(Soeid) ON DELETE SET NULL;
ALTER TABLE EmployeeMail ADD foreign key fk_soeid(Soeid) REFERENCES Employees(Soeid);
ALTER TABLE task_details ADD foreign key fk_owner(Owner) REFERENCES Employees(Soeid);
ALTER TABLE login ADD foreign key fk_user(Username) REFERENCES Employees(Soeid);


-- Insert Into Table Employees
INSERT INTO employees(Soeid,Name,Role,Sec_Scrum) VALUES('rr67654','Radha Ravi','Head','NO');
INSERT INTO Employees VALUES('bs65643','Bala Subramanian','Manager','NO','rr67654','FX1234');
INSERT INTO Employees VALUES('sr63573','Seetha Rajan','Dev','NO','bs65643','FX1234');
INSERT INTO Employees VALUES('rs63572','ramesh Sarvanan','DBDev','NO','bs65643','FX1234');
INSERT INTO Employees VALUES('vj69875','Vijay Jaganadhan','QA','NO','bs65643','FX1234');
INSERT INTO Employees VALUES('sp62345','Shreya Prakash','BA','NO','bs65643','FX1234');
INSERT INTO Employees VALUES('AT0001','ADEEB','Manager','NO','RR67654','XYZ1');
INSERT INTO Employees VALUES('CD12435','Chandana','Manager','NO','AT0001','XYZ21');
INSERT INTO Employees VALUES('VR67457','Vivek','Manager','NO','AT0001','XYZ');
INSERT INTO Employees VALUES('HS70899','Hemanth','Manager','NO','AT0001','XYZ21');



#--- Insert into Employeemail
INSERT INTO EmployeeMail VALUES('VR67457','rvivek253@gmail.com');
INSERT INTO EmployeeMail VALUES('HS70899','hemanths8991@gmail.com');
INSERT INTO EmployeeMail Values('CD12435','samyu.vj97@gmail.com');
INSERT INTO EmployeeMail Values('sp62345','harichandana5555@gmail.com');
INSERT INTO EmployeeMail Values('vj69875','bhavanakamaraj@gmail.com');

-- Insert into Task_details


INSERT INTO task_details VALUES('ET1234','Trade testing','vj69875','2019-08-29','2019-09-03','Requirement Analysis','Types of Test cases are being considered');
INSERT INTO task_details VALUES('ET2000','Code commenting','VR67457','2019-08-31','2019-09-01','Thinking','Whats up?');
INSERT INTO task_details VALUES('ET2001','Extra','VR67457','2019-10-31','2019-11-01','Thinking','Whats up?');
INSERT INTO task_details VALUES('ET2002','Extra','VR67457','2019-7-29','2019-09-02','Thinking','Whats up?');
INSERT INTO task_details VALUES('ET2003','Extra','VR67457','2019-7-29','2020-09-02','Far off','Very far off');
INSERT INTO task_details VALUES('ET2004','Extra','VR67457','2019-7-29','2019-09-04','Far off','Kinda close');


-- Insert into Update_details

INSERT INTO update_details(Jira_no,Owner,update_space)  select Jira_no , Owner , update_space from Task_details;

-- Insert into Login


INSERT INTO login VALUES('bs65643','12345');
INSERT INTO login VALUES('AT0001','123');

-- Procedures 

DROP PROCEDURE IF EXISTS getAllTask; 
DELIMITER //
CREATE PROCEDURE getAllTask(IN Manager_id varchar(10))
BEGIN
SELECT jira_no,task_name,owner,start_date,end_date,task_status,update_space 
FROM Task_details as t JOIN Employees as e ON t.owner = e.Soeid 
WHERE e.Manager_Soeid = Manager_id;
END//

-- display 
SELECT * FROM employees;
SELECT * FROM EmployeeMail;
SELECT * FROM task_details;
SELECT * FROM update_details;
SELECT * FROM login;