USE SCRUM;


DROP TABLE Employees;
CREATE TABLE Employees(Soeid varchar(10) PRIMARY KEY,Name varchar(50),Role varchar(15),Sec_scrum varchar(3),Manager_Soeid varchar(10),Project_id varchar(10));
ALTER TABLE Employees ADD foreign key fk_id(Manager_Soeid) REFERENCES Employees(Soeid) ON DELETE SET NULL;

INSERT INTO Employees VALUES('bs65643','Bala Subramanian','Manager','NO','rr67654','FX1234');
INSERT INTO Employees VALUES('sr63573','Seetha Rajan','Dev','NO','bs65643','FX1234');
INSERT INTO Employees VALUES('rs63572','ramesh Sarvanan','DBDev','NO','bs65643','FX1234');
INSERT INTO Employees VALUES('vj69875','Vijay Jaganadhan','QA','NO','bs65643','FX1234');
INSERT INTO Employees VALUES('sp62345','Shreya Prakash','BA','NO','bs65643','FX1234');
INSERT INTO Employees VALUES('VR67457','ADEEB','Manager','NO','AT0001','XYZ1');


#---
DROP TABLE EmployeeMail;
CREATE TABLE EmployeeMail(Soeid varchar(10),email_id varchar(30));
ALTER TABLE EmployeeMail ADD foreign key fk_soeid(Soeid) REFERENCES Employees(Soeid);

INSERT INTO EmployeeMail VALUES('VR67457','rvivek253@gmail.com');
INSERT INTO EmployeeMail VALUES('HS','hemanths8991@gmail.com');
INSERT INTO EmployeeMail Values('123','samyu.vj97@gmail.com');
#---

DROP TABLE Task_Detals;
CREATE TABLE Task_details(Jira_no varchar(10) PRIMARY KEY,Task_name varchar(50),Owner varchar(10),start_date date, end_date date,Task_status varchar(30),update_space varchar(100));
ALTER TABLE task_details ADD foreign key fk_owner(Owner) REFERENCES Employees(Soeid);

INSERT INTO task_details VALUES('ET1234','Trade testing','vj69875','2019-08-29','2019-09-03','Requirement Analysis','Types of Test cases are being considered');
INSERT INTO task_details VALUES('ET2000','Code commenting','VR67457','2019-08-31','2019-09-01','Thinking','Whats up?');
#---

DROP TABLE Update_Details;
CREATE TABLE update_details(Jira_no varchar(20),Owner varchar(20),update_space text);
INSERT INTO update_details(Jira_no,Owner,update_space)  select Jira_no , Owner , update_space from Task_details;

#---
DROP TABLE Login;
CREATE TABLE login(Username varchar(10) PRIMARY KEY, Password varchar(20));
ALTER TABLE login ADD foreign key fk_user(Username) REFERENCES Employees(Soeid);

INSERT INTO login VALUES('bs65643','12345');
INSERT INTO login VALUES('AT0001','123');

#---