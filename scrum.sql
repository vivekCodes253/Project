DROP DATABASE  IF EXISTS scrum;
CREATE DATABASE scrum;
USE scrum;

-- Drop Commands
DROP TABLE  IF EXISTS employees;
DROP TABLE   IF EXISTS employeemail;
DROP TABLE  IF EXISTS task_details;
DROP TABLE  IF EXISTS update_details;
DROP TABLE  IF EXISTS login;

-- Create Commands
CREATE TABLE employees(soeid varchar(10) PRIMARY KEY,name varchar(50),role varchar(15),sec_scrum varchar(3),manager_soeid varchar(10),project_id varchar(10));
CREATE TABLE employeemail(soeid varchar(10),email_id varchar(30));
CREATE TABLE task_details(jira_no varchar(10) PRIMARY KEY,task_name varchar(50),owner varchar(10),start_date date, end_date date,task_status varchar(30),update_space varchar(100));
CREATE TABLE update_details(jira_no varchar(20),owner varchar(20),update_space text);
CREATE TABLE login(username varchar(10) PRIMARY KEY, password varchar(20));


-- Foreign Key Additions
ALTER TABLE employees ADD foreign key fk_id(manager_soeid) REFERENCES employees(soeid) ON DELETE SET NULL;
ALTER TABLE employeemail ADD foreign key fk_soeid(soeid) REFERENCES employees(soeid);
ALTER TABLE task_details ADD foreign key fk_owner(owner) REFERENCES employees(soeid);
ALTER TABLE login ADD foreign key fk_user(username) REFERENCES employees(soeid);


-- Insert Into Table employees
INSERT INTO employees(soeid,name,role,sec_scrum) VALUES('rr67654','Radha Ravi','Head','NO');
INSERT INTO employees VALUES('bs65643','Bala Subramanian','Manager','NO','rr67654','FX1234');
INSERT INTO employees VALUES('sr63573','Seetha Rajan','Dev','NO','bs65643','FX1234');
INSERT INTO employees VALUES('rs63572','ramesh Sarvanan','DBDev','NO','bs65643','FX1234');
INSERT INTO employees VALUES('vj69875','Vijay Jaganadhan','QA','NO','bs65643','FX1234');
INSERT INTO employees VALUES('sp62345','Shreya Prakash','BA','NO','bs65643','FX1234');
INSERT INTO employees VALUES('AT0001','ADEEB','Manager','NO','RR67654','XYZ1');
INSERT INTO employees VALUES('CD12435','Chandana','Manager','NO','AT0001','XYZ21');
INSERT INTO employees VALUES('VR67457','Vivek','Manager','NO','AT0001','XYZ');
INSERT INTO employees VALUES('HS70899','Hemanth','Manager','NO','AT0001','XYZ21');



#--- Insert into employeemail
INSERT INTO employeemail VALUES('VR67457','rvivek253@gmail.com');
INSERT INTO employeemail VALUES('HS70899','hemanths8991@gmail.com');
INSERT INTO employeemail Values('CD12435','samyu.vj97@gmail.com');
INSERT INTO employeemail Values('sp62345','harichandana5555@gmail.com');
INSERT INTO employeemail Values('vj69875','bhavanakamaraj@gmail.com');

-- Insert into Task_details


INSERT INTO task_details VALUES('ET1234','Trade testing','vj69875','2019-08-29','2019-09-03','Requirement Analysis','Types of Test cases are being considered');
INSERT INTO task_details VALUES('ET2000','Code commenting','VR67457','2019-08-31','2019-09-01','Thinking','Whats up?');
INSERT INTO task_details VALUES('ET2001','Extra','VR67457','2019-10-31','2019-11-01','Thinking','Whats up?');
INSERT INTO task_details VALUES('ET2002','Extra','VR67457','2019-7-29','2019-09-02','Thinking','Whats up?');
INSERT INTO task_details VALUES('ET2003','Extra','VR67457','2019-7-29','2020-09-02','Far off','Very far off');
INSERT INTO task_details VALUES('ET2004','Extra','VR67457','2019-7-29','2019-09-04','Far off','Kinda close');


-- Insert into Update_details

INSERT INTO update_details(jira_no,owner,update_space)  select jira_no , owner , update_space from Task_details;

-- Insert into login


INSERT INTO login VALUES('bs65643','12345');
INSERT INTO login VALUES('AT0001','123');

-- Procedures 

DROP PROCEDURE IF EXISTS getAllTask; 
DELIMITER //
CREATE PROCEDURE getAllTask(IN Manager_id varchar(10))
BEGIN
SELECT jira_no,task_name,owner,start_date,end_date,task_status,update_space 
FROM Task_details as t JOIN employees as e ON t.owner = e.soeid 
WHERE e.manager_soeid = Manager_id;
END//

-- display 
SELECT * FROM employees;
SELECT * FROM employeemail;
SELECT * FROM task_details;
SELECT * FROM update_details;
SELECT * FROM login;